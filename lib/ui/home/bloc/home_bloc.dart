import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpsons_character_viewer/infrastructure/models/related_topic_model.dart';
import 'package:simpsons_character_viewer/infrastructure/repository/data_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DataRepository repo;

  HomeBloc(this.repo) : super(const HomeState()) {
    on<FetchData>(_onFetchData);
    on<SearchData>(_onSearchData);
    on<SelectedData>(_onSelectedData);
  }

  FutureOr<void> _onFetchData(FetchData event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await repo.fetchData();
    if (result.isSuccess) {
      emit(state.copyWith(
        isLoading: false,
        relatedTopics: result.relatedTopics,
        filteredTopics: result.relatedTopics,
      ));
    } else {
      emit(state.copyWith(
        isLoading: false,
        errorMsg: result.message,
      ));
    }
  }

  FutureOr<void> _onSearchData(SearchData event, Emitter<HomeState> emit) {
    List<RelatedTopicModel> topics = List.of(state.relatedTopics);
    final list = topics
        .where((element) =>
            element.text
                ?.toLowerCase()
                .contains(event.searchText.toLowerCase()) ??
            false)
        .toList();
    emit(state.copyWith(filteredTopics: list));
  }

  FutureOr<void> _onSelectedData(SelectedData event, Emitter<HomeState> emit) {
    emit(state.copyWith(selectedData: event.data));
  }
}
