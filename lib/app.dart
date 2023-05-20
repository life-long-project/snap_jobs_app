import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_jobs/authentication_and_login_features/presentation%20/screens/login/login_page.dart';
import 'package:snap_jobs/core/network/api_constants.dart';

import 'package:user_repository/user_repository.dart';

import 'Home_Feature/Presentation/UI/Screens/home.dart';
import 'authentication_and_login_features/presentation /controllers/authenttication_bloc/authentication_bloc.dart';
import 'core/network/base_http_client.dart';
import 'core/services/services_locator.dart';
import 'core/utils/themeApp/themeDataLight.dart';
import 'splash/view/splash_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AuthenticationRepository _authenticationRepository;
  late final UserRepository _userRepository;
  late Future<bool>  _requiredBeforeInitializing;

  @override
  void initState() {
    super.initState();
    _requiredBeforeInitializing = _preInitializeRepositories();
  }

  @override
  void dispose() {
    _authenticationRepository.dispose();
    sl<BaseHttpClient>().close();

    super.dispose();
  }

  Future<bool> _preInitializeRepositories() async {
    await Future.delayed(Duration.zero);

    ServicesLocator().init();

    _authenticationRepository =
        await AuthenticationRepository.create(sl<BaseHttpClient>());
    _userRepository =
        UserRepository(sl<BaseHttpClient>(), ApiConstants.getUserByID);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _requiredBeforeInitializing,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            // Future hasn't finished yet, return a placeholder
            return const MaterialApp(
              home: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
          return RepositoryProvider.value(
            value: _authenticationRepository,
            child: BlocProvider(
              create: (_) => AuthenticationBloc(
                authenticationRepository: _authenticationRepository,
                userRepository: _userRepository,
              ),
              child: const AppView(),
            ),
          );
        });
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigatorKey,
      theme: getThemeDtaLight(),
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                _navigator.pushAndRemoveUntil<void>(
                  HomePage.route(),
                  (route) => false,
                );
                break;
              case AuthenticationStatus.unauthenticated:
                _navigator.pushAndRemoveUntil<void>(
                  LoginPage.route(),
                  (route) => false,
                );
                break;
              case AuthenticationStatus.unknown:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
