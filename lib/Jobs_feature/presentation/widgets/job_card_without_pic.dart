import 'package:flutter/material.dart';
import 'package:snap_jobs/Jobs_feature/domain/entities/job_entity.dart';
import 'package:snap_jobs/Jobs_feature/presentation/pages/job_detail_page.dart';
import 'package:snap_jobs/core/util/colors_list.dart';

class JobCardWithoutPic extends StatelessWidget {
  final JobEntity job;
  final int _colorIndex;

  const JobCardWithoutPic({
    super.key,
    required this.job,
    required int index,
  }) : _colorIndex = index % 3;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: ColorsLists.backgroundColors[_colorIndex],
      child: Container(
        // width: 304,
        // height: 193,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),

        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  //*Title
                  child: Text(
                    job.jobTitle,
                    style: TextStyle(
                      color: ColorsLists.titleColors[_colorIndex],
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  //TODO: add location
                  // width: 128,
                  child: Text(
                    '10 km away ',
                    style: TextStyle(
                      color: ColorsLists.textColors[_colorIndex],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 24),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              // width: 256,
              child: Text(
                job.jobDescription,
                style: TextStyle(
                  color: ColorsLists.textColors[_colorIndex],
                  fontSize: 12,
                  // fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                  // height: 13.44,
                ),
              ),
            ),
            // const SizedBox(height: 24),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        ColorsLists.buttonColors[_colorIndex]),
                    foregroundColor: MaterialStateProperty.all<Color>(
                        ColorsLists.buttonTextColors[_colorIndex]),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => JobDetailPage(jobId: job.jobId),
                      ),
                    );
                  },
                  child: const Text(
                    'more info',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
