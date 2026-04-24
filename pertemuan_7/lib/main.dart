import 'package:flutter/material.dart';
import 'package:pertemuan_3/chip_widget.dart';
import 'package:pertemuan_3/header_widget.dart';
import 'package:pertemuan_3/todo_list.dart';
import 'package:pertemuan_3/pages/login_page.dart';

void main() {
  runApp(MaterialApp(
    title: "Pertemuan 6",
    initialRoute: '/login',
    onGenerateRoute: (data) {
      if (data.name == "/") {
        if (data.arguments == null || data.arguments is! Map) {
          return MaterialPageRoute(builder: (context) => const LoginPage());
        }

        final args = Map<String, dynamic>.from(data.arguments as Map);
        return MaterialPageRoute(builder:  (context) => HomePage(userData: args,));
      }
      return null;
    },
  ));
}

class HomePage extends StatefulWidget {
  final Map<String, dynamic> userData;
  
  const HomePage({
    super.key, required this.userData,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final String name = widget.userData["name"];
    final int level = widget.userData["level"];
    final String rank = widget.userData["rank"];
    final String role = widget.userData["role"];
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Adventure Guild",
          style: TextStyle(
            color: const Color.fromARGB(221, 0, 255, 81),
            fontWeight: .bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 125, 35),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            HeaderWidget(name: name, role: role, level: level, rank: rank),
            SizedBox(height: 8),
            Row(
              spacing: 8,
              children: [
                ChipWidget(
                  icon: Icons.favorite,
                  color: Colors.red,
                  label: "HP: ",
                  value: "90",
                  borderColor: Colors.red,
                  backgroundColor: Colors.red.withAlpha(30),
                ),
                ChipWidget(
                  icon: Icons.auto_awesome,
                  color: const Color.fromARGB(255, 30, 0, 183),
                  label: "MP: ",
                  value: "120",
                  borderColor: const Color.fromARGB(255, 0, 14, 216),
                  backgroundColor: Colors.blue.withAlpha(30),
                ),
                ChipWidget(
                  icon: Icons.paid,
                  color: const Color.fromARGB(255, 208, 255, 0),
                  label: "Gold: ",
                  value: "140",
                  borderColor: const Color.fromARGB(255, 221, 255, 0),
                  backgroundColor: Colors.green.withAlpha(30),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(),
            SizedBox(height: 8),
            Text(
              "Today's Quests",
              style: TextStyle(
                fontWeight: .bold,
                fontSize: 20,
                color: const Color.fromARGB(221, 0, 255, 4),
              ),
            ),
            SizedBox(height: 8),
            TodoList(icon: Icons.done, title: "Kalahkan 3 Bahlil", rank: "Z",),
            SizedBox(height: 8),
            TodoList(icon: Icons.done, title: "Ngepet Jam 2 Malam", rank: "D",),
            SizedBox(height: 8),
            TodoList(icon: Icons.done, title: "Bunuh 5 Pemain Judol", rank: "F",),
          ],
        ),
      ),
    );
  }
}
