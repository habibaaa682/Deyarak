import 'package:dartz/dartz.dart';
import 'package:deyarakapp/Featurs/Home/data/Models/home_properties_model/home_properties_model.dart';
import 'package:deyarakapp/core/Errors/Failure.dart';

abstract class HomePropertiesRepo {
  Future<Either<Failure, List<HomePropertiesModel>>> fetchHomeProperties();
}
