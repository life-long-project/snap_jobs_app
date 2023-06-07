import 'package:flutter/src/material/icons.dart';
import 'package:flutter/src/material/input_decorator.dart';
import 'package:flutter/src/material/text_form_field.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/icon.dart';
import 'package:provider/src/provider.dart';
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
