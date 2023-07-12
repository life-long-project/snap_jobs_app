import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_jobs/Jobs_feature/domain/entities/job_entity.dart';
import 'package:snap_jobs/Jobs_feature/presentation/bloc/post_job/post_job_bloc.dart';
import 'package:snap_jobs/Jobs_feature/presentation/pages/job_detail_page.dart';
import 'package:snap_jobs/chat_fetaure/presentation/chat_page.dart';
import 'package:snap_jobs/core/services/services_locator.dart';
import 'package:snap_jobs/core/util/colors_list.dart';
import 'package:user_repository/user_repository.dart';

class JobCardWithoutPic extends StatelessWidget {
  final JobEntity job;
  final int _colorIndex;
  final bool forHorizontal;
  final bool canContact;
  const JobCardWithoutPic({
    super.key,
    required this.job,
    required int index,
    required this.forHorizontal,
    required this.canContact,
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
                    RepositoryProvider.of<UserRepository>(context)
                                        .user
                                        .id ==
                                    job.userId? '0 km away':
                    '${job.distance} km away ',
                    style: TextStyle(
                        color: ColorsLists.textColors[_colorIndex],
                        fontSize: forHorizontal
                            ? Theme.of(context).textTheme.bodySmall!.fontSize
                            : Theme.of(context).textTheme.bodyMedium!.fontSize,
                        fontWeight: forHorizontal
                            ? Theme.of(context).textTheme.bodySmall!.fontWeight
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsetsDirectional.symmetric(horizontal: 5),
                  child: ElevatedButton(
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
                          builder: (_) => BlocProvider<PostJobBloc>(
                           create: (_) => sl<PostJobBloc>(),
                            child: JobDetailPage(jobId: job.jobId),
                          ),
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
                ),
                canContact
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const ChatPage(),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.message,
                              color: ColorsLists.buttonColors[_colorIndex],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              //dialoage to show the phone number
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Phone Number'),
                                    content: Text(job.userId ??
                                        "phone number not found  "),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Close'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: Icon(
                              Icons.call,
                              color: ColorsLists.buttonColors[_colorIndex],
                            ),
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
