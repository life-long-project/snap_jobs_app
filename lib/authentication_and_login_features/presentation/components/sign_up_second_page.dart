import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_jobs/authentication_and_login_features/presentation/components/sign_up_form.dart/city_field.dart';
import 'package:snap_jobs/authentication_and_login_features/presentation/components/sign_up_form.dart/country_field.dart';
import 'package:snap_jobs/authentication_and_login_features/presentation/components/sign_up_form.dart/past_experinces_field.dart';
import 'package:snap_jobs/authentication_and_login_features/presentation/controllers/sign_up_bloc/sign_up_bloc.dart';

import 'sign_up_form.dart/age_field.dart';

class SignUpSecondPage extends StatefulWidget {
  const SignUpSecondPage({super.key});

  @override
  State<SignUpSecondPage> createState() => _SignUpSecondPageState();
}

class _SignUpSecondPageState extends State<SignUpSecondPage> {
//TODO : Extract skill widget to diffrent file
  static List<String> skillsList = [""];
  List<Widget> _getSkills() {
    List<Widget> skillsTextFieldsList = [];
    for (int i = 0; i < skillsList.length; i++) {
      skillsTextFieldsList.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            Expanded(child: SkillsTextFields(i)),
            const SizedBox(
              width: 16,
            ),
            // we need add button at last skill row only
            _addRemoveButton(i == skillsList.length - 1, i),
          ],
        ),
      ),);
    }
    return skillsTextFieldsList;
  }

  Widget _addRemoveButton(bool add, int index) {
    return InkWell(
      onTap: () {
        if (add) {
          // add new text-fields at the top of all friends textfields
          skillsList.insert(0, "");
        } else {
          skillsList.removeAt(index);
        }
        setState(() {});
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          (add) ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
// all inputs here are not required

        //*Country
        const CountryField(),

        //*City
        const CityField(),

        //*Age
        const AgeField(),

        //*past experiences

        const PastExperiencesField(),

        //*skills as array of string

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // name textfield
            const Text(
              'Add Skills',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            ..._getSkills(),
          ],
        ),
      ],
    );
  }
}

class SkillsTextFields extends StatefulWidget {
  final int index;
  const SkillsTextFields(this.index, {super.key});
  @override
  SkillsTextFieldsState createState() => SkillsTextFieldsState();
}

class SkillsTextFieldsState extends State<SkillsTextFields> {
  TextEditingController? _skillController;
  @override
  void initState() {
    super.initState();
    _skillController = TextEditingController();
  }

  @override
  void dispose() {
    _skillController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _skillController?.text = _SignUpSecondPageState.skillsList[widget.index];
    });
    return TextFormField(
      controller: _skillController,
      // save text field data in skills list at index
      // whenever text field value changes
      onChanged: (skill) {
        _SignUpSecondPageState.skillsList[widget.index] = skill;

        context
            .read<SignUpBloc>()
            .add(SkillsChanged(_SignUpSecondPageState.skillsList));
      },
      decoration: const InputDecoration(hintText: 'Enter your skill'),
      validator: (_) {
        return null;
      },
    );
  }
}
