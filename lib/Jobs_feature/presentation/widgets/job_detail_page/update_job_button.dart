import 'package:flutter/material.dart';
import 'package:post_job/post_job_feature/domain/entities/post_job_entity.dart';

import '../../pages/create_job_page.dart';

class UpdateJobBtnWidget extends StatelessWidget {
  final JobPost post;
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
              builder: (_) => AddJobPage(
                isUpdateJob: true,
                
              ),
            ));
      },
      icon: Icon(Icons.edit),
      label: Text("Edit"),
    );
  }
}