import 'package:flutter/material.dart';

import 'sign_up_form.dart/sign_up_form.dart';

class SignUpFirstPage extends StatefulWidget {
  const SignUpFirstPage({
    super.key,
  });

  @override
  State<SignUpFirstPage> createState() => _SignUpFirstPageState();
}

class _SignUpFirstPageState extends State<SignUpFirstPage> {
  final _firstNameFocusNode = FocusNode();
  final _lastNameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();
  final _phoneNumberFocusNode = FocusNode();
  final _genderFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // _firstNameFocusNode.addListener(() {
    //   if (!_firstNameFocusNode.hasFocus) {
    //     _lastNameFocusNode.requestFocus();
    //   }
    // });
    // _lastNameFocusNode.addListener(() {
    //   if (!_lastNameFocusNode.hasFocus) {
    //     _emailFocusNode.requestFocus();
    //   }
    // });
    // _emailFocusNode.addListener(() {
    //   if (!_emailFocusNode.hasFocus) {
    //     _passwordFocusNode.requestFocus();
    //   }
    // });
    // _passwordFocusNode.addListener(() {
    //   if (!_passwordFocusNode.hasFocus) {
    //     _confirmPasswordFocusNode.requestFocus();
    //   }
    // });
    // _confirmPasswordFocusNode.addListener(() {
    //   if (!_confirmPasswordFocusNode.hasFocus) {
    //     _phoneNumberFocusNode.requestFocus();
    //   }
    // });
    // _phoneNumberFocusNode.addListener(() {
    //   if (!_phoneNumberFocusNode.hasFocus) {
    //     _genderFocusNode.requestFocus();
    //   }
    // });
  }

  @override
  void dispose() {
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    _genderFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //TODO This is the code that I want to use to make the form responsive

    // final _fullWidth = MediaQuery.of(context).size.width -
    //     MediaQuery.of(context).padding.left -
    //     MediaQuery.of(context).padding.right;
    // final _fullHeight = MediaQuery.of(context).size.height -
    //     AppBar().preferredSize.height -
    //     MediaQuery.of(context).padding.top -
    //     MediaQuery.of(context).padding.bottom -
    //     MediaQuery.of(context).padding.top;
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //*Signup Form paramters

          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //*First Name*
              Expanded(
                child: FirstNameField(firstNameFocusNode: _firstNameFocusNode),
              ),
              //*Last Name*
              Expanded(
                child: LastNameField(lastNameFocusNode: _lastNameFocusNode),
              ),
            ],
          ),

          //*Email*

          EmailField(emailFocusNode: _emailFocusNode),
          //*Password*
          PasswordField(passwordFocusNode: _passwordFocusNode),

          //*Confirm Password*
          ConfirmPasswordField(
              confirmPasswordFocusNode: _confirmPasswordFocusNode),

          //*Phone Number*
          PhoneNumberField(phoneNumberFocusNode: _phoneNumberFocusNode),

          //*gender*
          GenderField(genderFocusNode: _genderFocusNode),
        ],
      ),
    );
  }
}
