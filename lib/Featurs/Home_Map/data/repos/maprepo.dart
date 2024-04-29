import 'package:dartz/dartz.dart';
import 'package:deyarakapp/Featurs/Home_Map/data/models/mapmodel.dart';
import 'package:deyarakapp/core/errors/failure.dart';

abstract class maprepo {
  Future<Either<Failure, List<Mapmodel>>> getpropritieslocations();
}
