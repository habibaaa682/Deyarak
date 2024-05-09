import 'package:dartz/dartz.dart';
import 'package:deyarakapp/Featurs/Home/data/Models/related_suggestion_model/related_suggestion_model.dart';

import '../../../../../core/Errors/Failure.dart';

abstract class RelatedSuggestionRepo {
  Future<Either<Failure, List<RelatedSuggestionModel>>> fetchRelatedSuggestion(
      {required String propertyId});
}
