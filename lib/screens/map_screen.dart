import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:healthcare/models/map_controller.dart';
import 'package:provider/provider.dart';
import 'package:healthcare/models/restaurants.dart';


final appKey = GlobalKey();

class MapScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: appKey,
      appBar: AppBar(
        title: Text('Mapa'),
      ),
      body: ChangeNotifierProvider<MapController>(
        create: (context) => MapController(),
        child: Builder(builder: (context) {
          final local = context.watch<MapController>();

          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(local.lat, local.long),
              zoom: 15,
            ),
            zoomControlsEnabled: true,
            mapType: MapType.normal,
            myLocationEnabled: true,
            onMapCreated: local.onMapCreated,
            markers: local.markers,
          );
        }),
      ),
    );
  }
}