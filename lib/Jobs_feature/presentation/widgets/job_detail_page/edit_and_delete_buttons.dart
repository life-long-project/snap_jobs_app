import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:snap_jobs/Jobs_feature/domain/entities/job_entity.dart';
import 'package:snap_jobs/Jobs_feature/presentation/widgets/job_detail_page/delete_job_button.dart';
import 'package:snap_jobs/Jobs_feature/presentation/widgets/job_detail_page/update_job_button.dart';

class EditAndDeleteButtons extends StatelessWidget {
  const EditAndDeleteButtons({
    super.key,
    required this.deviceHeight,
    required this.deviceWidth,
    required this.job,
  });

  final double deviceHeight;
  final double deviceWidth;
  final JobEntity job;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: deviceHeight * 0.1,
      width: deviceWidth * 0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              UpdateJobBtnWidget(post: job),
              DeleteJobBtnWidget(jobId: job.jobId),
            ],
          ),
        ],
      ),
    );
  }
}
