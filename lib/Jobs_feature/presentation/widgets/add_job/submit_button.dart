import 'package:flutter/material.dart';

class FormSubmitBtn extends StatelessWidget {
  final void Function() onPressed;
  final bool isUpdateJob;

  const FormSubmitBtn({
    Key? key,
    required this.onPressed,
    required this.isUpdateJob,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: onPressed,
        icon: isUpdateJob ? Icon(Icons.edit) : Icon(Icons.add),
        label: Text(isUpdateJob ? "Update" : "Add"));
  }
}
