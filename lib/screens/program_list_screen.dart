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

  Color getLevelColor(String level) {
    if (level == "Beginner") return Colors.green.shade100;
    if (level == "Intermediate") return Colors.blue.shade100;
    return Colors.purple.shade100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 4),
            ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Programs",
                        style:
                            TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    Icon(Icons.filter_list),
                  ],
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Search programs...",
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Categories
          Container(
            color: Colors.white,
            height: 56,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                "All",
                "Development",
                "Design",
                "Data Science",
                "Marketing",
                "Cloud"
              ]
                  .map((e) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 8),
                        child: Chip(
                          backgroundColor:
                              e == "All" ? Colors.blue : Colors.grey.shade200,
                          label: Text(
                            e,
                            style: TextStyle(
                                color:
                                    e == "All" ? Colors.white : Colors.black),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),

          // Program list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: programs.length,
              itemBuilder: (context, index) {
                final p = programs[index];

                return GestureDetector(
                  onTap: () => onSelect(p),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, blurRadius: 6),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Color bar
                        Container(
                          height: 6,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.blue, Colors.purple],
                            ),
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  p.title,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 6),

                                Chip(
                                  label: Text(p.category),
                                  backgroundColor: Colors.blue,
                                  labelStyle:
                                      const TextStyle(color: Colors.white),
                                ),

                                const SizedBox(height: 8),

                                Text(
                                  p.shortDesc,
                                  style:
                                      const TextStyle(color: Colors.grey),
                                ),

                                const SizedBox(height: 12),

                                Row(
                                  children: [
                                    const Icon(Icons.star,
                                        color: Colors.amber, size: 18),
                                    Text("${p.rating}"),
                                    const SizedBox(width: 12),
                                    const Icon(Icons.people, size: 18),
                                    Text("${p.students}"),
                                    const SizedBox(width: 12),
                                    const Icon(Icons.timer, size: 18),
                                    Text(p.duration),
                                  ],
                                ),

                                const SizedBox(height: 12),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Chip(
                                      label: const Text("Beginner"),
                                      backgroundColor:
                                          getLevelColor("Beginner"),
                                    ),
                                    const Text("View Details →",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                )
                              ]),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          BottomNav(active: "programs", onNavigate: onNavigate),
    );
  }
}
