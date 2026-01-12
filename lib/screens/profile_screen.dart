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
      appBar: AppBar(title: const Text("Profile")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const CircleAvatar(child: Text("JD")),
            title: const Text("John Doe"),
            subtitle: const Text("john.doe@example.com"),
            trailing: isAdmin ? const Chip(label: Text("Admin")) : null,
          ),
          const Divider(),
          ListTile(title: const Text("My Enrollments"), leading: const Icon(Icons.book)),
          ListTile(title: const Text("Settings"), leading: const Icon(Icons.settings)),
          ListTile(title: const Text("Help"), leading: const Icon(Icons.help)),
          ListTile(
            title: const Text("Logout"),
            leading: const Icon(Icons.logout, color: Colors.red),
            onTap: onLogout,
          ),
        ],
      ),
      bottomNavigationBar: BottomNav(active: "profile", onNavigate: onNavigate),
    );
  }
}
