import 'dart:math';

import 'package:flutter/material.dart';
import 'package:snap_jobs/Jobs_feature/domain/entities/job_entity.dart';
import 'package:snap_jobs/Jobs_feature/presentation/pages/job_detail_page.dart';
import 'package:snap_jobs/core/util/colors_list.dart';

class JobCardWithoutPic extends StatelessWidget {
  final JobEntity job;
  final int _colorIndex;
  final bool forHorizontal;
  const JobCardWithoutPic({
    super.key,
    required this.job,
    required int index,
    required this.forHorizontal,
  }) : _colorIndex = index % 3;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 5,
      color: ColorsLists.backgroundColors[_colorIndex],
      child: Padding(
        padding: forHorizontal
            ? const EdgeInsets.all(10)
            : const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
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
                      fontSize: forHorizontal
                          ? Theme.of(context).textTheme.titleMedium!.fontSize
                          : Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .fontSize,
                      fontWeight: forHorizontal
                          ? Theme.of(context).textTheme.titleMedium!.fontWeight
                          : Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .fontWeight,
                    ),
                  ),
                ),
                SizedBox(
                  //TODO: add location
                  child: Text(
                    '${job.distance} km away ',
                    style: TextStyle(
                        color: ColorsLists.textColors[_colorIndex],
                        fontSize: forHorizontal
                            ? Theme.of(context).textTheme.bodySmall!.fontSize
                            : Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .fontSize,
                        fontWeight: forHorizontal
                            ? Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .fontWeight
                            : Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .fontWeight),
                  ),
                ),
              ],
            ),
            //* job description
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                job.jobDescription,
                style: TextStyle(
                  color: ColorsLists.textColors[_colorIndex],
                  fontSize: forHorizontal
                      ? Theme.of(context).textTheme.bodyMedium!.fontSize
                      : Theme.of(context).textTheme.bodyLarge!.fontSize,
                  fontWeight: forHorizontal
                      ? Theme.of(context).textTheme.bodyMedium!.fontWeight
                      : Theme.of(context).textTheme.bodyLarge!.fontWeight,
                ),
              ),
            ),
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
                  child: Text(
                    'more info',
                    style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.labelMedium!.fontSize,
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
