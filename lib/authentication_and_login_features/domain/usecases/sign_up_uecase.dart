import 'package:dartz/dartz.dart';
import 'package:snap_jobs/authentication_and_login_features/data/models/sign_up_parameters_model.dart';
import 'package:snap_jobs/authentication_and_login_features/domain/repository/base_sign_up_repository.dart';
import 'package:snap_jobs/core/use_case/base_usecase.dart';
import '../../../core/common_domain/entities/user.dart';
import '../../../core/error/failure.dart';
import '../entities/sign_up_parameters.dart';


class SignUpUseCase extends BaseUseCase<bool, SignUpParameters> {

final BaseSignUpRepository _baseSignUpRepository;
  SignUpUseCase(this._baseSignUpRepository     );

  @override
  call(SignUpParameters parameters) async {

final body = SignUpParametersModel.fromEntity(entity: parameters).toJson();

    return await _baseSignUpRepository.signUp(body);

  }
}
