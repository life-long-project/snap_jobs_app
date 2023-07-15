import 'package:flutter/src/material/drawer.dart';
import 'package:flutter/src/material/drawer_header.dart';
import 'package:flutter/src/material/list_tile.dart';
import 'package:flutter/src/material/outlined_button.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/image.dart';
import 'package:flutter/src/widgets/scroll_view.dart';
import 'package:flutter/src/widgets/text.dart';
import 'package:provider/src/provider.dart';
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
