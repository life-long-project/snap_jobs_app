import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/login_credentials.dart';

part 'login_credentials_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class LoginCredentialsModel extends LoginCredentials {


  @override
@JsonKey(required: true, )
  String get email => super.email;

  @override
@JsonKey(required: true)
  String get password => super.password;

  const LoginCredentialsModel({
    required super.email,
    required super.password,
  });




Map<String, dynamic> toJson() => _$LoginCredentialsModelToJson(this);
}
