import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map/bloc/maps/maps_bloc.dart';
import 'package:map/bloc/my_location/my_location_bloc.dart';
import 'package:map/widgets/widgets.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  void initState() {
    context.read<MyLocationBloc>().initFollowing();
    super.initState();
  }

  @override
  void dispose() {
    context.read<MyLocationBloc>().cancelFollowing();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<MyLocationBloc, MyLocationState>(
            builder: (context, state) => createMap(state),
          ),
          Positioned(
            top: 13,
            child: SearchBar(),
          ),
          ManualMaker(),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BtnLocation(),
        ],
      ),
    );
  }

  Widget createMap(MyLocationState state) {
    if (!state.existsLocation) return Center(child: Text('Loading...'));
    final blocMap = BlocProvider.of<MapsBloc>(context);
    final lat = state.location!.latitude;
    final lng = state.location!.longitude;
    final location = new LatLng(lat, lng);
    final initialCameraPosition = new CameraPosition(
      target: location,
      zoom: 15,
    );
    return GoogleMap(
      initialCameraPosition: initialCameraPosition,
      compassEnabled: true,
      myLocationButtonEnabled: false,
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      onMapCreated: blocMap.initialMap,
    );
  }
}
