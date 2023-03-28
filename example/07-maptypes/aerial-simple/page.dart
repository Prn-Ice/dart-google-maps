import 'package:google_maps/google_maps.dart';
import 'package:universal_html/html.dart';

void main() {
  final mapOptions = MapOptions()
    ..center = LatLng(36.964645, -122.01523)
    ..zoom = 18
    ..mapTypeId = MapTypeId.SATELLITE;
  GMap(document.getElementById('map-canvas') as HtmlElement, mapOptions).tilt =
      45;
}
