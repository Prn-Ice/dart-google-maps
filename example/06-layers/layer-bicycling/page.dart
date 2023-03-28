import 'package:google_maps/google_maps.dart';
import 'package:universal_html/html.dart';

void main() {
  final myLatlng = LatLng(42.3726399, -71.1096528);
  final mapOptions = MapOptions()
    ..zoom = 14
    ..center = myLatlng;
  final map =
      GMap(document.getElementById('map-canvas') as HtmlElement, mapOptions);

  BicyclingLayer().map = map;
}
