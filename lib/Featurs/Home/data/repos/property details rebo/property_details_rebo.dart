import 'package:dartz/dartz.dart';

import '../../../../../core/Errors/Failure.dart';
import '../../../../profile/data/models/user/user.profile.dart';
import '../../Models/property_model/property_model.dart';

abstract class PropertyDetailsRepo {
  Future<Either<Failure, List<PropertyModel>>> getCertainProperty(
      {required String propertyId});
}
