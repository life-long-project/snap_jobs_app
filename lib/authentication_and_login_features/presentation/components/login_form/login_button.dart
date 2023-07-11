import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:snap_jobs/authentication_and_login_features/presentation/controllers/login_bloc/login_bloc.dart';
import 'dart:io' show Platform;

//only check the os in debug

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => (previous.isValid != current.isValid ||
          previous.submissionStatus != current.submissionStatus),
      builder: (context, state) {
        return ElevatedButton(
          key: const Key('loginForm_continue_raisedButton'),
          onPressed:

          //button is activated in these conditions:
          //1. the form is valid
          //2. the submission status is not in progress or success
          //3. the platform is not android or ios (to make debugging easier as app
          //   is not meant for mobile devices only and all other
          //  platforms are only for debugging)
              ((state.isValid) || !(Platform.isAndroid || Platform.isIOS)) &&
                      !(state.submissionStatus == SubmissionStatus.inProgress ||
                          state.submissionStatus == SubmissionStatus.success)
                  ? () {
                      context.read<LoginBloc>().add(const LoginSubmitted());
                    }
                  : null,
          child: const Text('Login'),
        );
      },
    );
  }
}
