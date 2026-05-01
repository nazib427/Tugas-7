// lib/main.dart
import 'package:flutter/material.dart';
import 'pages/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas UTS Mobile',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const RegisterPage(), // Memulai dari Register Page
    );
  }
}