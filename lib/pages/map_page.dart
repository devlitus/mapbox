import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map/bloc/my_location/my_location_bloc.dart';

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
      body: Center(
        child: BlocBuilder<MyLocationBloc, MyLocationState>(
          builder: (context, state) => createMap(state),
        ),
      ),
    );
  }

  Widget createMap(MyLocationState state) {
    if (!state.existsLocation) return Text('locating...');
    return Text('${state.location?.latitude}, ${state.location?.longitude}');
  }
}
