import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import 'package:snap_jobs/authentication_and_login_features/domain/entities/login_credentials.dart';
import 'package:snap_jobs/authentication_and_login_features/domain/usecases/login_usecase.dart';


part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  ///the login form inputText should show error if the input is invalid
  ///and the user unfocused the inputText. not when the user is typing.
  LoginBloc({
    required AuthenticationRepository authenticationRepository,

  })  : _authenticationRepository = authenticationRepository,
        super(const LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);


    on<LoginSubmitted>(_onSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;
   GlobalKey<FormState>? formKey;

  void _onEmailChanged(
    LoginEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    final email = event.email;
    emit(
      state.copyWith(
        email: email,
        isValid: event.isValid ,
      ),
    );
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = event.password;
    emit(
      state.copyWith(
        password: password,
        isValid: event.isValid,
      ),
    );
  }


  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
     final email = state.email;
    final password = state.password;
       emit(
      state.copyWith(
        email: email,
        password: password,
        isValid: event.isValid,
      ),
    );
    if (state.isValid) {
      emit(state.copyWith(submissionStatus: SubmissionStatus.inProgress));
      try {
        LoginUseCase(_authenticationRepository).call(
          LoginCredentials(
            email: email,
            password: password,
          ),
        );
        emit(state.copyWith(submissionStatus: SubmissionStatus.success));
      } catch (_) {
        emit(state.copyWith(submissionStatus: SubmissionStatus.failure));
      }
    }
  }
}
