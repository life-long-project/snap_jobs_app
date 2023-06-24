import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_jobs/core/services/services_locator.dart';

import '../../controllers/login_bloc/login_bloc.dart';
import '../../components/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.along(Axis.horizontal);
    final deviceHeight = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.along(Axis.vertical) -
        kToolbarHeight -
        kBottomNavigationBarHeight);

    return Scaffold(
        resizeToAvoidBottomInset: false,

      appBar: AppBar(title: const Text('Login')),
      body: BlocProvider(
        create: (context) {
          return sl<LoginBloc>();
        },
        child: Container(
          margin: EdgeInsetsDirectional.only(
            top: deviceHeight * 0.1,
            bottom: deviceHeight * 0.3,
          ),
          width: deviceWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                height: deviceHeight * 0.2,
                image: const AssetImage(
                  'assets/images/blue_logo_black_text.png',
                ),
              ),
              SizedBox(height: deviceHeight * 0.1),
              SizedBox(
                height: deviceHeight * 0.3,
                width: deviceWidth * 0.8,
                child:  LoginForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
