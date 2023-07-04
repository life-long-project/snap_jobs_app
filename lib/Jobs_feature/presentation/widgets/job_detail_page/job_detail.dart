import 'package:flutter/material.dart';
import 'package:snap_jobs/Jobs_feature/domain/entities/job_entity.dart';
import 'package:snap_jobs/Jobs_feature/presentation/widgets/job_detail_page/update_job_button.dart';

import 'delete_job_button.dart';

class JobDetailWidget extends StatelessWidget {
  final JobEntity post;
  const JobDetailWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.jobTitle,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const Divider(
            height: 50,
          ),
          Text(
            post.jobDescription,
            style: Theme.of(context).textTheme.bodyMedium,


          ),
          const Divider(
            height: 50,
          ), RichText (
            text: TextSpan(

              children: <TextSpan>[
                TextSpan(
                  text: "Posted by",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
color: Theme.of(context).colorScheme.onBackground,            ),
                ),
                TextSpan(
                  text: " ${post.userId ?? "ahmed hamdy"}",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),


              ],
            ),
          ),

          Text(
            'posted by: ${post.userId ?? "ahmed hamdy"}',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Salary: \$${post.salary}',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Job Type: ${post.jobType}',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const Divider(
            height: 50,
          ),
          Row(

             children:[
//TODO 
//  RichText(


//             ),
//             RichText(),
//             RichText(),

             ]



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
