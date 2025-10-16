// Halaman Splash Screen untuk aplikasi Saigon Tasks
// Menampilkan logo + indikator loading sebelum menuju ke halaman Login

import 'package:flutter/material.dart';
import '../widgets/saigon_logo.dart';
import 'login_screen.dart';
import 'dart:async'; // Digunakan untuk Timer

class SplashScreen extends StatefulWidget {
  static const String route = '/'; // route utama aplikasi
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Timer selama 5 detik, lalu pindah ke halaman Login
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, LoginScreen.route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F8F4), 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            // Logo aplikasi (dari file widget)
            SaigonLogo(size: 180),

            SizedBox(height: 24),

            // Animasi loading 
            CircularProgressIndicator(color: Color(0xFF1E4D8E)),

            SizedBox(height: 16),

            // Teks tambahan di bawah animasi loading
            Text(
              "Loading your tasks...",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                letterSpacing: 0.8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
