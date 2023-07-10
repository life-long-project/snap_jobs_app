import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
                child: Image(
              image: AssetImage('assets/images/blue_logo_black_text.png'),
            )),
            Center(
              child: SizedBox(
                //304 is the e default width of the drawer
                width: (304 / 3),

                child: Column(
                  children: [
                    ListTile(
                      title: const Text(
                        'Settings',
                      ),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      title: const Text(
                        'About us',
                      ),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      title: const Text('Help & Support'),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    OutlinedButton(
                      child: const Text('Logout'),
                      onPressed: () {
                        context
                            .read<AuthenticationBloc>()
                            .add(AuthenticationLogoutRequested());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_active),
            onPressed: () {},
            color: Colors.blue,
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      body: Column(
        children: [
          Text(
            'Hi, $userName',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          MultiBlocProvider(
            providers: [
              BlocProvider<RequestJobsBloc>(
                  lazy: false,
                  create: (context) {
                    // sl<RequestJobsBloc>().add(RequestAllJobsEvent());

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
