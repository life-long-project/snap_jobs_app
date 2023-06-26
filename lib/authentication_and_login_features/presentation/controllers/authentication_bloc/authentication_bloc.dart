import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:snap_jobs/authentication_and_login_features/domain/usecases/get_user_use_case.dart';
import 'package:snap_jobs/authentication_and_login_features/domain/usecases/log_out_use_case.dart';
import 'package:user_repository/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
    required UserRepository userRepository,
  })  : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
        super(
          const AuthenticationState.unknown(),
        ) {
    on<_AuthenticationStatusChanged>(
      _onAuthenticationStatusChanged,
    );
    on<AuthenticationLogoutRequested>(
      _onAuthenticationLogoutRequested,
    );

    ///listen to the authentication Repository status stream and add the
    ///_AuthenticationStatusChanged event to the bloc.
    _authenticationStatusSubscription = _authenticationRepository.status.listen(
      (status) => add(
        _AuthenticationStatusChanged(status),
      ),
    );
  }

  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;
  late StreamSubscription<AuthenticationStatus>
      _authenticationStatusSubscription;

  ///this method is called when the authentication status changes.
  ///it reflects the status change in the bloc state.
  ///it also calls the GetUserUsecase to get the user data from the server
  ///when the status is authenticated.
  Future<void> _onAuthenticationStatusChanged(
    _AuthenticationStatusChanged event,
    Emitter<AuthenticationState> emit,
  ) async {
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
        return emit(
          const AuthenticationState.unauthenticated(),
        );
      case AuthenticationStatus.authenticated:
      //below commented code is for changing the baseClient singleton to
      //include Token in the header of every request.
      //but currently it's not working as expected
        //TODO : fix this

        //  await sl.unregister<BaseHttpClient>();

        // await ServiceLocatorWithTokens()
        //     .init(await _authenticationRepository.token);

        final user = await GetUserUsecase(_userRepository)
            .call(await _authenticationRepository.token);

        return emit(
          user != User.empty
              ? AuthenticationState.authenticated(
                  user,
                )
              : const AuthenticationState.unauthenticated(),
        );
      case AuthenticationStatus.unknown:
        return emit(
          const AuthenticationState.unknown(),
        );
    }
  }

  ///this method is called when the user requests to logout.
  void _onAuthenticationLogoutRequested(
    AuthenticationLogoutRequested event,
    Emitter<AuthenticationState> emit,
  ) async {
    await LogOutUsecase(_userRepository, _authenticationRepository).call(null);
  }

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    return super.close();
  }
}
