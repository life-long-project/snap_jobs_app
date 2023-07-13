import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:snap_jobs/Jobs_feature/presentation/bloc/post_job/post_job_bloc.dart';
import 'package:snap_jobs/Jobs_feature/presentation/bloc/request_jobs/bloc/request_jobs_bloc.dart';
import 'package:snap_jobs/core/services/services_locator.dart';
import 'package:user_repository/user_repository.dart';

import '../../../core/widgets/loading_widget.dart';
import '../widgets/jobs_page/job_list_widget.dart';
import '../widgets/jobs_page/message_display_widget.dart';
import 'create_job_page.dart';

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

    final GlobalKey activeJobsListKey = GlobalKey();
    final GlobalKey allJobsListKey = GlobalKey();

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
                  return const initial();
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
                        child: CustomScrollView(
                          slivers: [
                            MultiSliver(
                              children: <Widget>[
                                MultiSliver(children: <Widget>[
                                  //* Active Jobs Header
                                  SliverPinnedHeader(
                                    child: InkWell(
                                      onTap: () => Scrollable.of(
                                              activeJobsListKey.currentContext!)
                                          .position
                                          .animateTo(
                                            0,
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.easeIn,
                                          ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background,
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(5),
                                            bottomRight: Radius.circular(5),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        padding: deviceHeight > 600
                                            ? const EdgeInsets.symmetric(
                                                vertical: 15)
                                            : const EdgeInsets.symmetric(
                                                vertical: 4),
                                        child: Title(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                          title: 'In process Jobs',
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.timer_outlined,
                                              ),
                                              Text(
                                                'In process Jobs',
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  //* Active Jobs List
                                  SliverAnimatedPaintExtent(
                                    duration: const Duration(milliseconds: 300),
                                    child: SliverFixedExtentList(
                                      key: activeJobsListKey,
                                      itemExtent: deviceHeight * .3,
                                      delegate: SliverChildBuilderDelegate(
                                        childCount: 1,
                                        (context, index) => JobListWidget(
                                          canContact: true ,
                                          posts: state.userActiveJobs,
                                          scrollDirection: Axis.horizontal,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                                //
                                MultiSliver(children: <Widget>[
                                  //* All Jobs Header
                                  SliverPinnedHeader(
                                    child: InkWell(
                                      //TODO: Scroll and hide other scrolller
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background,
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(5),
                                            bottomRight: Radius.circular(5),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        padding: deviceHeight > 600
                                            ? const EdgeInsets.symmetric(
                                                vertical: 15)
                                            : const EdgeInsets.symmetric(
                                                vertical: 4),
                                        child: Title(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                          title: 'In process Jobs',
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.timer_outlined,
                                              ),
                                              Text(
                                                'New jobs',
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SliverAnimatedPaintExtent(
                                    duration: const Duration(milliseconds: 300),
                                    child: SliverFixedExtentList(
                                      key: allJobsListKey,
                                      itemExtent: deviceHeight * .8,
                                      delegate: SliverChildBuilderDelegate(
                                        childCount: 1,
                                        (context, index) => Column(
                                          children: [
                                            Flexible(
                                              flex: 8,
                                              child: JobListWidget(
                                                posts: state.jobs,
                                                canContact: false,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                          ],
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

class initial extends StatelessWidget {
  const initial({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    /*
    return const LoadingWidget();
*/

    BlocProvider.of<RequestJobsBloc>(context).add(
      const RequestAllJobsEvent(),
    );
    final userId = RepositoryProvider.of<UserRepository>(context).user.id ?? "";

    BlocProvider.of<RequestJobsBloc>(context)
        .add(RequestUserActiveJobsEvent(userId: userId));
    return const Center(
        child: Text(
      'initial',
      style: TextStyle(fontSize: 20),
    ));
  }
}

class BuildFloatingBtn extends StatelessWidget {
  const BuildFloatingBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          AddJobPage.addJobRoute(),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
