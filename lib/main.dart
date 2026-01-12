import 'package:flutter/material.dart';
import 'models/program.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/program_list_screen.dart';
import 'screens/program_details_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const LearnHubApp());
}

class LearnHubApp extends StatelessWidget {
  const LearnHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "LearnHub",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const LearnHubRoot(),
    );
  }
}

class LearnHubRoot extends StatefulWidget {
  const LearnHubRoot({super.key});

  @override
  State<LearnHubRoot> createState() => _LearnHubRootState();
}

class _LearnHubRootState extends State<LearnHubRoot> {
  String currentScreen = "login";
  bool isAdmin = false;
  Program? selectedProgram;

  final programs = [
    Program(
      id: 1,
      title: "Web Development Fundamentals",
      shortDesc: "Learn HTML, CSS, and JavaScript from scratch",
      fullDesc:
          "A comprehensive course covering HTML5, CSS3, and modern JavaScript to build responsive websites.",
      category: "Development",
      duration: "8 weeks",
      instructor: "Sarah Johnson",
      rating: 4.8,
      students: 1234,
    ),
    Program(
      id: 2,
      title: "Mobile App Design",
      shortDesc: "Create stunning mobile interfaces with Figma",
      fullDesc:
          "Learn professional mobile app design using Figma, UI/UX principles, and prototyping techniques.",
      category: "Design",
      duration: "6 weeks",
      instructor: "Michael Chen",
      rating: 4.9,
      students: 892,
    ),
  ];

  void navigate(String screen) {
    setState(() => currentScreen = screen);
  }

  @override
  Widget build(BuildContext context) {
    switch (currentScreen) {
      case "home":
        return HomeScreen(onNavigate: navigate);
      case "programs":
        return ProgramListScreen(
          programs: programs,
          onSelect: (p) {
            selectedProgram = p;
            navigate("details");
          },
          onNavigate: navigate,
        );
      case "details":
        return ProgramDetailsScreen(
          program: selectedProgram!,
          isAdmin: isAdmin,
          onBack: () => navigate("programs"),
          onNavigate: navigate,
        );
      case "profile":
        return ProfileScreen(
          isAdmin: isAdmin,
          onLogout: () => navigate("login"),
          onNavigate: navigate,
        );
      default:
        return LoginScreen(
          isAdmin: isAdmin,
          onAdminChanged: (v) => setState(() => isAdmin = v),
          onLogin: () => navigate("home"),
        );
    }
  }
}
