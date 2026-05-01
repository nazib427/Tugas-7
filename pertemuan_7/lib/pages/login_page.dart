import 'package:flutter/material.dart';
import '../models/app_models.dart';
import 'register_page.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _passwordController = TextEditingController();

  
  UserData? _registeredUser;

  
  final Color primaryDark = const Color(0xFF1E5B5B);
  final Color bgScaffold = const Color(0xFFFAFAFA);

  
  void _goToRegister() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterPage()),
    );

    
    if (result != null && result is UserData) {
      setState(() {
        _registeredUser = result;
        _namaController.text = result.nama; 
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Registrasi Berhasil! Silakan Login.', style: TextStyle(color: Colors.white)),
          backgroundColor: primaryDark,
        ),
      );
    }
  }

  // Fungsi untuk Login
  void _login() {
    if (_formKey.currentState!.validate()) {
      
      if (_registeredUser == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Belum ada akun! Silakan Register terlebih dahulu.'), backgroundColor: Colors.red),
        );
        return;
      }

      
      if (_namaController.text == _registeredUser!.nama && _passwordController.text == _registeredUser!.password) {
        
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage(userData: _registeredUser!)),
        );
      } else {
        // Jika salah
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Nama atau Password salah!'), backgroundColor: Colors.red),
        );
      }
    }
  }


  InputDecoration _buildInputDecor(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: primaryDark),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: primaryDark, width: 2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgScaffold,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shield, size: 100, color: primaryDark),
                const SizedBox(height: 16),
                const Text('Adventure Guild', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF1E5B5B))),
                const Text('Enter the dungeon', style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 40),

                TextFormField(
                  controller: _namaController,
                  decoration: _buildInputDecor('Adventurer Name', Icons.person),
                  validator: (value) => value!.isEmpty ? 'Nama tidak boleh kosong' : null,
                ),
                const SizedBox(height: 16),
                
                TextFormField(
                  controller: _passwordController,
                  obscureText: true, // Sensor password
                  decoration: _buildInputDecor('Password', Icons.lock),
                  validator: (value) => value!.isEmpty ? 'Password tidak boleh kosong' : null,
                ),
                const SizedBox(height: 32),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryDark,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('LOGIN', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 16),


                TextButton(
                  onPressed: _goToRegister,
                  child: Text('Don\'t have an account? Register', style: TextStyle(color: primaryDark, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}