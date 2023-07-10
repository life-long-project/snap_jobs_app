import 'package:flutter/material.dart';
import 'package:snap_jobs/Jobs_feature/domain/entities/post_job_entity.dart';

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
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                posts[index].jobDescription,
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                'Job Type: ${posts[index].jobType}',
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                'Salary: ${posts[index].salary}',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),

          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
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
      separatorBuilder: (context, index) => const Divider(thickness: 1),
    );
  }
}
