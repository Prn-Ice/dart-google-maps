import 'package:google_maps/google_maps.dart';
import 'package:universal_html/html.dart' hide Rectangle;

void main() {
  final mapOptions = MapOptions()
    ..center = LatLng(44.5452, -78.5389)
    ..zoom = 9;
  final map =
      GMap(document.getElementById('map-canvas') as HtmlElement, mapOptions);

  final bounds = LatLngBounds(LatLng(44.490, -78.649), LatLng(44.599, -78.443));

  Rectangle(RectangleOptions()
        ..bounds = bounds
        ..editable = true)
      .map = map;
}
