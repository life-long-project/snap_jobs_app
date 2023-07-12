import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_jobs/Jobs_feature/domain/entities/job_entity.dart';
import 'package:snap_jobs/Jobs_feature/domain/usecases/get_one_job_usecase.dart';
import 'package:snap_jobs/Jobs_feature/presentation/bloc/post_job/post_job_bloc.dart';
import 'package:snap_jobs/core/services/services_locator.dart';
import 'package:user_repository/user_repository.dart';

import '../widgets/job_detail_page/job_detail_widget.dart';

class JobDetailPage extends StatefulWidget {
  final String jobId;

  const JobDetailPage({
    Key? key,
    required this.jobId,
  }) : super(key: key);

  @override
  State<JobDetailPage> createState() => _JobDetailPageState();
}

class _JobDetailPageState extends State<JobDetailPage> {
  late JobEntity post;

  Future<JobEntity> _getJob(String jobId, String userId) async {
    final response = await sl<GetOneJobUseCase>().call(jobId);

    return response.fold(
      (failure) => throw Exception(failure.message),
      (job) => _checkIfAlreadyOffered(job, userId),
    );
  }

  JobEntity _checkIfAlreadyOffered(JobEntity job, String userId) {
    final bool isApplied =
        job.offers?.any((offer) => offer.applicantId == userId) ?? false;
    return isApplied ? job.copyWith(isAlreadyApplied: true) : job;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostJobBloc, PostJobState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {

        switch (state.status) {
          case PostJobStatus.success:
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:
                    Text(state.message.isEmpty ? "Success" : state.message),
              ),
            );
            Navigator.pop(context);
            break;
            case PostJobStatus.error:
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:
                    Text(state.message.isEmpty ? "Error" : state.message),
              ),
            );
            default:
            break;
        }
      },
      child: Scaffold(
        appBar: _buildAppbar(),
        body: FutureBuilder(
          future: _getJob(widget.jobId,
              (RepositoryProvider.of<UserRepository>(context).user.id) ?? ""),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _buildBody(snapshot.data!);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      title: const Text("Job Detail"),
    );
  }

  Widget _buildBody(JobEntity job) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: BlocProvider<PostJobBloc>(
        create: (context) => sl<PostJobBloc>(),
        child: JobDetailWidget(job: job),
      ),
    );
  }
}
