// import 'package:flutter/material.dart';
// import 'package:snap_jobs/app.dart';
// import 'core/services/services_locator.dart';

// void main() {
//   //WidgetsFlutterBinding.ensureInitialized();

//   runApp(App());
// }
import 'package:flutter/material.dart';
import 'package:snap_jobs/Jobs_feature/presentation/pages/create_job_page.dart';

import 'package:snap_jobs/Jobs_feature/presentation/pages/jobs_page.dart';
import 'package:snap_jobs/core/services/services_locator.dart';
import 'package:snap_jobs/core/utilities_and_theme/themeApp/themeDataLight.dart';

import 'profile_feature/presentation/Screens/post_profile.dart';





void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: getThemeDtaLight(),
            title: 'Posts Job',
            home: AddJobPage(isUpdateJob: false,));
  }
}

