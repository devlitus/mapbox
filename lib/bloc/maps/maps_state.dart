part of 'maps_bloc.dart';

@immutable
class MapsState {
  final bool initMap;

  MapsState({this.initMap = false});
  MapsState copyWith({bool initMap}) =>
      new MapsState(initMap: initMap ?? this.initMap);
}
