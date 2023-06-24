import 'dart:async';

import 'package:flutter/material.dart';
import 'package:snap_jobs/app.dart';
import 'package:snap_jobs/core/services/services_locator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SplashPage());
  }

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late Future<bool> _requiredBeforeInitializing;

  @override
  void initState() {
    super.initState();

    _requiredBeforeInitializing = _preInitializeRepositories();
  }

  Future<bool> _preInitializeRepositories() async {
    await Future.delayed(Duration.zero);

    await ServicesLocator().init();

    //Future builder cant receive value of void so i make it return bool
    //so this bool value doesn't have any meaning
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
          future: _requiredBeforeInitializing,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              // Future hasn't finished yet, return a placeholder
              return const MaterialApp(
                debugShowCheckedModeBanner: false,
                home:             Scaffold(
              body: Center(
                child: Image(
                  image: AssetImage('assets/images/logo_blue_text.png'),
                ),
              ),
            ),
              );
            }
            return const App();
          }),
    );
  }
}
