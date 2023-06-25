import 'package:agneya/screens/home/home.dart';
import 'package:agneya/screens/settings/settings.dart';
import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  static final List _pages = [const HomePage(), const SettingsPage()];
  int _selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/images/union.png',
          fit: BoxFit.fitWidth,
          width: 150,
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedPageIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.deepPurple,
          onTap: (index) {
            setState(() {
              _selectedPageIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                _selectedPageIndex == 0 ? Icons.home : Icons.home_outlined,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                _selectedPageIndex == 1
                    ? Icons.settings
                    : Icons.settings_outlined,
              ),
              label: "Settings",
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: _pages.elementAt(_selectedPageIndex),
      ),
    );
  }
}
