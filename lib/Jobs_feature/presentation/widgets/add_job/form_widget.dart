import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/post_job_entity.dart';

import '../../bloc/post_job/post_job_bloc.dart';
import 'submit_button.dart';
import 'text_form.dart';

class FormWidget extends StatefulWidget {
  final JobPost? post;
  const FormWidget({
    Key? key,
    this.post,
  }) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _jobNameController = TextEditingController();
  TextEditingController _jobDescriptionController = TextEditingController();
  TextEditingController _jobTypeController = TextEditingController();
  TextEditingController _salaryController = TextEditingController();

  @override
  void initState() {
    if (widget.post != null) {
      _jobNameController.text = widget.post!.jobName;
      _jobDescriptionController.text = widget.post!.jobDescription;
      _jobTypeController.text = widget.post!.jobType;
      _salaryController.text = widget.post!.salary.toString();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormFieldWidget(
                name: "Job Name",
                multiLines: false,
                controller: _jobNameController),
            TextFormFieldWidget(
                name: "Description",
                multiLines: true,
                controller: _jobDescriptionController),
            TextFormFieldWidget(
                name: "Job Type",
                multiLines: false,
                controller: _jobTypeController),
            TextFormFieldWidget(
                name: "Salary",
                multiLines: false,
                controller: _salaryController),
            FormSubmitBtn(
                isUpdateJob: (widget.post != null),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    UpdateOrAddPost;
                  } else {
                     null;
                  }
                }),
          ]),
    );
  }

  void UpdateOrAddPost() {
    final post = JobPost(
      jobName: _jobNameController.text,
      jobDescription: _jobDescriptionController.text,
      jobType: _jobTypeController.text,
      jobId: '',
      image: null,
      salary: int.parse(_salaryController.text),
    );

    if (widget.post != null) {
      BlocProvider.of<AddDeleteUpdateJobBloc>(context)
          .add(UpdateJobEvent(post: post));
    } else {
      BlocProvider.of<AddDeleteUpdateJobBloc>(context)
          .add(AddJobEvent(post: post));
    }
  }
}
