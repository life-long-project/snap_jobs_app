import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:post_job/post_job_feature/domain/entities/post_job_entity.dart';
import 'package:post_job/post_job_feature/presentation/widgets/job_detail_page/update_job_button.dart';

import 'delete_job_button.dart';

class JobDetailWidget extends StatelessWidget {
  final JobPost post;
  const JobDetailWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Text(
            post.jobName,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(
            height: 50,
          ),
          Text(
            post.jobDescription,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Divider(
            height: 50,
          ),
          Text(
            'Salary: \$${post.salary}',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
         
          SizedBox(height: 10),
          Text(
            'Job Type: ${post.jobType}',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Divider(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              UpdateJobBtnWidget(post: post),
              DeleteJobBtnWidget(jobId: post.jobId)
            ],
          )
        ],
      ),
    );
  }
}
