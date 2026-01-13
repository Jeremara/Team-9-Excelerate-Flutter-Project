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
      backgroundColor: const Color(0xFFF9FAFB),
      body: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.blue, Colors.purple]),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: onBack,
                ),
                const Text(
                  "Program Details",
                  style: TextStyle(color: Colors.white),
                ),
                const Icon(Icons.share, color: Colors.white),
              ],
            ),
          ),

          // Banner
          Container(
            height: 180,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.blue, Colors.purple]),
            ),
            child: const Center(
              child: Icon(Icons.book, size: 80, color: Colors.white),
            ),
          ),

          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 6,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child:
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    // Title
                    Text(
                      program.title,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 10),

                    // Rating & Students
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber),
                        Text(" ${program.rating}   "),
                        const Icon(Icons.people),
                        Text(" ${program.students}"),
                      ],
                    ),

                    const Divider(height: 30),

                    // Description
                    Text(
                      program.fullDesc,
                      style: const TextStyle(color: Colors.black87),
                    ),

                    const SizedBox(height: 20),

                    // Program Details Grid
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      childAspectRatio: 2.2,
                      children: [
                        ListTile(
                          leading: const Icon(Icons.timer, color: Colors.blue),
                          title: Text(program.duration),
                          subtitle: const Text("Duration"),
                        ),
                        ListTile(
                          leading:
                              const Icon(Icons.emoji_events, color: Colors.purple),
                          title: const Text("Beginner"),
                          subtitle: const Text("Level"),
                        ),
                        ListTile(
                          leading:
                              const Icon(Icons.calendar_today, color: Colors.green),
                          title: const Text("Jan 20, 2026"),
                          subtitle: const Text("Start"),
                        ),
                        ListTile(
                          leading:
                              const Icon(Icons.person, color: Colors.orange),
                          title: Text(program.instructor),
                          subtitle: const Text("Instructor"),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Enroll Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14)),
                        ),
                        onPressed: () {},
                        child: const Text("Enroll Now"),
                      ),
                    ),

                    // Admin Controls
                    if (isAdmin) ...[
                      const SizedBox(height: 20),
                      const Divider(),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {},
                              child: const Text("Edit"),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.red),
                              child: const Text("Delete"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ]),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          BottomNav(active: "programs", onNavigate: onNavigate),
    );
  }
}
