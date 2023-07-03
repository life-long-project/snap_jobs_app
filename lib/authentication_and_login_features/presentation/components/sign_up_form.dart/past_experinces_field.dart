
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_jobs/authentication_and_login_features/presentation/controllers/sign_up_bloc/sign_up_bloc.dart';

class PastExperiencesField extends StatelessWidget {
  const PastExperiencesField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Past Experiences",
        hintText: "Enter your past experiences",
        prefixIcon: Icon(Icons.work),
      ),
      validator: (_) => null,
      onChanged: (value) {
        context.read<SignUpBloc>().add(PastExperiencesChanged(value));
      },
    );
  }
}
