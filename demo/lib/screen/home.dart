import 'package:flutter/material.dart';
import 'new.dart';
import 'event.dart';
import 'homeScreen.dart'; // Widget giao diện chính của Trang chủ

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [HomeScreen(), NewPage(), EventPage()];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
          BottomNavigationBarItem(
            icon: Icon(Icons.new_releases),
            label: 'Tin Tức',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Sự kiện'),
        ],
      ),
    );
  }
}
