
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_jobs/authentication_and_login_features/presentation/controllers/sign_up_bloc/sign_up_bloc.dart';

class CountryField extends StatelessWidget {
  const CountryField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Country",
        hintText: "Enter your country",
        prefixIcon: Icon(Icons.location_city),
      ),
      onChanged: (value) {
        context.read<SignUpBloc>().add(CountryChanged(value));
      },
    );
  }
}
