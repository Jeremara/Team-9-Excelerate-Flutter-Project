import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  final Function(String) onNavigate;

  const HomeScreen({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: Column(
        children: [
          // Top Bar
          Container(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 4),
            ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [Colors.blue, Colors.purple]),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child:
                        const Icon(Icons.book, color: Colors.white, size: 22),
                  ),
                  const SizedBox(width: 10),
                  const Text("LearnHub",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                ]),
                Row(children: const [
                  Icon(Icons.notifications_none, size: 24),
                  SizedBox(width: 16),
                  Icon(Icons.search, size: 24),
                ])
              ],
            ),
          ),

          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text("Welcome back, John 👋",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  const Text("Ready to continue your learning journey?",
                      style: TextStyle(color: Colors.grey)),

                  const SizedBox(height: 24),

                  // Quick grid
                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      quickTile("Browse", Icons.search, Colors.blue, () {
                        onNavigate("programs");
                      }),
                      quickTile("My Courses", Icons.book, Colors.purple, () {}),
                      quickTile("Progress", Icons.trending_up, Colors.green, () {}),
                      quickTile("Achievements", Icons.emoji_events, Colors.orange,
                          () {}),
                    ],
                  ),

                  const SizedBox(height: 28),

                  // Continue Learning
                  sectionTitle("Continue Learning", "View All"),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: cardStyle(),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                    colors: [Colors.blue, Colors.purple]),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                        "Web Development Fundamentals",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    const Text("Module 3: JavaScript Basics",
                                        style:
                                            TextStyle(color: Colors.grey)),
                                    const SizedBox(height: 8),
                                    LinearProgressIndicator(
                                      value: 0.65,
                                      backgroundColor: Colors.grey.shade300,
                                    )
                                  ]),
                            )
                          ],
                        ),
                        const SizedBox(height: 14),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              minimumSize: const Size.fromHeight(45),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          onPressed: () {},
                          child: const Text("Continue"),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  // Upcoming
                  sectionTitle("Upcoming Classes", "View Calendar"),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: cardStyle(),
                    child: Column(
                      children: [
                        Row(children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade100,
                                borderRadius: BorderRadius.circular(12)),
                            child: const Icon(Icons.calendar_month,
                                color: Colors.blue),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("Live Session: React Hooks",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text("Today at 3:00 PM",
                                      style: TextStyle(color: Colors.grey)),
                                ]),
                          )
                        ]),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Instructor: Sarah Johnson",
                                style: TextStyle(color: Colors.grey)),
                            Text("Join →",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNav(active: "home", onNavigate: onNavigate),
    );
  }

  Widget quickTile(
      String title, IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [color, color.withOpacity(0.8)]),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(color: Colors.black26, blurRadius: 6)
            ]),
        padding: const EdgeInsets.all(16),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(12)),
                  child: Icon(icon, color: Colors.white)),
              const Spacer(),
              Text(title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
            ]),
      ),
    );
  }

  Widget sectionTitle(String title, String action) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(action,
            style: const TextStyle(
                color: Colors.blue, fontWeight: FontWeight.w500))
      ]),
    );
  }

  BoxDecoration cardStyle() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
    );
  }
}
