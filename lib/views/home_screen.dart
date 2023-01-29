import 'package:flutter/material.dart';
import 'package:tiktokpractice/views/widgets/custom_icon.dart';

import '../constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIdx = 0;
  final double buttonSize = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (idx) {
          setState(() {
            pageIdx = idx;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: BACKGROUND_COLOR,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        currentIndex: pageIdx,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, size: buttonSize), label: HOME),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, size: buttonSize), label: SEARCH),
          BottomNavigationBarItem(icon: CustomIcon(), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.message, size: buttonSize), label: MESSAGES),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, size: buttonSize), label: PROFILE),
        ],
      ),
      body: pages[pageIdx],
    );
  }
}
