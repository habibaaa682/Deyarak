import 'package:dartz/dartz.dart';
import 'package:deyarakapp/Featurs/Home/data/Models/property_modell/property_modell.dart';

import '../../../../../core/Errors/Failure.dart';
<<<<<<< HEAD

import '../../Models/property_model/property_model.dart';
=======
import '../../../../profile/data/models/user/user.profile.dart';
>>>>>>> d286ec902efe6053b440075b21497db073756bd3

abstract class PropertyDetailsRepo {
  Future<Either<Failure, List<PropertyModell>>> getCertainProperty(
      {required String propertyId});
}
