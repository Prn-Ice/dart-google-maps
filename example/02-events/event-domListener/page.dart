import 'package:google_maps/google_maps.dart';
import 'package:universal_html/html.dart' hide Events;

void main() {
  final mapDiv = document.getElementById('map') as HtmlElement;
  GMap(
    mapDiv,
    MapOptions()
      ..zoom = 8
      ..center = LatLng(-34.397, 150.644),
  );

  // We add a DOM event here to show an alert if the DIV containing the
  // map is clicked.
  Event.addDomListener(mapDiv, 'click', (e) {
    window.alert('DIV clicked');
  });
}
