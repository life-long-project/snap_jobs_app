import 'package:flutter/material.dart';
import 'package:post_job/post_job_feature/domain/entities/post_job_entity.dart';

import '../../pages/job_detail_page.dart';

class JobListWidget extends StatelessWidget {
  final List<JobPost> posts;

  const JobListWidget({
    Key? key,
    required this.posts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text(posts[index].jobId),
          title: Text(
            posts[index].jobName,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                posts[index].jobDescription,
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Job Type: ${posts[index].jobType}',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Salary: ${posts[index].salary}',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
         
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => JobDetailPage(post: posts[index]),
              ),
            );
          },
        );
      },
      separatorBuilder: (context, index) => Divider(thickness: 1),
    );
  }
}
