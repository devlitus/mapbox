import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

class TrafficService {
  TrafficService._privateCosntructor();
  static final TrafficService _instance = TrafficService._privateCosntructor();
  factory TrafficService() {
    return _instance;
  }

  final dio = new Dio();
  final urlGeo = 'https://api.mapbox.com/geocoding/v5/mapbox.place';
  final apiKey =
      'pk.eyJ1IjoiZGV2bGl0dXMiLCJhIjoiY2t0NDY3OGZqMTBvbDJ2cGhlaDNiN2QxOCJ9.I9pf-2pMbEifCGqErodpJg';

  Future getResultWithQuery(String query, LatLng proximity) async {
    final url = '${this.urlGeo}/$query.json';
    final result = await dio.get(url, queryParameters: {
      'access_token': apiKey,
      'autocomplete': 'true',
      'proximity': '${proximity.latitude},${proximity.longitude}',
      'language': 'es'
    });
  }
}
