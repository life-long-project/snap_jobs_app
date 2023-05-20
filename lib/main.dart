import 'package:flutter/material.dart';
import 'package:snap_jobs/app.dart';
import 'core/services/services_locator.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();

  runApp(App());
}

// import 'package:flutter/material.dart';
// import 'package:snap_jobs/app.dart';
// import 'core/services/services_locator.dart';
// import 'core/utils/themeApp/themeDataLight.dart';
// import 'core/utils/app_string.dart';

// import 'core/widgets/base_outlined_button.dart';
// import 'core/widgets/bottom_navigation.dart';
// import 'core/widgets/base_elevated_button.dart';

// void main() async {
//   //WidgetsFlutterBinding.ensureInitialized();
//   ServicesLocator().init();

//   runApp(const App());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: AppString.appName,
//         theme: getThemeDtaLight(),
//         home: MyHomePage());
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {

//   }
// }
