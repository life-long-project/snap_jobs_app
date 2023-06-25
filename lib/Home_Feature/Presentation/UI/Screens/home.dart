import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_jobs/Jobs_feature/presentation/pages/all_jobs_page.dart';
import 'package:snap_jobs/authentication_and_login_features/presentation/controllers/authenttication_bloc/authentication_bloc.dart';
import 'package:user_repository/user_repository.dart';

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
              child: Container(
                //304 is the e default width of the drawer
                width: (304 / 3),

                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Settings',
                      ),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      title: Text(
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
          const Expanded(
            child: AllJobsPage(),
          ),
        ],
      ),
    );
  }
}
