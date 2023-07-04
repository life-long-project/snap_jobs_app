import 'package:flutter/material.dart';
import 'package:snap_jobs/Jobs_feature/domain/entities/job_entity.dart';
import 'package:snap_jobs/Jobs_feature/presentation/widgets/job_card_without_pic.dart';


class JobListWidget extends StatelessWidget {
  final List<JobEntity> posts;

  const JobListWidget({
    Key? key,
    required this.posts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: posts.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return JobCardWithoutPic(
          job: posts[index],
          index: index,
        );
      },
      separatorBuilder: (context, index) => const Divider(thickness: 1),
    );
  }
}
