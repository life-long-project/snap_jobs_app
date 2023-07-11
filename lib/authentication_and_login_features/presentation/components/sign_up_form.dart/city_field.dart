
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_jobs/authentication_and_login_features/presentation/controllers/sign_up_bloc/sign_up_bloc.dart';

class CityField extends StatelessWidget {
  const CityField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "City",
        hintText: "Enter your city",
        prefixIcon: Icon(Icons.location_city),
      ),
      validator: (_) => null,
      onChanged: (value) {
        context.read<SignUpBloc>().add(CityChanged(value));
      },
    );
  }
}
