import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_jobs/authentication_and_login_features/presentation/controllers/login_bloc/login_bloc.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({required this.focusNode, super.key});

  final FocusNode focusNode;

  @override
  State<PasswordInput> createState() => PasswordInputState();
}

class PasswordInputState extends State<PasswordInput> {
  Timer? debounce;

  bool _passwordPure = false;

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(() {
      if (!widget.focusNode.hasFocus) {
        _passwordPure = true;
      }
    });
  }

  onPasswordChanged(String password, BuildContext context) {
    if (debounce?.isActive ?? false) debounce!.cancel();
    debounce = Timer(
        const Duration(milliseconds: 500),
        () => context
            .read<LoginBloc>()
            .add(LoginPasswordChanged(password, Form.of(context).validate())));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: const Key('loginForm_passwordInput_textField'),
          focusNode: widget.focusNode,
          onChanged: (password) => onPasswordChanged(password, context),
          obscureText: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return _passwordPure ? 'Please enter your password' : null;
            } else if (value.length < 8 && _passwordPure) {
              return 'invalid password , at least 8 characters';
            }

            return null;
          },
          decoration: const InputDecoration(
            labelText: 'password',
          ),
          textInputAction: TextInputAction.done,
        );
      },
    );
  }
}
