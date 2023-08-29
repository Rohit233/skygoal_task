import 'package:flutter/material.dart';
import 'package:skygoal_task/pages/search/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: const [
          SearchScreen(),
          Center(
            child: Text(
              'Saved',
            ),
          ),
          Center(
            child: Text(
              'Profile',
            ),
          ),
        ][selectedPageIndex],
        bottomNavigationBar: BottomNavigationBar(
        
        currentIndex: selectedPageIndex,
        onTap: (int index) {
            setState(() {
              selectedPageIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book_outlined),
              label: 'Saved'
            ),BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account'
            )
          ],
        ),
      );
  }
}