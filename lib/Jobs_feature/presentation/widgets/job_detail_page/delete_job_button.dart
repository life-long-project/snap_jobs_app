import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/util/snackbar_message.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../bloc/post_job/post_job_bloc.dart';
import '../../pages/all_jobs_page.dart';
import 'delete_dialog.dart';

class DeleteJobBtnWidget extends StatelessWidget {
  final String jobId;
  const DeleteJobBtnWidget({
    Key? key,
    required this.jobId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Colors.redAccent,
        ),
      ),
      onPressed: () => deleteDialog(context, jobId),
      icon: const Icon(Icons.delete_outline),
      label: const Text("Delete"),
    );
  }

  void deleteDialog(BuildContext context, String postId) {
    showDialog(
        context: context,
        builder: (context) {
          return BlocConsumer<PostJobBloc, PostJobState>(
            listener: (context, state) {
              if (state is PostJobMessage) {
                SnackBarMessage().showSuccessSnackBar(
                    message: state.message, context: context);

                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (_) => const AllJobsPage(),
                    ),
                    (route) => false);
              } else if (state is PostJobError) {
                Navigator.of(context).pop();
                SnackBarMessage().showErrorSnackBar(
                    message: state.message, context: context);
              }
            },
            builder: (context, state) {
              if (state is PostJobLoading) {
                return const AlertDialog(
                  title: LoadingWidget(),
                );
              }
              return DeleteDialogWidget(jobId: jobId);
            },
          );
        });
  }
}
