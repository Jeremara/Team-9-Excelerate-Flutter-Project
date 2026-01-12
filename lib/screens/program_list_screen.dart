import 'package:flutter/material.dart';
import '../models/program.dart';
import '../widgets/bottom_nav.dart';

class ProgramListScreen extends StatelessWidget {
  final List<Program> programs;
  final Function(Program) onSelect;
  final Function(String) onNavigate;

  const ProgramListScreen({
    super.key,
    required this.programs,
    required this.onSelect,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Programs")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: programs.length,
        itemBuilder: (context, index) {
          final p = programs[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: ListTile(
              title: Text(p.title, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(p.shortDesc),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => onSelect(p),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNav(active: "programs", onNavigate: onNavigate),
    );
  }
}
