import 'package:dartz/dartz.dart';

import 'package:deyarakapp/Featurs/Home_Map/data/models/mappmodel.dart';

import 'package:deyarakapp/core/Errors/Failure.dart';

abstract class maprepo {
  Future<Either<Failure, List<Mappmodel>>> getpropritieslocations();
}
