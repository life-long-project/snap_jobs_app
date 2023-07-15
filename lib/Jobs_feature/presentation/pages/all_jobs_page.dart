import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_jobs/Jobs_feature/presentation/bloc/post_job/post_job_bloc.dart';
import 'package:snap_jobs/Jobs_feature/presentation/bloc/request_jobs/bloc/request_jobs_bloc.dart';
import 'package:snap_jobs/Jobs_feature/presentation/widgets/active_and_all_jobs.dart';
import 'package:snap_jobs/Jobs_feature/presentation/widgets/build_floating_btn.dart';
import 'package:snap_jobs/core/services/services_locator.dart';
import 'package:user_repository/user_repository.dart';

import '../../../core/widgets/loading_widget.dart';
import '../widgets/jobs_page/job_list_widget.dart';
import '../widgets/jobs_page/message_display_widget.dart';

class AllJobsPage extends StatefulWidget {
  const AllJobsPage({Key? key}) : super(key: key);

  @override
  State<AllJobsPage> createState() => _AllJobsPageState();
}

class _AllJobsPageState extends State<AllJobsPage> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.along(Axis.horizontal);
    final deviceHeight = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.along(Axis.vertical) -
        kToolbarHeight -
        kBottomNavigationBarHeight);



    return MultiBlocProvider(
      providers: [
        BlocProvider<RequestJobsBloc>(
            lazy: false,
            create: (context) {
              return sl<RequestJobsBloc>();
            }),
        BlocProvider(create: (_) => sl<PostJobBloc>())
      ],
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: BlocBuilder<RequestJobsBloc, RequestJobsState>(
            buildWhen: (previous, current) {
              return previous.jobs != current.jobs ||
                  previous.userActiveJobs != current.userActiveJobs ||
                  previous.requestJobsStatus != current.requestJobsStatus;
            },
            builder: (context, state) {
              switch (state.requestJobsStatus) {
                case RequestJobsStatus.failure:
                  return MessageDisplayWidget(message: state.message);

                case RequestJobsStatus.initial:
                  return const LoadingWidget();
                case RequestJobsStatus.loading:
                  return const LoadingWidget();

                case RequestJobsStatus.success:
                  if (state.userActiveJobs.isNotEmpty) {
                    return RefreshIndicator(
                      triggerMode: RefreshIndicatorTriggerMode.anywhere,
                      onRefresh: () => _onRefresh(context),
                      child: Container(
                        width: deviceWidth,
                        height: deviceHeight,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: ActiveAndAllJobs(deviceHeight: deviceHeight,

                          ),
                      ),
                    );
                  } else {
                    return RefreshIndicator(
                        onRefresh: () => _onRefresh(context),
                        child: JobListWidget(
                          posts: state.jobs,
                          canContact: false,
                        ));
                  }
              }
            },
          ),
        ),
        const Positioned(
          right: 10,
          bottom: 10,
          child: BuildFloatingBtn(),
        ),
      ]),
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<RequestJobsBloc>(context).add(RefreshJobsEvent());
    final userId = RepositoryProvider.of<UserRepository>(context).user.id ?? "";

    BlocProvider.of<RequestJobsBloc>(context)
        .add(RequestUserActiveJobsEvent(userId: userId));
  }
}
