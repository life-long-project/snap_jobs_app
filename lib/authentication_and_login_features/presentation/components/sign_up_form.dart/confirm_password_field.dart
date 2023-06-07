import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:snap_jobs/authentication_and_login_features/presentation/controllers/sign_up_bloc/sign_up_bloc.dart';

class ConfirmPasswordField extends StatelessWidget {
  const ConfirmPasswordField({
    super.key,
    required FocusNode confirmPasswordFocusNode,
  }) : _confirmPasswordFocusNode = confirmPasswordFocusNode;

  final FocusNode _confirmPasswordFocusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
                autovalidateMode: AutovalidateMode.onUserInteraction,

      decoration: InputDecoration(
        hintText: "Confirm your password",
        label: RichText(
          text: TextSpan(
            text: 'Confirm Password ',
            style: DefaultTextStyle.of(context).style,
            children: const <TextSpan>[
              TextSpan(
                  text: '*',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.red)),
            ],
          ),
        ),
        prefixIcon: Icon(Icons.lock),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please confirm your password';
        } else if (value != context.read<SignUpBloc>().state.password) {
          return 'Passwords do not match';
        }
        return null;
      },
      onChanged: (value) {
        context.read<SignUpBloc>().add(ConfirmedPasswordChanged(value));
      },
      textInputAction: TextInputAction.next,
      focusNode: _confirmPasswordFocusNode,
    );
  }
}
