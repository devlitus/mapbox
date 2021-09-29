import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:map/models/search_response.dart';
import 'package:map/models/search_result.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is OnActiveMakerManual) {
      yield state.copyWith(manualSelection: true);
    } else if (event is OnRemoveMakerManual) {
      yield state.copyWith(manualSelection: false);
    } else if (event is OnAddHistory) {
      final newHistory = [...state.history, event.result];
      yield state.copyWith(history: newHistory);
    }
  }
}
