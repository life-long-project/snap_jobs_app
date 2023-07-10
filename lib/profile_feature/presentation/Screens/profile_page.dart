import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shimmer/shimmer.dart';
import 'package:snap_jobs/Jobs_feature/presentation/widgets/jobs_page/message_display_widget.dart';
import 'package:snap_jobs/core/services/services_locator.dart';
import 'package:snap_jobs/core/widgets/loading_widget.dart';
import 'package:snap_jobs/profile_feature/presentation/controlers/bloc/get_profile_bloc/getbrofile_bloc.dart';
import 'package:snap_jobs/profile_feature/presentation/controlers/bloc/get_profile_bloc/getbrofile_state.dart';
import 'package:snap_jobs/profile_feature/presentation/wedgets/Recent_Review.dart';
import 'package:snap_jobs/profile_feature/presentation/wedgets/profile_img.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:snap_jobs/profile_feature/presentation/wedgets/rating.dart';

class ProfileScreen extends StatelessWidget {
  bool showMoreText = false;

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<GetProgileBloc>()..getoneprofileusecase,
        child: BlocConsumer<GetProgileBloc, GetProfileState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is GetProfileSuccess) {
              return Scaffold(
                appBar: AppBar(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    leading: IconButton(
                      icon: const Icon(Icons.menu),
                      color: Colors.black,
                      onPressed: () {},
                    ),
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.notifications_active),
                        onPressed: () {},
                        color: Colors.black,
                      ),
                    ]),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      ProfileImgnobloc(),
                      SizedBox(height: 20),
                      Text(
                        state.profilemodel.userName,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      //rating
                      const Rating(),
                      SizedBox(height: 10),
                      StatefulBuilder(builder:
                          (BuildContext context, StateSetter setState) {
                        return Column(children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              state.profilemodel.bio,
                              maxLines: 3,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                showMoreText = !showMoreText;
                              });
                            },
                            child:
                                Text(showMoreText ? 'Show Less' : 'Show More'),
                          ),
                        ]);
                      }),
                      SizedBox(height: 20),
                      Text(
                        'Recent Reviews',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) => const RecentReview(),
                        ),
                      ),
                    ],
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
