import 'package:dartz/dartz.dart';
import 'package:deyarakapp/core/Errors/Failure.dart';

import '../Models/home_model/home_model.dart';

abstract class HomePropertiesRepo {
  Future<Either<Failure, List<HomeModel>>> fetchHomeProperties();
}
