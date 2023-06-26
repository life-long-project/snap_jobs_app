import 'package:flutter/material.dart';
import 'package:snap_jobs/Jobs_feature/domain/entities/job_entity.dart';

class JobTypeFormField extends StatelessWidget {
  final TextEditingController controller;
  const JobTypeFormField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: const InputDecoration(
        labelText: 'Job Type',
      ),
      child: DropdownButton<JobType>(
        onChanged: (newValue) {

          controller.text = newValue.toString();
        },
        items: JobType.values
            .map((e) => DropdownMenuItem<JobType>(
                  value: e,
                  child: Text(e.toString()),
                ))
            .toList(),
      ),
    );
  }
}
