part of 'my_location_bloc.dart';

@immutable
class MyLocationState {
  final bool following;
  final bool existsLocation;
  final LatLng? location;

  MyLocationState({
    this.following = true,
    this.existsLocation = false,
    this.location,
  });
  MyLocationState copyWith({
    bool? following,
    bool? existLocation,
    LatLng? location,
  }) =>
      new MyLocationState(
        following: following ?? this.following,
        existsLocation: existLocation ?? this.existsLocation,
        location: location ?? this.location,
      );
}
