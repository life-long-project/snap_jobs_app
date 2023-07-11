import 'package:flutter/src/material/elevated_button.dart';
import 'package:flutter/src/material/scaffold.dart';
import 'package:flutter/src/material/snack_bar.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/text.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:snap_jobs/Jobs_feature/domain/entities/job_entity.dart';
import 'package:snap_jobs/Jobs_feature/presentation/bloc/post_job/post_job_bloc.dart';
import 'package:snap_jobs/offers_feature/presentation/widgets/offer_card.dart';

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
              job.offers!.firstWhere((element) =>
                  element.isAccepted),
              context),
          ElevatedButton(
            onPressed: () async {
              BlocProvider.of<PostJobBloc>(
                      context)
                  .add(FinishJobEvent(
                      jobId: job.jobId));

              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(
                content: SnackBar(
                    content: Text(
                        'Thanks for using SnapJobs')),
              ));
            },
            child: const Text("Finish Job "),
          )
        ],
      );
  }
}
