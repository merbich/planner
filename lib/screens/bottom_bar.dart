import 'package:flutter/material.dart';
import 'package:planner/screens/categories.dart';
import 'package:planner/screens/home_screen.dart';
import 'package:planner/screens/user.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;
  final List _pages = [
    const HomeScreen(),
    const CategoryScreen(),
    const UserScreen(),

  ];

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _selectedPage,
        items: 
          <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 0 ? IconlyBold.home : IconlyLight.home),
              label: "Home",
              ),
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 1 ? IconlyBold.category : IconlyLight.category),
              label: "Category",
              ),
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 2 ? IconlyBold.user2 : IconlyLight.user2),
              label: "User",
              ),
          ],
        ),
    );
  }
}