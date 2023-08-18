part of 'home_bloc.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final String errorMsg;
  final RelatedTopicModel? selectedData;
  final List<RelatedTopicModel> relatedTopics;
  final List<RelatedTopicModel> filteredTopics;

  const HomeState({
    this.isLoading = false,
    this.errorMsg = '',
    this.selectedData,
    this.relatedTopics = const [],
    this.filteredTopics = const [],
  });

  HomeState copyWith({
    bool? isLoading,
    String? errorMsg,
    RelatedTopicModel? selectedData,
    List<RelatedTopicModel>? relatedTopics,
    List<RelatedTopicModel>? filteredTopics,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      errorMsg: errorMsg ?? this.errorMsg,
      selectedData: selectedData ?? this.selectedData,
      relatedTopics: relatedTopics ?? this.relatedTopics,
      filteredTopics: filteredTopics ?? this.filteredTopics,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        errorMsg,
        selectedData,
        relatedTopics,
        filteredTopics,
      ];
}
