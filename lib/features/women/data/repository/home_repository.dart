

import 'package:brandy_user/features/women/data/params/home_param.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../auth/data/models/user_model.dart';
import '../models/home_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, UserModel>> fetchProfile();
   Future<Either<Failure, HomeModel>> fetchHome(HomeParam param);
}
