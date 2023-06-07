import 'package:flutter/src/material/icons.dart';
import 'package:flutter/src/material/input_decorator.dart';
import 'package:flutter/src/material/text_form_field.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/icon.dart';
import 'package:provider/src/provider.dart';
import 'package:snap_jobs/authentication_and_login_features/presentation/controllers/sign_up_bloc/sign_up_bloc.dart';

class PastExperincesField extends StatelessWidget {
  const PastExperincesField({
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
