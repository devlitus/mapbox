import 'dart:async';

import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:map/helpers/debouncer.dart';
import 'package:map/models/search_response.dart';

class TrafficService {
  TrafficService._privateCosntructor();
  static final TrafficService _instance = TrafficService._privateCosntructor();
  factory TrafficService() {
    return _instance;
  }

  final _dio = new Dio();
  final debouncer = Debouncer<String>(duration: Duration(milliseconds: 600));
  final StreamController<SearchResponse> _suggestionsStreamController =
      new StreamController<SearchResponse>.broadcast();
  Stream<SearchResponse> get suggestionStream =>
      _suggestionsStreamController.stream;

  final _urlGeo = 'https://api.mapbox.com/geocoding/v5/mapbox.places';
  final _apiKey =
      'pk.eyJ1IjoiZGV2bGl0dXMiLCJhIjoiY2t0NDY3OGZqMTBvbDJ2cGhlaDNiN2QxOCJ9.I9pf-2pMbEifCGqErodpJg';

  Future<SearchResponse> getResultWithQuery(
      String query, LatLng proximity) async {
    try {
      final url = '${this._urlGeo}/$query.json';
      final result = await _dio.get(url, queryParameters: {
        'access_token': _apiKey,
        'autocomplete': 'false',
        'proximity': '${proximity.longitude},${proximity.latitude}',
        'language': 'es'
      });
      final searchResult = searchResponseFromJson(result.data);
      return searchResult;
    } catch (e) {
      return SearchResponse();
    }
  }

  void getSuggestionForQuery(String query, LatLng proximity) {
    debouncer.value = '';
    debouncer.onValue = (value) async {
      final result = await this.getResultWithQuery(value, proximity);
      this._suggestionsStreamController.add(result);
    };

    final timer = Timer.periodic(Duration(milliseconds: 300), (_) {
      debouncer.value = query;
    });

    Future.delayed(Duration(milliseconds: 301)).then((_) => timer.cancel());
  }
}
