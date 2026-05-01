// lib/pages/register_page.dart
import 'package:flutter/material.dart';
import '../models/app_models.dart';
import 'home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  
  final _namaController = TextEditingController();
  final _passwordController = TextEditingController();
  final _levelController = TextEditingController();
  final _rankController = TextEditingController();
  final _jobController = TextEditingController();

  // --- TEMA WARNA GUILD ---
  final Color primaryDark = const Color(0xFF1E5B5B);
  final Color bgScaffold = const Color(0xFFFAFAFA);
  final Color appBarColor = const Color(0xFFB2EBF2);

  void _submitForm() {
      if (_formKey.currentState!.validate()) {
        final userData = UserData(
          nama: _namaController.text,
          password: _passwordController.text, 
          level: _levelController.text,
          rank: _rankController.text,
          job: _jobController.text,
        );

        
        Navigator.pop(context, userData);
      }
    }

  
  InputDecoration _buildInputDecor(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: primaryDark.withOpacity(0.7)),
      prefixIcon: Icon(icon, color: primaryDark),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(vertical: 16),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: primaryDark, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.redAccent, width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgScaffold,
      appBar: AppBar(
        title: const Text(
          'Guild Registration',
          style: TextStyle(color: Color(0xFF006064), fontWeight: FontWeight.bold),
        ),
        backgroundColor: appBarColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              
              Icon(Icons.shield_moon, size: 80, color: primaryDark),
              const SizedBox(height: 8),
              const Text(
                'Join The Adventurer\'s Guild',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const SizedBox(height: 32),

              TextFormField(
                controller: _namaController,
                decoration: _buildInputDecor('Adventurer Name', Icons.person),
                validator: (value) => (value == null || value.isEmpty) ? 'Nama tidak boleh kosong' : null,
              ),
              const SizedBox(height: 16),
              
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: _buildInputDecor('Secret Password', Icons.lock),
                validator: (value) => (value == null || value.length < 8) ? 'Password minimal 8 karakter' : null,
              ),
              const SizedBox(height: 16),
              
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _levelController,
                      keyboardType: TextInputType.number,
                      decoration: _buildInputDecor('Level', Icons.star),
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Kosong';
                        if (int.tryParse(value) == null) return 'Harus Angka';
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _rankController,
                      decoration: _buildInputDecor('Rank', Icons.military_tech),
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Kosong';
                        if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) return 'Harus Huruf';
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              TextFormField(
                controller: _jobController,
                decoration: _buildInputDecor('Class / Job (e.g. Archer)', Icons.work),
                validator: (value) => value!.isEmpty ? 'Job tidak boleh kosong' : null,
              ),
              const SizedBox(height: 40),
              
              // Tombol Daftar bergaya RPG
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryDark,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5,
                  ),
                  child: const Text('REGISTER TO GUILD', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}