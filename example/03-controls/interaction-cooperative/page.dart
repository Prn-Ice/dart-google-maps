import 'package:google_maps/google_maps.dart';
import 'package:universal_html/html.dart';

void main() {
  GMap(
    document.getElementById('map') as HtmlElement,
    MapOptions()
      ..zoom = 4
      ..center = LatLng(-25.363, 131.044)
      ..gestureHandling = 'cooperative',
  );
}
