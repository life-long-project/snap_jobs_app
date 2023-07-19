import 'package:flutter/material.dart';
import 'package:snap_jobs/Jobs_feature/domain/entities/job_entity.dart';
import 'package:snap_jobs/Jobs_feature/domain/usecases/get_phone_number_usecase.dart';
import 'package:snap_jobs/core/services/services_locator.dart';

class CallDialogue extends StatelessWidget {
  final JobEntity job;
  final String currentUserId;
  final String targetedUserId;

  CallDialogue({
    super.key,
    required this.job,
    required this.currentUserId,
  })  : targetedUserId =
            (job.userId == currentUserId) ? job.workerId! : job.userId!,
        super();

  @override
  Widget build(BuildContext context) {
    Future<String> getPhoneNumber() async {
      final response =
          await sl<GetUserPhoneNumberUseCase>().call(targetedUserId);
      return response.fold((Failure) => "error $Failure  ", (r) => r);
    }

    return FutureBuilder(
      future: getPhoneNumber(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _showMyDialog(context, snapshot.data as String);
        } else {
          return _showLoadingDialog(context);
        }
      },
    );
  }
}

Widget _showMyDialog(BuildContext context, String number) {
  return AlertDialog(
    title: const Text('Phone Number'),
    content: Text(number),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Close'),
      ),
    ],
  );
}

Widget _showLoadingDialog(BuildContext context) {
  return AlertDialog(
    title: const Text('Phone Number'),
    content:
       Center(

         child: SizedBox(

          height: 30,
          width: 30,



            child: CircularProgressIndicator(color: Theme.of(context).colorScheme.secondary ,strokeWidth: 30, )),
       ),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Close'),
      ),
    ],
  );
}
