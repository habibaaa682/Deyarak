import 'package:dartz/dartz.dart';
import 'package:deyarakapp/Featurs/Home/data/Models/related_suggestion_model/related_suggestion_model.dart';
import 'package:deyarakapp/Featurs/Home/data/repos/related%20suggestion%20repo/related_suggestion_repo.dart';
import 'package:deyarakapp/core/Errors/Failure.dart';
import 'package:dio/dio.dart';

import '../../../../../core/utils/api_service.dart';

class RelatedSuggestionsRepoImpl implements RelatedSuggestionRepo {
  final ApiService apiService;

  RelatedSuggestionsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<RelatedSuggestionModel>>> fetchRelatedSuggestion(
      {required String propertyId}) async {
    try {
      var data = await apiService.get(
          endPointPath: 'properties/related-suggestions/$propertyId');
      List<RelatedSuggestionModel> relatedSuggestionsList = [];
      for (var suggestion in data['data']['data']) {
        relatedSuggestionsList.add(RelatedSuggestionModel.fromJson(suggestion));
      }
      print(relatedSuggestionsList[0]);

      return right(relatedSuggestionsList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
