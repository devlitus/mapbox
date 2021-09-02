import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map/themes/uber_themes_map.dart';
import 'package:meta/meta.dart';

part 'maps_event.dart';
part 'maps_state.dart';

class MapsBloc extends Bloc<MapsEvent, MapsState> {
  MapsBloc() : super(MapsState());

  late GoogleMapController _mapController;

  void initialMap(GoogleMapController controller) {
    if (!state.initMap) {
      this._mapController = controller;
      this._mapController.setMapStyle(jsonEncode(uberMapTheme));
      add(OnLoadedMap());
    }
  }

  void moveCamera(LatLng destination) {
    final cameraUpdate = CameraUpdate.newLatLng(destination);
    this._mapController.animateCamera(cameraUpdate);
  }

  @override
  Stream<MapsState> mapEventToState(MapsEvent event) async* {
    if (event is OnLoadedMap) {
      yield state.copyWith(initMap: true);
    }
  }
}
