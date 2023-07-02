import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:snap_jobs/authentication_and_login_features/presentation/controllers/sign_up_bloc/sign_up_bloc.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    required FocusNode passwordFocusNode,
  }) : _passwordFocusNode = passwordFocusNode;

  final FocusNode _passwordFocusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: true,

      decoration: InputDecoration(
        label: RichText(
          text: TextSpan(
            text: 'Password ',
            style: DefaultTextStyle.of(context).style,
            children: const <TextSpan>[
              TextSpan(
                  text: '*',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.red)),
            ],
          ),
        ),
        hintText: "Atlas 8 characters long",
        prefixIcon: const Icon(Icons.lock),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        } else if (value.length < 8) {
          return 'Password must be at least 8 characters long';
        }
        return null;
      },
      onChanged: (value) {
        context.read<SignUpBloc>().add(PasswordChanged(value));
      },
      textInputAction: TextInputAction.next,
      focusNode: _passwordFocusNode,
    );
  }
}
