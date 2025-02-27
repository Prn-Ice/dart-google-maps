import 'package:google_maps/google_maps.dart';
import 'package:universal_html/html.dart';

void main() {
  final myLatlng = LatLng(-25.363882, 131.044922);
  final mapOptions = MapOptions()
    ..zoom = 4
    ..center = myLatlng;
  final map =
      GMap(document.getElementById('map-canvas') as HtmlElement, mapOptions);

  Marker(MarkerOptions()
    ..position = myLatlng
    ..map = map
    ..title = 'Hello World!');
}
