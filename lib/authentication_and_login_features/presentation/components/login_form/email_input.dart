import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_jobs/authentication_and_login_features/presentation/controllers/login_bloc/login_bloc.dart';

class EmailInput extends StatefulWidget {
  const EmailInput({required this.focusNode, super.key, });
  final FocusNode focusNode;


  @override
  State<EmailInput> createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  //debounce means only emit an item from an Observable if a particular time span
  Timer? _debounce;

  _onEmailChanged(String email, BuildContext context) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(
        const Duration(milliseconds: 500),
        () => context
            .read<LoginBloc>()
            .add(LoginEmailChanged(email, Form.of(context).validate() && !_isEmailFieldPure )));

  }

  bool _isEmailFieldPure = true;


  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(() {
      if (widget.focusNode.hasFocus) {
        _isEmailFieldPure = false;
      }
    });
  }


  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: const Key('loginForm_emailInput_textField'),
          focusNode: widget.focusNode,
          onChanged: (email) => _onEmailChanged(email, context),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return _isEmailFieldPure ?null : 'Please enter your email' ;
            } else if (!RegExp(
                  r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
                ).hasMatch(value) &&
                !_isEmailFieldPure) {
              return 'invalid email';
            }

            return null;
          },
          decoration: const InputDecoration(
            labelText: 'email',
          ),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}
