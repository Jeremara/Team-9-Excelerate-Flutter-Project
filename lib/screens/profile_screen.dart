import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';

class ProfileScreen extends StatelessWidget {
  final bool isAdmin;
  final VoidCallback onLogout;
  final Function(String) onNavigate;

  const ProfileScreen({
    super.key,
    required this.isAdmin,
    required this.onLogout,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            decoration: const BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.blue, Colors.purple])),
            child: const Text("My Profile",
                style: TextStyle(color: Colors.white, fontSize: 18)),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue,
                    child: const Text("JD",
                        style:
                            TextStyle(fontSize: 28, color: Colors.white))),
                const SizedBox(height: 12),
                const Center(
                    child: Text("John Doe",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold))),
                const Center(child: Text("john.doe@example.com")),
                const SizedBox(height: 20),
                ListTile(
                    leading: const Icon(Icons.book),
                    title: const Text("My Enrollments")),
                ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text("Settings")),
                ListTile(
                    leading: const Icon(Icons.help),
                    title: const Text("Help")),
                ListTile(
                    leading:
                        const Icon(Icons.logout, color: Colors.red),
                    title: const Text("Logout",
                        style: TextStyle(color: Colors.red)),
                    onTap: onLogout),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNav(active: "profile", onNavigate: onNavigate),
    );
  }
}
