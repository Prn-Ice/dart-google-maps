// Copyright (c) 2012, Alexandre Ardhuin
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

library google_maps_visualization;

import 'package:js/js.dart' as js;
import 'js_wrap.dart' as jsw;
import 'google_maps.dart';

class HeatmapLayer extends MVCObject {
  HeatmapLayer([HeatmapLayerOptions opts]) : super.newInstance(maps.visualization.HeatmapLayer, [opts]);
  HeatmapLayer.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  MVCArray<Object> get data => $.getData().map((js.Proxy jsProxy) => new MVCArray.fromJsProxy(jsProxy, (js.Proxy jsProxy) {
    if (jsProxy == null) {
      return jsProxy;
    } else if (js.instanceof(jsProxy, maps.LatLng)) {
      return new LatLng.fromJsProxy(jsProxy);
    } else {
      return new WeightedLocation.fromJsProxy(jsProxy);
    }
  })).value;
  GMap get map => $.getMap().map(GMap.INSTANCIATOR).value;
  set data(Object data) {
    List list;
    if (data is MVCArray) {
      list = data.getArray();
    } else if (data is List) {
      list = data;
    }
    if (data != null && list == null) {
      throw new UnsupportedError("Parameter must be of type MVCArray or List");
    }
    if (!list.filter((e)=> !(e is LatLng || e is WeightedLocation)).isEmpty) {
      throw new UnsupportedError("some elements are not LatLng or WeightedLocation");
    }
    $.setData(data);
  }
  set map(GMap map) => $.setMap(map);
  set options(HeatmapLayerOptions options) => $.setOptions(options);
}

class HeatmapLayerOptions extends jsw.IsJsProxy {
  set data(MVCArray<LatLng> data) => $.data = data;
  set dissipating(bool dissipating) => $.dissipating = dissipating;
  set gradient(List<String> gradient) => $.gradient = gradient;
  set map(GMap map) => $.map = map;
  set maxIntensity(num maxIntensity) => $.maxIntensity = maxIntensity;
  set opacity(num opacity) => $.opacity = opacity;
  set radius(num radius) => $.radius = radius;
}

class WeightedLocation extends jsw.IsJsProxy {
  WeightedLocation() : super();
  WeightedLocation.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  LatLng get location => $.location.map(LatLng.INSTANCIATOR).value;
  set location(LatLng location) => $.location = location;
  num get weight => $.weight.value;
  set weight(num weight) => $.weight = weight;
}