import 'package:google_maps/google_maps.dart';
import 'package:universal_html/html.dart';

void main() {
  GMap(
    document.getElementById('map') as HtmlElement,
    MapOptions()
      ..zoom = 8
      ..center = LatLng(35.717, 139.731),
  );
}
