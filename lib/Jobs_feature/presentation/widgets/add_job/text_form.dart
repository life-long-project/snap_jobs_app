import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool multiLines;
  final String name;
 final bool numbersOnly;

  const TextFormFieldWidget({
    Key? key,
    required this.controller,
    required this.multiLines,
    required this.name,
    this.numbersOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: TextFormField(
          keyboardType: numbersOnly ? TextInputType.number : TextInputType.text,
          minLines: multiLines ? 6 : 1,
          maxLines: multiLines ? 6 : 1,
          controller: controller,
          validator: (val) {
            return val!.isEmpty ? "$name Can't be empty" : null;
          },
          decoration: InputDecoration(hintText: name),
        ));
  }
}
