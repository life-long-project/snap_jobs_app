import 'package:flutter/material.dart';

import 'core/utils/themeApp/ThemeDataLight.dart';
import 'core/utils/app_string.dart';

import 'core/widgets/bottom_navigation.dart';
import 'core/services/services_locator.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppString.appName,
        theme: getThemeDtaLight(),
        home: BottomNavigation());
  }
}
