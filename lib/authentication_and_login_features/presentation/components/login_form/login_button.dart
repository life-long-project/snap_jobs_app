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
      buildWhen: (previous, current) => (previous.isValid != current.isValid),
      builder: (context, state) {
        return state.submissionStatus == SubmissionStatus.inProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('loginForm_continue_raisedButton'),
                onPressed:  (state.isValid) || !(Platform.isAndroid || Platform.isIOS)
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
