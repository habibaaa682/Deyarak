import 'package:bloc/bloc.dart';
import 'package:deyarakapp/Featurs/Home/data/Models/related_suggestion_model/related_suggestion_model.dart';
import 'package:deyarakapp/Featurs/Home/data/repos/related%20suggestion%20repo/related_suggestion_repo.dart';
import 'package:equatable/equatable.dart';

part 'related_suggestions_state.dart';

class RelatedSuggestionsCubit extends Cubit<RelatedSuggestionsState> {
  RelatedSuggestionsCubit(this.relatedSuggestionRepo) : super(RelatedSuggestionsInitial());
  final RelatedSuggestionRepo relatedSuggestionRepo;

  Future<void> fetchRelatedSuggestions({required String propertyId}) async {
    emit(RelatedSuggestionsLoading());
    var result = await relatedSuggestionRepo.fetchRelatedSuggestion(propertyId: propertyId);
    result.fold((failure) {
      emit(RelatedSuggestionsFailure(failure.errMessage));
    }, (relatedSuggestions) {
        emit(
          RelatedSuggestionsSuccess(relatedSuggestions),
        );

    });
  }
}
