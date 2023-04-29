import '../entities/profile.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

abstract class BaseProfilerepo{


 Future<Either< Failure, Profile>>getprofile(String id);

}