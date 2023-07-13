import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_jobs/Jobs_feature/domain/entities/job_entity.dart';
import 'package:snap_jobs/Jobs_feature/presentation/bloc/post_job/post_job_bloc.dart';
import 'package:snap_jobs/Jobs_feature/presentation/widgets/job_detail_page/accepted_offer_and_finish_button.dart';
import 'package:snap_jobs/Jobs_feature/presentation/widgets/job_detail_page/edit_and_delete_buttons.dart';
import 'package:snap_jobs/core/services/services_locator.dart';
import 'package:snap_jobs/offers_feature/presentation/bloc/offer_bloc.dart';
import 'package:snap_jobs/offers_feature/presentation/pages/Add_offer_dialog.dart';
import 'package:snap_jobs/Jobs_feature/presentation/widgets/job_detail_page/update_job_button.dart';
import 'package:snap_jobs/offers_feature/presentation/widgets/offer_card.dart';
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
        kToolbarHeight);
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: deviceHeight,
        maxWidth: deviceWidth * 0.9,
        minHeight: deviceHeight,
        minWidth: deviceWidth * 0.9,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          constraints: BoxConstraints(
            maxHeight: double.infinity,
            maxWidth: deviceWidth * 0.9,
            minHeight: deviceHeight * 0.9,
            minWidth: deviceWidth * 0.9,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: TextDirection.ltr,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: deviceWidth * 0.9,
                  minWidth: deviceWidth * 0.9,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      //* pic and job name , type and description
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          fit: FlexFit.loose,
                          flex: 1,
                          child: Container(
                            constraints: BoxConstraints(
                              maxHeight: deviceHeight * 0.3,
                              maxWidth: deviceWidth * 0.9,
                              minHeight: deviceHeight * 0.1,
                            ),
                            child: Column(
                              //* job name ,type and description
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  fit: FlexFit.loose,
                                  flex: 2,
                                  child: Text(
                                    job.jobTitle,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                  ),
                                ),
                                Flexible(
                                  fit: FlexFit.loose,
                                  flex: 2,
                                  child: Text(
                                    job.jobDescription,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                                Column(
                                  //*job Type and posted by
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      fit: FlexFit.loose,
                                      flex: 1,
                                      child: RichText(
                                        text: TextSpan(
                                          children: <TextSpan>[
                                            //* job type
                                            TextSpan(
                                              text: "Job Type: ",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onBackground,
                                                  ),
                                            ),
                                            TextSpan(
                                              text: job.jobType
                                                  .toString()
                                                  .split('.')
                                                  .last
                                                  .split(RegExp(
                                                      r"(?<!(^|[A-Z]))(?=[A-Z])|(?<!^)(?=[A-Z][a-z])"))
                                                  .join(" "),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      fit: FlexFit.loose,
                                      child: RichText(
                                        text: TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: "Posted by",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onBackground,
                                                  ),
                                            ),
                                            (RepositoryProvider.of<
                                                                UserRepository>(
                                                            context)
                                                        .user
                                                        .id ==
                                                    job.userId)
                                                ? TextSpan(
                                                    text: " You",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium
                                                        ?.copyWith(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .onSurface,
                                                        ),
                                                  )
                                                : TextSpan(
                                                    text: " ${job.userName}",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium,
                                                  ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          //* Images of the job
                          height: deviceHeight * 0.4,
                          width: deviceWidth * .9,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              job.image.isNotEmpty
                                  ? Flexible(
                                      flex: 1,
                                      fit: FlexFit.tight,
                                      child: FadeInImage.assetNetwork(
                                        fit: BoxFit.fitHeight,
                                        placeholder:
                                            'assets/images/barista.jpg',
                                        image: job.image[0]!,
                                      ),
                                    )
                                  : Flexible(
                                      fit: FlexFit.tight,
                                      child: Image.asset(
                                        fit: BoxFit.fitHeight,
                                        'assets/images/barista.jpg',
                                      ),
                                    ),

                              // Expanded(
                              //   flex: 1,
                              //   child: Row(children: [
                              //     job.image.length > 1
                              //         ? Expanded(
                              //             flex: 1,
                              //             child: FadeInImage.assetNetwork(
                              //               placeholder: 'assets/images/logo_blue_text.png',
                              //               image: job.image[1]!,
                              //             ),
                              //           )
                              //         : Expanded(
                              //             flex: 1,
                              //             child: Image.asset(
                              //                 'assets/images/logo_blue_text.png')),
                              //     job.image.length > 2
                              //         ? Expanded(
                              //             flex: 1,
                              //             child: FadeInImage.assetNetxt)
                              //text(
                              //               placeholder: 'assets/images/logo_blue_text.png',
                              //               image: job.image[2]!,
                              //             ),
                              //           )
                              //         : Expanded(
                              //             flex: 1,
                              //             child: Image.asset(
                              //                 'assets/images/logo_blue_text.png')),
                              //   ]),
                              // )
                            ],
                          ),
                        ),
                        //*additional info
                        Flexible(
                          fit: FlexFit.loose,
                          child: SizedBox(
                            height: deviceHeight * 0.09,
                            width: deviceWidth * .9,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  RichText(
                                    //*salary requsted

                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      children: [
                                        WidgetSpan(
                                          child: Icon(
                                            Icons.attach_money_outlined,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface,
                                          ),
                                        ),
                                        TextSpan(
                                          text: job.salary.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onBackground,
                                              ),
                                        )
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    //*time since the job posted

                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      children: [
                                        WidgetSpan(
                                          child: Icon(
                                            Icons.access_time,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface,
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
                                  RichText(
                                    //* location of job

                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      children: [
                                        WidgetSpan(
                                          child: Icon(
                                            Icons.location_on_outlined,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "Dahab",
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
                        ),
                      ],
                    ),
                    Column(
                      //* Actions
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        (!job.isFinished)
                            ?( RepositoryProvider.of<UserRepository>(context)
                                .user.id! ==
                                   job.userId) ?
                                   (job.isActive)  ?
                                    //job is active and by the user, the user
                                    // should see options add, delete and list of offers to
                                    //choose from
                                    Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            //* Edit button and delete button
                                            fit: FlexFit.loose,
                                            child: EditAndDeleteButtons(
                                                deviceHeight: deviceHeight,
                                                deviceWidth: deviceWidth,
                                                job: job),
                                          ),
                                          //checks if there is offers
                                          //and display them if so

                                          job.offers?.isEmpty ?? true
                                              ? const ElevatedButton(
                                                  onPressed: null,
                                                  child:
                                                      Text("Wait for offers"),
                                                )
                                              : Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "offers",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displaySmall!
                                                          ,

                                                    ),
                                                    //* offers list

                                                    OffersListWidget(
                                                        offers: job.offers!),
                                                  ],
                                                )
                                        ],
                                      )
                                    :
                                    //job is not active and by the user, the user
                                    // should see options finish job and the
                                    //accepted offer
                                    Flexible(
                                        fit: FlexFit.loose,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            job.offers?.isEmpty ?? true
                                                //show nothing if the chosen offer is
                                                //not available.
                                                //this case is  a bug in backend
                                                //and won't be reached if everything
                                                //went as planned
                                                ? const SizedBox.shrink()
                                                //*the accepted offer card

                                                : AcceptedOfferAndFinishButton(
                                                    job: job),
                                          ],
                                        ),
                                      )
                                :
                                //if job is not by the user, the user
                                // should see options apply
                                //if they didn't apply before

                                job.isAlreadyApplied ?? false
                                    ? const ElevatedButton(
                                        onPressed: null,
                                        child: Text("Already Applied"),
                                      )
                                    : ElevatedButton(
                                        onPressed: () =>
                                            _addOfferDialogBuilder(context),
                                        child: Text("Apply"),
                                      )
                            :
                            //if job is finished there are no actions for now
                            const SizedBox.shrink(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
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
