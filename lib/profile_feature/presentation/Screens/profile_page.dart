import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_jobs/Jobs_feature/presentation/widgets/job_card_without_pic.dart';

import 'package:snap_jobs/Jobs_feature/presentation/widgets/jobs_page/message_display_widget.dart';
import 'package:snap_jobs/core/services/services_locator.dart';
import 'package:snap_jobs/core/widgets/loading_widget.dart';
import 'package:snap_jobs/profile_feature/presentation/controlers/bloc/get_profile_bloc/getbrofile_bloc.dart';
import 'package:snap_jobs/profile_feature/presentation/controlers/bloc/get_profile_bloc/getbrofile_state.dart';
import 'package:snap_jobs/profile_feature/presentation/widgets/Recent_Review.dart';
import 'package:snap_jobs/profile_feature/presentation/widgets/rating.dart';
import 'package:snap_jobs/profile_feature/presentation/widgets/upload_profile_img.dart';

class ProfileScreen extends StatelessWidget {
  bool showMoreText = false;

  ProfileScreen({super.key});
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => ProfileScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            sl<GetProfileBloc>()..add(GetOneProfileModelEvent()),
        child: BlocConsumer<GetProfileBloc, GetProfileState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is GetProfileSuccess) {
              return Scaffold(
                appBar: AppBar(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.notifications_active),
                        onPressed: () {},
                        color: Colors.black,
                      ),
                    ]),
                body: Container(
                  constraints: const BoxConstraints(),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        //*Profile Image
                        const uploadProfileImg(),

                        const SizedBox(height: 20),
                        //* User full Name
                        Text(
                          "${state.profileModel.user.firstName} ${state.profileModel.user.lastName}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        // *  rating
                        Rating(
                          currentRating: state.profileModel.user.rating,
                          rateStar: const Icon(
                            Icons.circle,
                            color: Colors.blue,
                          ),
                          textColor: Theme.of(context).colorScheme.onBackground,
                        ),
                        const SizedBox(height: 10),
                        StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                          return Column(children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                (state.profileModel.user.pastExperience
                                                ?.length ??
                                            0) >
                                        50
                                    ? state.profileModel.user.pastExperience!
                                    : """
Experienced software engineer with a passion for building innovative products.
Proven ability to lead and mentor teams to deliver high-quality results
                                """,
                                maxLines: 3,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(height: 10),
                          ]);
                        }),
                        const SizedBox(height: 20),
                        const Text(
                          'Recent Reviews',

                          //TODO: Update UI And Complete Doing Usecase
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 120,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.profileModel.rates.length,
                            itemBuilder: (context, index) =>
                                state.profileModel.rates.isNotEmpty
                                    ? RecentReview(
                                        state.profileModel.rates[index]!, index)
                                    : const SizedBox(),
                          ),
                        ),
                        state.profileModel.jobs.isEmpty ?? true
                            ? const SizedBox()
                            : Column(
                                children: [
                                  for (int i = 0;
                                      i < state.profileModel.jobs.length;
                                      i++)
                                    JobCardWithoutPic(
                                      job: state.profileModel.jobs[i]!
                                          .toEntity(),
                                      index: 3,
                                      forHorizontal: false,
                                      canContact: false,
                                    ),
                                ],
                              ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is GetProfileLoading) {
              return const LoadingWidget();
            } else if (state is GetProfileFailure) {
              return MessageDisplayWidget(message: state.message);
            }
            return const LoadingWidget();
          },
        ));
  }
}
