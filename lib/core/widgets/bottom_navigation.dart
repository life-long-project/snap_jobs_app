import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../home_feature/presentation/ui/screens/home.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({
    super.key,
  });

  @override

  // ignore: library_private_types_in_public_api
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    //TODO
    const HomePage(),

  ];
  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
          color: Theme.of(context).bottomAppBarTheme.color!,
          // const Color.fromARGB(255, 0, 23, 63)  ,
          backgroundColor: Theme.of(context).bottomAppBarTheme.shadowColor!,
          height: Theme.of(context).bottomAppBarTheme.height!,
          items: const <Widget>[
            Icon(Icons.home, color: Colors.white, size: 20.0),
            Icon(Icons.work, color: Colors.white, size: 20.0),
            Icon(Icons.chat, color: Colors.white, size: 20.0),
            // Icon(Icons.search, color: Colors.white, size: 20.0),
            Icon(Icons.person_pin, color: Colors.white, size: 20.0),
          ],
          animationDuration: const Duration(milliseconds: 200),
          index: 0,
          animationCurve: Curves.bounceInOut,
          onTap: onTappedBar),
    );
  }
}
