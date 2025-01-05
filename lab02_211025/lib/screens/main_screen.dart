import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'jokes_list_screen.dart';
import 'favorites_jokes_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    JokesListScreen(type: 'Funny'),
    FavoriteJokesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jokes App'),
        backgroundColor: Colors.purple[200],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple[700],
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.purple[50],
        onTap: _onItemTapped,
      ),
    );
  }
}