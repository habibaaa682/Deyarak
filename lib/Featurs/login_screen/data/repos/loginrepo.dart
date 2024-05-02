import 'package:dartz/dartz.dart';

import 'package:deyarakapp/Featurs/login_screen/data/models/log_in_model/log_in_model.dart';
import 'package:deyarakapp/core/Errors/Failure.dart';

abstract class loginrepo {
  Future<Either<Failure, List<LogInModel>>> logintoapp();
}
