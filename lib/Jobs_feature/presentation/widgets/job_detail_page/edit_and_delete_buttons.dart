import 'package:flutter/src/material/elevated_button.dart';
import 'package:flutter/src/rendering/flex.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/text.dart';
import 'package:snap_jobs/Jobs_feature/domain/entities/job_entity.dart';
import 'package:snap_jobs/Jobs_feature/presentation/widgets/job_detail_page/delete_job_button.dart';
import 'package:snap_jobs/Jobs_feature/presentation/widgets/job_detail_page/update_job_button.dart';
import 'package:snap_jobs/offers_feature/presentation/widgets/offers_list.dart';

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
      height: deviceHeight * 0.3,
      width: deviceWidth * 0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              UpdateJobBtnWidget(post: job),
              DeleteJobBtnWidget(jobId: job.jobId),
            ],
          ),
          job.offers?.isEmpty ?? true
              ? const ElevatedButton(
                  onPressed: null,
                  child: Text("Wait for offers"),
                )
              : OffersListWidget(offers: job.offers!)
        ],
      ),
    );
  }
}
