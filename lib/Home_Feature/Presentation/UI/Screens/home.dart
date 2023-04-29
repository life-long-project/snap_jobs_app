import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //int selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar with search container
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_active),
              onPressed: () {},
              color: Colors.blue,
            ),
            const SizedBox(
              width: 15,
            ),
          ]),
      //botton navigation bar
    );
  }
}
