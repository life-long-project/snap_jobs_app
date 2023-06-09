import 'package:flutter/material.dart';
import 'package:snap_jobs/Jobs_feature/domain/entities/job_entity.dart';

import '../../pages/create_job_page.dart';

class UpdateJobBtnWidget extends StatelessWidget {
  final JobEntity post;
  const UpdateJobBtnWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>  AddJobPage(
                job: post,
                isUpdateJob: true,
              ),
            ));
      },
      icon: const Icon(Icons.edit),
      label: const Text("Edit"),
    );
  }
}
