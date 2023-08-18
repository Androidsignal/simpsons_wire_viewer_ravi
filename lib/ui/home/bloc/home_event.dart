part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {}

class FetchData extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class SearchData extends HomeEvent {
  final String searchText;

  SearchData(this.searchText);

  @override
  List<Object?> get props => [searchText];
}

class SelectedData extends HomeEvent {
  final RelatedTopicModel data;

  SelectedData(this.data);

  @override
  List<Object?> get props => [data];
}
