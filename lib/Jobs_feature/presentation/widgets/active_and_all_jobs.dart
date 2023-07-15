
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:snap_jobs/Jobs_feature/presentation/bloc/request_jobs/bloc/request_jobs_bloc.dart';
import 'package:snap_jobs/Jobs_feature/presentation/widgets/jobs_page/job_list_widget.dart';

class ActiveAndAllJobs extends StatelessWidget {
   ActiveAndAllJobs( {
    required this.deviceHeight,
    super.key,

  });
  final GlobalKey activeJobsListKey = GlobalKey();
  final GlobalKey allJobsListKey = GlobalKey();
  final double deviceHeight;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        MultiSliver(
          children: <Widget>[
            MultiSliver(children: <Widget>[
              SliverPinnedHeader(
              //* Active Jobs Header
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
                          offset: const Offset(0,
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
                      posts: BlocProvider.of<RequestJobsBloc>(context).state.userActiveJobs,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
              ),
            ],),
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
                          offset: const Offset(0,
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
                            posts: BlocProvider.of<RequestJobsBloc>(context)
                                .state
                                .userActiveJobs,
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
    );
  }
}
