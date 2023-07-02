import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_jobs/Jobs_feature/presentation/bloc/post_job/post_job_bloc.dart';
import 'package:snap_jobs/Jobs_feature/presentation/bloc/request_jobs/bloc/request_jobs_bloc.dart';
import 'package:snap_jobs/core/services/services_locator.dart';

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
  Future<void> _onStart(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));
    BlocProvider.of<RequestJobsBloc>(context).add(const RequestAllJobsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RequestJobsBloc>(
            lazy: false,
            create: (context) {
              // sl<RequestJobsBloc>().add(RequestAllJobsEvent());
              _onStart(context);
              return sl<RequestJobsBloc>();
            }),
        BlocProvider(create: (_) => sl<PostJobBloc>())
      ],
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: BlocBuilder<RequestJobsBloc, RequestJobsState>(
            builder: (context, state) {
              switch (state.requestJobsStatus) {
                case RequestJobsStatus.initial:
                  return const initial();
                case RequestJobsStatus.loading:
                  return const LoadingWidget();

                case RequestJobsStatus.success:
                  return RefreshIndicator(
                      onRefresh: () => _onRefresh(context),
                      child: JobListWidget(posts: state.jobs));
                case RequestJobsStatus.failure:
                  return MessageDisplayWidget(message: state.message);
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
