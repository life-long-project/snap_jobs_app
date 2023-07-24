import 'package:flutter/material.dart';
import 'package:snap_jobs/profile_feature/presentation/Screens/profile_page.dart';

AppBar HomeAppBar(BuildContext context, String userName , String id ) {
  return AppBar(
    backgroundColor: Theme.of(context).colorScheme.primary,
    shadowColor: Theme.of(context).colorScheme.onPrimary,
    title: Text(
      'Hi, $userName',
      style: TextStyle(
        fontSize: Theme.of(context).textTheme.headlineMedium!.fontSize,
        fontWeight: Theme.of(context).textTheme.headlineMedium!.fontWeight,
      ),
    ),
    elevation: 1,
    actions: [
      IconButton(
        icon: const Icon(Icons.person_2_rounded),
        onPressed: () {
          Navigator.of(context).push(ProfileScreen.route(id));
        },
        color: Colors.blue,
      ),
      const SizedBox(
        width: 15,
      ),
    ],
  );
}
