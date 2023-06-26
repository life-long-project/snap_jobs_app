import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/post_job/post_job_bloc.dart';

class DeleteDialogWidget extends StatelessWidget {
  final String jobId;
  const DeleteDialogWidget({
    Key? key,
    required this.jobId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Are you Sure ?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(
            "No",
          ),
        ),
        TextButton(
          onPressed: () {
            BlocProvider.of<AddDeleteUpdateJobBloc>(context).add(
              DeleteJobEvent(jobId: jobId),
            );
          },
          child: const Text("Yes"),
        ),
      ],
    );
  }
}
