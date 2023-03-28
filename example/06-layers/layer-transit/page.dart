import 'package:google_maps/google_maps.dart';
import 'package:universal_html/html.dart';

void main() {
  final myLatlng = LatLng(51.501904, -0.115871);
  final mapOptions = MapOptions()
    ..zoom = 13
    ..center = myLatlng;
  final map =
      GMap(document.getElementById('map-canvas') as HtmlElement, mapOptions);

  TransitLayer().map = map;
}
