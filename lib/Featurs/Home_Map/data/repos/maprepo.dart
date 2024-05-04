import 'package:dartz/dartz.dart';
import 'package:deyarakapp/Featurs/Home_Map/data/models/mapmodel.dart';
import 'package:deyarakapp/Featurs/Home_Map/data/models/mymapmodel/mymapmodel.dart';
import 'package:deyarakapp/core/Errors/Failure.dart';

abstract class maprepo {
  Future<Either<Failure, List<Mymapmodel>>> getpropritieslocations();
}
