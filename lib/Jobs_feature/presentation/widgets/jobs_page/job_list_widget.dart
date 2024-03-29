import 'package:flutter/material.dart';
import 'package:snap_jobs/Jobs_feature/domain/entities/job_entity.dart';
import 'package:snap_jobs/Jobs_feature/presentation/widgets/job_card_without_pic.dart';

class JobListWidget extends StatelessWidget {
  final List<JobEntity> posts;
  final Axis scrollDirection;
  final bool canContact;

  const JobListWidget({
    Key? key,
    required this.posts,
   required this.canContact ,
    this.scrollDirection = Axis.vertical,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return ListView.builder(
      itemCount: posts.length,

      scrollDirection: scrollDirection,




      itemBuilder: (context, index) {
        return JobCardWithoutPic(
          job: posts[index],
          index: (scrollDirection == Axis.vertical) ? index : 2,
          forHorizontal: scrollDirection == Axis.horizontal,
          canContact: canContact,
        );
      },

      // separatorBuilder: (context, index) => const Divider(thickness: 0 , color: Colors.transparent),
    );
  }
}
