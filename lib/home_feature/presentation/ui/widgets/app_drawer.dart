
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_jobs/authentication_and_login_features/presentation/controllers/authentication_bloc/authentication_bloc.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}
