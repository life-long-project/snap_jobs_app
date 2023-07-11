
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_jobs/authentication_and_login_features/presentation/controllers/sign_up_bloc/sign_up_bloc.dart';

class FirstNameField extends StatelessWidget {
  const FirstNameField({
    super.key,
    required FocusNode firstNameFocusNode,
  }) : _firstNameFocusNode = firstNameFocusNode;

  final FocusNode _firstNameFocusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
                autovalidateMode: AutovalidateMode.onUserInteraction,

      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter your first name";
        } else if (!(RegExp(r'[a-zA-Z][a-zA-Z ]+', caseSensitive: false)
            .hasMatch(value))) {
          return "you can use English letters only";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Enter your first name",
        label: RichText(
          text: TextSpan(
            text: 'First Name ',
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
        context.read<SignUpBloc>().add(FirstNameChanged(value));
      },
      focusNode: _firstNameFocusNode,
      textInputAction: TextInputAction.next,
    );
  }
}
