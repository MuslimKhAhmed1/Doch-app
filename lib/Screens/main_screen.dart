// lib/screens/main_screen.dart
import 'package:doch_app/Screens/blog_page.dart';
import 'package:doch_app/Screens/drawer.dart';
import 'package:doch_app/localization/appLocalizations.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'map_page.dart';
import 'place_page.dart';
import 'camera_page.dart';

class MainScreen extends StatefulWidget {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[900],
      elevation: 0,
    ),
  );

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    MapPage(),
    PlacePage(),
    BlogsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 60,
        title: Text(localizations?.translate('app_name') ?? 'DoCH Mobile App'),
      ),
      body: SafeArea(
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: localizations?.translate('home') ?? 'Home',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.map),
            label: localizations?.translate('map') ?? 'Map',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.place),
            label: localizations?.translate('place') ?? 'Place',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.article),
            label: localizations?.translate('Blog') ?? 'Blog',
          ),
        ],
      ),
    );
  }
}
