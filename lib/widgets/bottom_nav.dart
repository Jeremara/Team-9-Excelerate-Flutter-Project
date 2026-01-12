import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final String active;
  final Function(String) onNavigate;

  const BottomNav({super.key, required this.active, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: active == 'home'
          ? 0
          : active == 'programs'
              ? 1
              : 2,
      onTap: (i) {
        if (i == 0) onNavigate('home');
        if (i == 1) onNavigate('programs');
        if (i == 2) onNavigate('profile');
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: "Programs"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}
