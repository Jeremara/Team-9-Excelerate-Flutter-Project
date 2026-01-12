import 'package:flutter/material.dart';
import '../models/program.dart';
import '../widgets/bottom_nav.dart';

class ProgramDetailsScreen extends StatelessWidget {
  final Program program;
  final bool isAdmin;
  final VoidCallback onBack;
  final Function(String) onNavigate;

  const ProgramDetailsScreen({
    super.key,
    required this.program,
    required this.isAdmin,
    required this.onBack,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(program.title),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: onBack),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(program.fullDesc),
            const SizedBox(height: 16),
            Text("Category: ${program.category}"),
            Text("Duration: ${program.duration}"),
            Text("Instructor: ${program.instructor}"),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: const Text("Enroll Now")),
            if (isAdmin)
              Row(
                children: [
                  Expanded(child: ElevatedButton(onPressed: () {}, child: const Text("Edit"))),
                  const SizedBox(width: 10),
                  Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                          onPressed: () {},
                          child: const Text("Delete"))),
                ],
              )
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(active: "programs", onNavigate: onNavigate),
    );
  }
}
