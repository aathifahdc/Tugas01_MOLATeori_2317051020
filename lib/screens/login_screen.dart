import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'dashboard_screen.dart';
import '../widgets/saigon_logo.dart';

class LoginScreen extends StatefulWidget {
  static const String route = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Key untuk validasi form
  final _formKey = GlobalKey<FormState>();

  // Controller untuk input email & password
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Bersihkan controller agar tidak terjadi memory leak
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Fungsi untuk memeriksa format email
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
              key: _formKey, // Form terhubung dengan validasi
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo aplikasi
                  const SaigonLogo(size: 120),
                  const SizedBox(height: 32),

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
                    obscureText: true, // agar password disembunyikan
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

                  // Tombol Login
                  ElevatedButton(
                    onPressed: () {
                      // Jalankan validasi form
                      if (_formKey.currentState!.validate()) {
                        // Jika valid, tampilkan pesan sukses dan navigasi ke dashboard
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Login succsess! Welcome 👋'),
                            backgroundColor: Colors.green,
                          ),
                        );

                        Navigator.pushReplacementNamed(
                          context,
                          DashboardScreen.route,
                        );
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
                      'Login',
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Tombol navigasi ke halaman Sign Up
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SignupScreen.route);
                    },
                    child: const Text(
                      "Don’t have an account? Sign up",
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
