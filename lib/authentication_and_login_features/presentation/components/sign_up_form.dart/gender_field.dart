import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:snap_jobs/authentication_and_login_features/presentation/controllers/sign_up_bloc/sign_up_bloc.dart';

class GenderField extends StatelessWidget {
  const GenderField({
    super.key,
    required FocusNode genderFocusNode,
  }) : _genderFocusNode = genderFocusNode;

  final FocusNode _genderFocusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => value == null || value.isEmpty
          ? "Please enter your gender or N/A"
          : null,
      decoration: InputDecoration(
        hintText: "Write N/A if you don't want to specify",
        label: RichText(
          text: TextSpan(
            text: 'Gender',
            style: DefaultTextStyle.of(context).style,
            children: const <TextSpan>[
              TextSpan(
                  text: '*',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.red)),
            ],
          ),
        ),
      ),
      onChanged: (value) {
        context.read<SignUpBloc>().add(GenderChanged(value));
      },
      textInputAction: TextInputAction.next,
      focusNode: _genderFocusNode,
    );
  }
}
