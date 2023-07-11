import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/job_entity.dart';

import '../../bloc/post_job/post_job_bloc.dart';
import 'job_type_form_field.dart';
import 'submit_button.dart';
import 'text_form.dart';

class AddJobFormWidget extends StatefulWidget {
  final JobEntity? post;
  const AddJobFormWidget({
    Key? key,
    this.post,
  }) : super(key: key);

  @override
  State<AddJobFormWidget> createState() => _AddJobFormWidgetState();
}

class _AddJobFormWidgetState extends State<AddJobFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _jobNameController = TextEditingController();
  final TextEditingController _jobDescriptionController =
      TextEditingController();

  final TextEditingController _jobTypeController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();
  static List<String> skillsList = [""];
  List<Widget> _getSkills() {
    List<Widget> skillsTextFieldsList = [];
    for (int i = 0; i < skillsList.length; i++) {
      skillsTextFieldsList.add(
        Padding(
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
        ),
      );
    }
    return skillsTextFieldsList;
  }

  void updateOrAddPost() {
    final post = JobEntity(
      dateTime: DateTime.now(),
      jobTitle: _jobNameController.text,
      jobDescription: _jobDescriptionController.text,
      jobType: _jobTypeController.text == "fullTime"
          ? JobType.fullTime
          : _jobTypeController.text == "partTime"
              ? JobType.partTime
              : JobType.service,
      jobId: '',
      isFinished: false,
      skills: skillsList,
      image: const [],
      salary: int.parse(_salaryController.text),
    );

    if (widget.post != null) {
      BlocProvider.of<PostJobBloc>(context).add(UpdateJobEvent(post: post));
    } else {
      BlocProvider.of<PostJobBloc>(context).add(AddJobEvent(post: post));
    }
  }

  // the add skills ui is hard to extract yet
  // so i will leave it here for now
  //TODO: extract add skills ui
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
  void initState() {
    if (widget.post != null) {
      _jobNameController.text = widget.post!.jobTitle;
      _jobDescriptionController.text = widget.post!.jobDescription;
      _jobTypeController.text = widget.post!.jobType == JobType.fullTime
          ? "fullTime"
          : widget.post!.jobType == JobType.partTime
              ? "partTime"
              : "service";
      _salaryController.text = widget.post!.salary.toString();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormFieldWidget(
                name: "Job Name",
                multiLines: false,
                controller: _jobNameController,
              ),
              TextFormFieldWidget(
                name: "Description",
                multiLines: true,
                controller: _jobDescriptionController,
              ),
              JobTypeFormField(
                controller: _jobTypeController,
              ),
              TextFormFieldWidget(
                name: "Salary",
                multiLines: false,
                controller: _salaryController,
                numbersOnly: true,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // name textfield
                  const Text(
                    'required Skills',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  ..._getSkills(),
                ],
              ),
              FormSubmitBtn(
                  isUpdateJob: (widget.post != null),
                  onPressed: () {
                    if (_formKey.currentState!.validate() 
                      ) {
                      updateOrAddPost();
                    } else {
                      null;
                    }
                  }),
            ]),
      ),
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
      _skillController?.text = _AddJobFormWidgetState.skillsList[widget.index];
    });
    return TextFormField(
      controller: _skillController,
      // save text field data in skills list at index
      // whenever text field value changes
      onChanged: (skill) {
        _AddJobFormWidgetState.skillsList[widget.index] = skill;
      },
      decoration: const InputDecoration(hintText: 'Enter your skill'),
      validator: (_) {
        return null;
      },
    );
  }
}
