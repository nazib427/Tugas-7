import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _levelController = TextEditingController();
  final TextEditingController _rankController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: .all(16),
          child: Column(
            children: [
              Text("Login"),

              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(label: Text("Name")),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nama harus diisi!";
                  }
                  if (value.length <2) {
                    return "Jumlah karakter minimal 2";
                  }
                  return null;
                },
              ),

              TextFormField(
                controller: _levelController,
                decoration: InputDecoration(label: Text("Level")),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Level harus diisi!";
                  }
                  if (int.tryParse(value) == null) return "Level harus angka!";
                  return null;
                },
              ),

              TextFormField(
                controller: _rankController,
                decoration: InputDecoration(label: Text("Rank")),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nama harus diisi!";
                  }
                  if (value.length <2) {
                    return "Jumlah karakter minimal 2";
                  }
                  return null;
                },
              ),

              TextFormField(
                controller: _roleController,
                decoration: InputDecoration(label: Text("Role")),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nama harus diisi!";
                  }
                  if (value.length <3) {
                    return "Jumlah karakter minimal 3";
                  }
                  return null;
                },
              ),

              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacementNamed(context, "/", arguments: {
                        "name": _nameController.text,
                        "level": int.parse(_levelController.text),
                        "rank": _rankController.text,
                        "role": _roleController.text,
                      });
                    }
                  },
                  child: Text("Login"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
