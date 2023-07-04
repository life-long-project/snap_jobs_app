import 'package:flutter/material.dart';
import 'package:snap_jobs/Jobs_feature/domain/entities/job_entity.dart';

class JobTypeFormField extends StatefulWidget {
  final TextEditingController controller;
  const JobTypeFormField({super.key, required this.controller});

  @override
  State<JobTypeFormField> createState() => _JobTypeFormFieldState();
}

class _JobTypeFormFieldState extends State<JobTypeFormField> {
  var _selectedJobType = JobType.values[0];

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: const InputDecoration(
        labelText: 'Job Type',
      ),
      child: DropdownButton<JobType>(
        value: _selectedJobType,
        onChanged: (newValue) {
          widget.controller.text = newValue.toString();
          setState(() {
            _selectedJobType = newValue ?? JobType.fullTime;
          });
        },
        items: JobType.values
            .map((e) => DropdownMenuItem<JobType>(
                  value: e,
                  child: Text(
                    e.toString().split('.').last,
                  ),
                ))
            .toList(),
      ),
    );
  }
}
