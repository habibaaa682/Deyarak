import 'package:dartz/dartz.dart';
import 'package:deyarakapp/Featurs/Home/data/Models/home_model/home_model.dart';
import 'package:deyarakapp/core/Errors/Failure.dart';

abstract class HomePropertiesRepo {
  Future<Either<Failure, List<HomeModel>>> fetchHomeProperties();
}
