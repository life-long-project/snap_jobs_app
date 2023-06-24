import 'package:flutter/material.dart';

class StatelessSplashPage extends StatelessWidget {
  const StatelessSplashPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const StatelessSplashPage());
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Image(
            image: AssetImage('assets/images/logo_blue_text.png'),
          ),
        ),
      ),
    );
  }
}
