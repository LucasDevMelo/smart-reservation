import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:healthcare/models/all_restaurants.dart';
import 'package:healthcare/screens/map_details.dart';
import 'package:healthcare/screens/map_screen.dart';
import 'package:healthcare/models/restaurants.dart';


class MapController extends ChangeNotifier {

  double lat = -15.790454601933027;
  double long = -47.891011664793766;
  String erro = '';
  Set<Marker> markers = Set<Marker>();
  late GoogleMapController _mapsController;

  // PostosController() {
  //   getPosicao();
  // }
  get mapsController => _mapsController;

  Future<void> onMapCreated(GoogleMapController controller) async {
    _mapsController = controller;
    String style = await rootBundle.loadString('assets/map_style.json');
    _mapsController.setMapStyle(style);
    await getPosicao();
    await loadMaps();
  }

  loadMaps() {
    final restaurantsData = AllRestaurants().restaurantsData;
    restaurantsData.forEach((restaurant) async {

      final location = restaurant.maps.first;

      markers.add(
        Marker(
          markerId: MarkerId(restaurant.name),
          position: LatLng(location.latitude, location.longitude),
          icon: await BitmapDescriptor.fromAssetImage(
            ImageConfiguration(),
            'images/pinmap.png',
          ),
          onTap: () => {
            showModalBottomSheet(
              context: appKey.currentState!.context,
              builder: (context) => MapDetails(map: restaurant, restaurant: restaurant,),
            )
          },
        ),
      );
    });
    notifyListeners();
  }

  getPosicao() async {
    try {
      Position posicao = await _posicaoAtual();
      lat = posicao.latitude;
      long = posicao.longitude;
      _mapsController.animateCamera(CameraUpdate.newLatLng(LatLng(lat, long)));
    } catch (e) {
      erro = e.toString();
    }
    notifyListeners();
  }

  Future<Position> _posicaoAtual() async {
    LocationPermission permissao;

    bool ativado = await Geolocator.isLocationServiceEnabled();
    if (!ativado) {
      return Future.error('Por favor, habilite a localização no smartphone');
    }

    permissao = await Geolocator.checkPermission();
    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();
      if (permissao == LocationPermission.denied) {
        return Future.error('Você precisa autorizar o acesso à localização');
      }
    }

    if (permissao == LocationPermission.deniedForever) {
      return Future.error('Você precisa autorizar o acesso à localização');
    }

    return await Geolocator.getCurrentPosition();
  }
}