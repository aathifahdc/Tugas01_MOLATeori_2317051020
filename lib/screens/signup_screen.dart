import 'package:flutter/material.dart';
import '../widgets/saigon_logo.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  static const String route = '/signup';
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // Key untuk validasi form
  final _formKey = GlobalKey<FormState>();

  // Controller untuk input pengguna
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Bersihkan controller untuk menghindari memory leak
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Fungsi untuk validasi email
  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey, // sambungkan form dengan GlobalKey
              child: Column(
                children: [
                  // Logo aplikasi
                  const SaigonLogo(size: 120),
                  const SizedBox(height: 32),

                  // Input Nama Lengkap
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Full Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name can\'t be empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Input Email
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email can\'t be empty';
                      } else if (!_isValidEmail(value)) {
                        return 'Insert valid Email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Input Password
                  TextFormField(
                    controller: passwordController,
                    obscureText: true, // sembunyikan teks password
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password can\'t be empty';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),

                  // Tombol Sign Up
                  ElevatedButton(
                    onPressed: () {
                      // Jalankan validasi form
                      if (_formKey.currentState!.validate()) {
                        // Jika semua valid, arahkan ke halaman Login
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Sign up succsess! Please login.'),
                            backgroundColor: Colors.green,
                          ),
                        );
                        Navigator.pushReplacementNamed(context, LoginScreen.route);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E4D8E),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 80,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Tautan kembali ke halaman login
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, LoginScreen.route);
                    },
                    child: const Text(
                      "Already have an account? Log in",
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
