part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class OnActiveMakerManual extends SearchEvent {}

class OnRemoveMakerManual extends SearchEvent {}

class OnAddHistory extends SearchEvent {
  final SearchResult result;

  OnAddHistory(this.result);
}
