import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:snap_jobs/Jobs_feature/domain/entities/job_entity.dart';
import 'package:snap_jobs/Jobs_feature/presentation/bloc/post_job/post_job_bloc.dart';
import 'package:snap_jobs/core/services/services_locator.dart';
import 'package:snap_jobs/offers_feature/presentation/widgets/offer_card.dart';
import 'package:snap_jobs/rate_feature/data/repositories/rate_repository.dart';

class AcceptedOfferAndFinishButton extends StatelessWidget {
  const AcceptedOfferAndFinishButton({
    super.key,
    required this.job,
  });

  final JobEntity job;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        offerCard(
            job.offers!.firstWhere((element) => element.isAccepted), context),
        ElevatedButton(
          onPressed: () async {
            BlocProvider.of<PostJobBloc>(context)
                .add(FinishJobEvent(jobId: job.jobId));
            await Duration(seconds: 0);
            await Future.doWhile(() async {
              await Future.delayed(const Duration(milliseconds: 100));
              return BlocProvider.of<PostJobBloc>(context).state.status ==
                  PostJobStatus.loading;
            });

            if (context.mounted) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  int rating = 0;
                  String feedback = '';

                  return AlertDialog(
                    title: Text('Rate the other user'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RatingBar.builder(
                          itemSize: 30,
                          initialRating: rating.toDouble(),
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (value) {
                            rating = value.toInt();
                          },
                        ),
                        SizedBox(height: 16),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter your feedback',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            feedback = value;
                          },
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          sl<BaseRateRepo>()
                              .postRating(job.jobId, rating, feedback);
                          Navigator.of(context).pop();
                        },
                        child: Text('Submit'),
                      ),
                    ],
                  );
                },
              );
            }
          },
          child: const Text("Finish Job "),
        )
      ],
    );
  }
}
