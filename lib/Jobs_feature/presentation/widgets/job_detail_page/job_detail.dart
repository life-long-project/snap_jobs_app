import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_jobs/Jobs_feature/domain/entities/job_entity.dart';
import 'package:snap_jobs/core/services/services_locator.dart';
import 'package:snap_jobs/offers_feature/presentation/bloc/offer_bloc.dart';
import 'package:snap_jobs/offers_feature/presentation/pages/Add_offer_dialog.dart';
import 'package:snap_jobs/Jobs_feature/presentation/widgets/job_detail_page/update_job_button.dart';
import 'package:snap_jobs/offers_feature/presentation/widgets/offers_list.dart';
import 'package:user_repository/user_repository.dart';

import 'delete_job_button.dart';

class JobDetailWidget extends StatelessWidget {
  final JobEntity job;
  const JobDetailWidget({
    Key? key,
    required this.job,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.along(Axis.horizontal);
    final deviceHeight = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.along(Axis.vertical) -
        kToolbarHeight -
        kBottomNavigationBarHeight);
    return SingleChildScrollView(
      child: SizedBox(
        height: deviceHeight * 0.9,
        width: deviceWidth * 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              job.jobTitle,
              style: Theme.of(context).textTheme.displaySmall,
            ),

            Text(
              job.jobDescription,
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            Text(
              'Job Type: ${job.jobType.toString().split('.').last}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "Posted by",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                  (RepositoryProvider.of<UserRepository>(context).user.id ==
                          job.userId)
                      ? TextSpan(
                          text: " You",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                        )
                      : TextSpan(
                          text: " ${job.userName}",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                ],
              ),
            ),
            //* Images of the job
            SizedBox(
              height: deviceHeight * 0.3,
              width: deviceWidth * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  job.image.isNotEmpty
                      ? FadeInImage.assetNetwork(
                          placeholder: 'assets/images/logo_blue_text.png',
                          image: job.image[0]!,
                        )
                      : Expanded(
                          flex: 2,
                          child:
                              Image.asset('assets/images/logo_blue_text.png')),
                  Expanded(
                    flex: 1,
                    child: Row(children: [
                      job.image.length > 1
                          ? Expanded(
                              flex: 1,
                              child: FadeInImage.assetNetwork(
                                placeholder: 'assets/images/logo_blue_text.png',
                                image: job.image[1]!,
                              ),
                            )
                          : Expanded(
                              flex: 1,
                              child: Image.asset(
                                  'assets/images/logo_blue_text.png')),
                      job.image.length > 2
                          ? Expanded(
                              flex: 1,
                              child: FadeInImage.assetNetwork(
                                placeholder: 'assets/images/logo_blue_text.png',
                                image: job.image[2]!,
                              ),
                            )
                          : Expanded(
                              flex: 1,
                              child: Image.asset(
                                  'assets/images/logo_blue_text.png')),
                    ]),
                  )
                ],
              ),
            ),

            //*additional info
            SizedBox(
              height: deviceHeight * 0.2,
              width: deviceWidth * .9,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //*time since the job posted
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.access_time,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                          TextSpan(
                            text: _getTextTellingHowLongAgo(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                ),
                          )
                        ],
                      ),
                    ),
                    //* location of job
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.location_on_outlined,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                          TextSpan(
                            text: "hardcoded",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                ),
                          )
                        ],
                      ),
                    ),
                    //*salary requsted
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.attach_money_outlined,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                          TextSpan(
                            text: job.salary.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                ),
                          )
                        ],
                      ),
                    ),
                  ]),
            ),
            //* Actions
            RepositoryProvider.of<UserRepository>(context).user.id == job.userId
                ? SizedBox(
                    height: deviceHeight * 0.2,
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
                            ? Container()
                            : OffersListWidget(offers: job.offers!)
                      ],
                    ),
                  )
                : ElevatedButton(
                    onPressed: () => _addOfferDialogBuilder(context),
                    child: Text("Apply"),
                  ),
          ],
        ),
      ),
    );
  }

  String _getTextTellingHowLongAgo() {
    final difference = DateTime.now().difference(job.dateTime);
    if (difference.inDays > 30) {
      return "${difference.inDays ~/ 30} months ago";
    } else if (difference.inDays > 0) {
      return "${difference.inDays} days ago";
    } else if (difference.inHours > 0) {
      return "${difference.inHours} hours ago";
    } else if (difference.inMinutes > 0) {
      return "${difference.inMinutes} minutes ago";
    } else {
      return "${DateTime.now().difference(job.dateTime).inSeconds} seconds ago";
    }
  }

  Future<void> _addOfferDialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return BlocProvider(
          create: (context) => sl<OfferBloc>(),
          child: AddOfferDialog(job: job),
        );
      },
    );
  }
}
