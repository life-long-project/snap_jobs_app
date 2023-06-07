import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:snap_jobs/authentication_and_login_features/presentation/controllers/sign_up_bloc/sign_up_bloc.dart';

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({
    super.key,
    required FocusNode phoneNumberFocusNode,
  }) : _phoneNumberFocusNode = phoneNumberFocusNode;

  final FocusNode _phoneNumberFocusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
                autovalidateMode: AutovalidateMode.onUserInteraction,

      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your phone';
        } else if (!RegExp(
          r'(\+201|01|00201)[0-2,5]{1}[0-9]{8}',
        ).hasMatch(value)) {
          return 'invalid phone number, we only can use egyptian numbers';
        }

        return null;
      },
      decoration: InputDecoration(
        label: RichText(
          text: TextSpan(
            text: 'Phone Number ',
            style: DefaultTextStyle.of(context).style,
            children: const <TextSpan>[
              TextSpan(
                  text: '*',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.red)),
            ],
          ),
        ),
        hintText: "Enter your phone number",
        prefixIcon: Icon(Icons.phone),
      ),
      onChanged: (value) {
        context.read<SignUpBloc>().add(PhoneNumberChanged(value));
      },
      textInputAction: TextInputAction.next,
      focusNode: _phoneNumberFocusNode,
    );
  }
}
