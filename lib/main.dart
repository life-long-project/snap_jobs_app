import 'package:flutter/material.dart';

import 'core/utils/themeApp/themeDataLight.dart';
import 'core/utils/app_string.dart';

import 'core/widgets/base_outlined_button.dart';
import 'core/widgets/bottom_navigation.dart';
import 'core/services/services_locator.dart';
import 'core/widgets/base_elevated_button.dart';

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
        home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset(
              "assets/logo_blue_text.png",
            ),
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('About Us'),
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
          BaseOutlinedButton(
            text: "Post a job",
            onPressed: () {},
          ),
        ],
      )),
      appBar: AppBar(
        title: Text(AppString.appName),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          InkWell(
            onTap: () {},
            child: CircleAvatar(
              backgroundImage: Image.asset(
                "assets/logo_blue_text.png",
                fit: BoxFit.fill,
                width: 15,
                height: 15,
              ).image,
              radius: 15,
              backgroundColor: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
