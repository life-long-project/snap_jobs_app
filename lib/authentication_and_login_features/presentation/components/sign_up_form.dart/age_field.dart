import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/sign_up_bloc/sign_up_bloc.dart';

class AgeField extends StatefulWidget {
  const AgeField({
    super.key,
  });

  @override
  State<AgeField> createState() => _AgeFieldState();
}

class _AgeFieldState extends State<AgeField> {
  final _ages = List.generate(98 - 18, (index) => index + 18, growable: false);
  int? _age;
  @override
  Widget build(BuildContext context) {
    return FormField<int>(
      builder: (FormFieldState<int> state) {
        return InputDecorator(
          decoration: InputDecoration(
            labelText: 'Age',
            errorText: state.hasError ? state.errorText : null,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              value: _age,
              onChanged: (int? newValue) {
                context.read<SignUpBloc>().add(AgeChanged(newValue!));
                setState(() {
                  _age = newValue;
                });
              },
              items: _ages.map((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),
          ),
        );
      },
      validator: (_) => null,
    );
  }
}
