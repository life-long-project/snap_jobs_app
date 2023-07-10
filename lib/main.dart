// import 'package:flutter/material.dart';
// import 'package:snap_jobs/app.dart';
// import 'core/services/services_locator.dart';

// void main() {
//   //WidgetsFlutterBinding.ensureInitialized();

//   runApp(App());
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:snap_jobs/core/services/services_locator.dart';
import 'package:snap_jobs/core/utilities_and_theme/themeApp/themeDataLight.dart';


import 'profile_feature/presentation/Screens/profile_page.dart';
import 'profile_feature/presentation/controlers/bloc/upload _img_bloc/bloc/img_upload_bloc.dart';
import 'profile_feature/presentation/wedgets/upload_profile_img.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServicesLocator().init();
  //await Hive.initFlutter();
  //Hive.registerAdapter(ProfileHiveModelAdapter());
  //await Hive.openBox('profile');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: getThemeDtaLight(),
        title: 'Posts Job',
        home: ProfileScreen());
  }
}
