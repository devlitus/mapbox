import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:map/models/search_response.dart';
import 'package:map/models/search_result.dart';
import 'package:map/services/traffic_service.dart';

class SearchDestination extends SearchDelegate<SearchResult> {
  @override
  final String searchFieldLabel;
  final TrafficService _trafficService;
  final LatLng proximity;
  final List<SearchResult> history;
  SearchDestination(this.proximity, this.history)
      : this.searchFieldLabel = 'Buscar...',
        this._trafficService = new TrafficService();
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => this.query = '',
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => this.close(context, SearchResult(cancel: true)),
      icon: Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _constructorResultSuggestion();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.length == 0) {
      return ListView(
        children: [
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Colocar ubicacion manualmente'),
            onTap: () {
              print('manualmente');
              this.close(context, SearchResult(cancel: false, manual: true));
            },
          ),
          ...history
              .map(
                (result) => ListTile(
                  leading: Icon(Icons.history),
                  title: Text(result.destinationName),
                  subtitle: Text(result.description),
                ),
              )
              .toList(),
        ],
      );
    }
    return _constructorResultSuggestion();
  }

  Widget _constructorResultSuggestion() {
    if (query.length == 0) {
      return Container();
    }
    _trafficService.getSuggestionForQuery(query.trim(), proximity);

    return StreamBuilder(
      stream: this._trafficService.suggestionStream,
      builder: (BuildContext context, AsyncSnapshot<SearchResponse> snapshot) {
        try {
          final features = snapshot.data.features;
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.separated(
            itemCount: features.length,
            separatorBuilder: (_, i) => Divider(),
            itemBuilder: (_, i) {
              final feature = features[i];
              return ListTile(
                leading: Icon(Icons.place),
                title: Text(feature.textEs),
                subtitle: Text(feature.placeNameEs),
                onTap: () {
                  print(feature);
                  this.close(
                    context,
                    SearchResult(
                      cancel: false,
                      manual: false,
                      position: LatLng(feature.center[1], feature.center[0]),
                      destinationName: feature.textEs,
                      description: feature.placeNameEs,
                    ),
                  );
                },
              );
            },
          );
        } catch (e) {
          return ListTile(
            title: Text('No hay resultados con la $query'),
          );
        }
      },
    );
  }
}
