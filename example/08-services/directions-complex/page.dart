import 'package:google_maps/google_maps.dart';
import 'package:universal_html/html.dart';

late GMap map;
late DirectionsRenderer directionsDisplay;
late DirectionsService directionsService;
late InfoWindow stepDisplay;
final markerArray = <Marker>[];

void main() {
  // Instantiate a directions service.
  directionsService = DirectionsService();

  // Create a map and center it on Manhattan.
  final manhattan = LatLng(40.7711329, -73.9741874);
  final mapOptions = MapOptions()
    ..zoom = 13
    ..center = manhattan;
  map = GMap(document.getElementById('map-canvas') as HtmlElement, mapOptions);

  // Create a renderer for directions and bind it to the map.
  final rendererOptions = DirectionsRendererOptions()..map = map;
  directionsDisplay = DirectionsRenderer(rendererOptions);

  // Instantiate an info window to hold step text.
  stepDisplay = InfoWindow();

  document.getElementById('start')!.onChange.listen((e) => calcRoute());
  document.getElementById('end')!.onChange.listen((e) => calcRoute());
}

void calcRoute() {
  // First, remove any existing markers from the map.
  for (final marker in markerArray) {
    marker.map = null;
  }

  // Now, clear the array itself.
  markerArray.clear();

  // Retrieve the start and end locations and create
  // a DirectionsRequest using WALKING directions.
  final start = (document.getElementById('start') as SelectElement).value;
  final end = (document.getElementById('end') as SelectElement).value;
  final request = DirectionsRequest()
    ..origin = start
    ..destination = end
    ..travelMode = TravelMode.WALKING;

  // Route the directions and pass the response to a
  // function to create markers for each step.
  directionsService.route(request, (response, status) {
    if (status == DirectionsStatus.OK) {
      querySelector('#warnings_panel')!.innerHtml =
          '<b>${response!.routes![0]!.warnings}</b>';
      directionsDisplay.directions = response;
      showSteps(response);
    }
  });
}

void showSteps(DirectionsResult directionResult) {
  // For each step, place a marker, and add the text to the marker's
  // info window. Also attach the marker to an array so we
  // can keep track of it and remove it when calculating new
  // routes.
  final myRoute = directionResult.routes![0]!.legs![0]!;

  for (final step in myRoute.steps!) {
    final marker = Marker(MarkerOptions()
      ..position = step!.startLocation
      ..map = map);
    attachInstructionText(marker, step.instructions!);
    markerArray.add(marker);
  }
}

void attachInstructionText(Marker marker, String text) {
  marker.onClick.listen((e) {
    // Open an info window when the marker is clicked on,
    // containing the text of the step.
    stepDisplay.content = text;
    stepDisplay.open(map, marker);
  });
}
