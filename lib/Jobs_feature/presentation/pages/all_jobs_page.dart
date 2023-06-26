import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_jobs/Jobs_feature/presentation/bloc/post_job/post_job_bloc.dart';
import 'package:snap_jobs/Jobs_feature/presentation/bloc/request_jobs/bloc/request_jobs_bloc.dart';
import 'package:snap_jobs/core/services/services_locator.dart';

import '../../../core/widgets/loading_widget.dart';
import '../widgets/jobs_page/job_list_widget.dart';
import '../widgets/jobs_page/message_display_widget.dart';
import 'create_job_page.dart';

class AllJobsPage extends StatelessWidget {
  const AllJobsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<RequestJobsBloc>()
            ..add(
              RequestAllJobsEvent(),
            ),
        ),
        BlocProvider(
          create: (_) => sl<AddDeleteUpdateJobBloc>(),
        ),
      ],
      child: Stack(children: [
        _buildBody(),
        Positioned(
          right: 10,
          bottom: 10,
          child: _buildFloatingBtn(),
        ),
      ]),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: BlocBuilder<RequestJobsBloc, RequestJobsState>(
        builder: (context, state) {
          if (state is RequestJobLoading) {
            return const LoadingWidget();
          } else if (state is RequestJobLoaded) {
            return RefreshIndicator(
                onRefresh: () => _onRefresh(context),
                child: JobListWidget(posts: state.posts));
          } else if (state is RequestJobError) {
            return MessageDisplayWidget(message: state.message);
          }
          return const LoadingWidget();
        },
      ),
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<RequestJobsBloc>(context).add(RefreshJobsEvent());
  }

  Widget _buildFloatingBtn() {
    return Builder(builder: (context) {
      return FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>  const AddJobPage(
                isUpdateJob: false,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      );
    });
  }
}
