import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_jobs/authentication_and_login_features/presentation/controllers/sign_up_bloc/sign_up_bloc.dart';

class LastNameField extends StatelessWidget {
  const LastNameField({
    super.key,
    required FocusNode lastNameFocusNode,
  }) : _lastNameFocusNode = lastNameFocusNode;

  final FocusNode _lastNameFocusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
                autovalidateMode: AutovalidateMode.onUserInteraction,

      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter your last name";
        } else if (!(RegExp(r'[a-zA-Z][a-zA-Z ]+', caseSensitive: false)
            .hasMatch(value))) {
          return "you can use English letters only";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Enter your last name",
        label: RichText(
          text: TextSpan(
            text: 'Last Name ',
            style: DefaultTextStyle.of(context).style,
            children: const <TextSpan>[
              TextSpan(
                  text: '*',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red)),
            ],
          ),
        ),
      ),
      onChanged: (value) {
        context.read<SignUpBloc>().add(LastNameChanged(value));
      },
      focusNode: _lastNameFocusNode,
      textInputAction: TextInputAction.next,
    );
  }
}
