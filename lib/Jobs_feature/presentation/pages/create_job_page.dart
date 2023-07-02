import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_jobs/Jobs_feature/presentation/bloc/post_job/post_job_bloc.dart';
import 'package:snap_jobs/core/services/services_locator.dart';

import '../../../core/util/snackbar_message.dart';
import '../../domain/entities/job_entity.dart';

import 'package:snap_jobs/core/widgets/loading_widget.dart';

import '../widgets/add_job/add_job_form_widget.dart';

class AddJobPage extends StatelessWidget {
  final JobEntity? job;
  final bool isUpdateJob;
  const AddJobPage(
      {Key? key,
      this.job,
      required this.isUpdateJob,
      BuildContext? buildContext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  static Route<void> addJobRoute() {
    return MaterialPageRoute<void>(
        builder: (_) => const AddJobPage(
              isUpdateJob: false,
            ));
  }

  static Route<void> editJobRoute() {
    return MaterialPageRoute<void>(
        builder: (_) => const AddJobPage(
              isUpdateJob: true,
            ));
  }

  AppBar _buildAppBar() {
    return AppBar(title: Text(isUpdateJob ? "Edit Job" : "Add Job"));
  }

  Widget _buildBody() {
    return BlocProvider(
      create: (_) => sl<PostJobBloc>(),
      child: Center(
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: BlocConsumer<PostJobBloc, PostJobState>(
              listener: (context, state) {
                if (state is PostJobMessage) {
                  SnackBarMessage().showSuccessSnackBar(
                      message: state.message, context: context);
                } else if (state is PostJobError) {
                  SnackBarMessage().showErrorSnackBar(
                      message: state.message, context: context);
                }
              },
              builder: (context, state) {
                if (state is PostJobLoading) {
                  return const LoadingWidget();
                }

                return AddJobFormWidget(post: isUpdateJob ? job : null);
              },
            )),
      ),
    );
  }
}
