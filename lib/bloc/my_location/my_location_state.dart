part of 'my_location_bloc.dart';

@immutable
class MyLocationState {
  final bool following;
  final bool existsLocation;
  final LatLng location;

  MyLocationState({
    this.following = true,
    this.existsLocation = false,
  }) : location = LatLng(41.21515, 1.7274449999999888);

  MyLocationState copyWith({
    bool? following,
    bool? existLocation,
    LatLng? location,
  }) =>
      new MyLocationState(
        following: following ?? this.following,
        existsLocation: existLocation ?? this.existsLocation,
      );
}
// 41.21515, 1.7274449999999888