part of 'related_suggestions_cubit.dart';

sealed class RelatedSuggestionsState extends Equatable {
  const RelatedSuggestionsState();

  @override
  List<Object> get props => [];
}

final class RelatedSuggestionsInitial extends RelatedSuggestionsState {}

final class RelatedSuggestionsLoading extends RelatedSuggestionsState {}

final class RelatedSuggestionsSuccess extends RelatedSuggestionsState {
  final List<RelatedSuggestionModel> relatedSuggestions;

  const RelatedSuggestionsSuccess(this.relatedSuggestions);
}

final class RelatedSuggestionsFailure extends RelatedSuggestionsState {
  final String errMsg;

  const RelatedSuggestionsFailure(this.errMsg);
}
