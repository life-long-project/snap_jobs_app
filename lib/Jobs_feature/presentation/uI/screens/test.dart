import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/services_locator.dart';
import '../../controller/cubit/jobs_cubit.dart';
import '../../controller/cubit/jobs_state.dart';
import 'jobs_screen.dart';

class className extends StatelessWidget {
  const className({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<JobsCubit>()..getJobs(),
        child: BlocBuilder<JobsCubit, JobsState>(builder: (context, state) {
          return const Scaffold(
            body: JobsScreen(),
          );
        }));
  }
}
