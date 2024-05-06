import 'package:dartz/dartz.dart';
import 'package:deyarakapp/Featurs/profile/data/models/user/user.profile.dart';
import 'package:deyarakapp/core/Errors/Failure.dart';

abstract class profilerepo {
  Future<Either<Failure, List<User>>> getuserprofile();
}
