import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/job_entity.dart';

import '../../bloc/post_job/post_job_bloc.dart';
import 'job_type_form_field.dart';
import 'submit_button.dart';
import 'text_form.dart';

class FormWidget extends StatefulWidget {
  final JobEntity? post;
  const FormWidget({
    Key? key,
    this.post,
  }) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _jobNameController = TextEditingController();
  final TextEditingController _jobDescriptionController =
      TextEditingController();

  final TextEditingController _jobTypeController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();

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
            JobTypeFormField(controller: _jobTypeController),
            TextFormFieldWidget(
                name: "Salary",
                multiLines: false,
                controller: _salaryController),
            FormSubmitBtn(
                isUpdateJob: (widget.post != null),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    updateOrAddPost();
                  } else {
                    null;
                  }
                }),
          ]),
    );
  }

  void updateOrAddPost() {
    final post = JobEntity(
      jobTitle: _jobNameController.text,
      jobDescription: _jobDescriptionController.text,
      jobType: _jobTypeController.text == "fullTime"
          ? JobType.fullTime
          : _jobTypeController.text == "partTime"
              ? JobType.partTime
              : JobType.service,
      jobId: '',
      image: null,
      salary: int.parse(_salaryController.text),
    );

    if (widget.post != null) {
      BlocProvider.of<PostJobBloc>(context).add(UpdateJobEvent(post: post));
    } else {
      BlocProvider.of<PostJobBloc>(context).add(AddJobEvent(post: post));
    }
  }
}
