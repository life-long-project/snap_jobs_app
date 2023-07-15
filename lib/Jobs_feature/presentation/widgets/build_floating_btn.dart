
import 'package:flutter/material.dart';
import 'package:snap_jobs/Jobs_feature/presentation/pages/create_job_page.dart';

class BuildFloatingBtn extends StatelessWidget {
  const BuildFloatingBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          AddJobPage.addJobRoute(),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
