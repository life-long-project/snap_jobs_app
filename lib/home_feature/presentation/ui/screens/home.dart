import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_jobs/home_feature/presentation/ui/widgets/app_drawer.dart';
import 'package:snap_jobs/home_feature/presentation/ui/widgets/home_app_bar.dart';
import 'package:snap_jobs/Jobs_feature/presentation/bloc/post_job/post_job_bloc.dart';
import 'package:snap_jobs/Jobs_feature/presentation/bloc/request_jobs/bloc/request_jobs_bloc.dart';
import 'package:snap_jobs/Jobs_feature/presentation/pages/all_jobs_page.dart';
import 'package:snap_jobs/authentication_and_login_features/presentation/controllers/authentication_bloc/authentication_bloc.dart';
import 'package:snap_jobs/core/services/services_locator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    final userName = context.select((AuthenticationBloc bloc) {
      final user = bloc.state.user;
      return user.firstName;
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const AppDrawer(),
      appBar: HomeAppBar(context, userName),
      body: Column(
        children: [
          MultiBlocProvider(
            providers: [
              BlocProvider<RequestJobsBloc>(
                  lazy: false,
                  create: (context) {
                    return sl<RequestJobsBloc>();
                  }),
              BlocProvider(
                create: (_) => sl<PostJobBloc>(),
              ),
            ],
            child: const Expanded(
              child: AllJobsPage(),
            ),
          ),
        ],
      ),
    );
  }


}
