import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:snap_jobs/authentication_and_login_features/presentation/controllers/sign_up_bloc/sign_up_bloc.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
    required FocusNode emailFocusNode,
  }) : _emailFocusNode = emailFocusNode;

  final FocusNode _emailFocusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
                autovalidateMode: AutovalidateMode.onUserInteraction,

      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        } else if (!RegExp(
          r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
        ).hasMatch(value)) {
          return 'invalid email';
        }

        return null;
      },
      decoration: InputDecoration(
        hintText: "Enter your email",
        label: RichText(
          text: TextSpan(
            text: 'Email ',
            style: DefaultTextStyle.of(context).style,
            children: const <TextSpan>[
              TextSpan(
                  text: '*',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.red)),
            ],
          ),
        ),
        prefixIcon: const Icon(Icons.email),
      ),
      onChanged: (value) {
        context.read<SignUpBloc>().add(EmailChanged(value));
      },
      textInputAction: TextInputAction.next,
      focusNode: _emailFocusNode,
    );
  }
}
