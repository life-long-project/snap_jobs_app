import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:snap_jobs/splash/view/splash_page.dart';

import 'Jobs_feature/domain/entities/job_entity.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(JobEntityAdapter());
  Hive.registerAdapter(JobTypeAdapter());

  runApp(const SplashPage());
}
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:snap_jobs/Jobs_feature/presentation/pages/all_jobs_page.dart';
// import 'package:snap_jobs/core/services/services_locator.dart';
// import 'package:snap_jobs/core/utilities_and_theme/themeApp/themeDataLight.dart';

// import 'Jobs_feature/presentation/bloc/get_all_jobs/bloc/get_all_jobs_bloc.dart';
// import 'Jobs_feature/presentation/bloc/post_job/post_job_bloc.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await ServicesLocator().init();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: getThemeDtaLight(),
//         title: 'Posts Job',
//         home: AllJobsPage());
//   }
// }
