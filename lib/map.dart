import 'package:flutter/material.dart';
// import 'package:map_view/map_view.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class MyMap extends StatelessWidget {
  String apiKey;
  MyMap(this.apiKey);

  @override
  Widget build(BuildContext context) {
  /*
    var _mapView = new MapView();

      showMap(context) {
        _mapView.show(
            new MapOptions(
                mapViewType: MapViewType.terrain,
                showUserLocation: true,
                showMyLocationButton: true,
                showCompassButton: true,
                initialCameraPosition:
                new CameraPosition(new Location(5.6404963, -0.2285315), 15.0),
                hideToolbar: true)
        );

        // Get notified when the map is ready
        _mapView.onMapReady.listen((_) {

        });
      };
  */

    return new FlutterMap(
        options: new MapOptions(
            center: new LatLng(-31.647168, -60.700075), // Corporate Tower
            zoom: 15.0,
            ),
        layers: [
          new TileLayerOptions(
              urlTemplate: "https://api.tiles.mapbox.com/v4/"
                  "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
              additionalOptions: {
                'accessToken': apiKey,
                'id': 'mapbox.streets',
              },
              ),
          new MarkerLayerOptions(
              markers: [
                new Marker(
                    width: 80.0,
                    height: 80.0,
                    point: new LatLng(51.5, -0.09),
                    builder: (ctx) =>
                    new Container(
                        child: new FlutterLogo(),
                        ),
                    ),
              ],
              ),
        ],
        );

  }
}
