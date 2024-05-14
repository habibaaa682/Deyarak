import 'package:dartz/dartz.dart';
import 'package:deyarakapp/Featurs/Home/data/Models/property_modell/property_modell.dart';

import '../../../../../core/Errors/Failure.dart';
import '../../../../profile/data/models/user/user.profile.dart';
import '../../Models/property_model/property_model.dart';

abstract class PropertyDetailsRepo {
  Future<Either<Failure, List<PropertyModell>>> getCertainProperty(
      {required String propertyId});
}
