import 'package:flutter/material.dart';

// Import semua screens
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  // Fungsi utama yang dijalankan pertama kali
  runApp(const SaigonTasksApp());
}

/// Widget utama aplikasi
class SaigonTasksApp extends StatelessWidget {
  const SaigonTasksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Judul aplikasi
      title: 'Saigon Tasks',

      // Hilangkan banner debug di pojok kanan atas
      debugShowCheckedModeBanner: false,

      // Tema utama aplikasi
      theme: ThemeData(
        fontFamily: 'Poppins', // Font yang digunakan
        scaffoldBackgroundColor: const Color(0xFFF9F8F4), 

        // Skema warna utama aplikasi
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF1E4D8E), 
          secondary: const Color(0xFF6C757D), 
        ),
      ),

      // Halaman pertama saat aplikasi dijalankan
      initialRoute: SplashScreen.route,

      // Daftar route untuk navigasi antar halaman
      routes: {
        SplashScreen.route: (context) => const SplashScreen(),
        LoginScreen.route: (context) => const LoginScreen(),
        SignupScreen.route: (context) => const SignupScreen(),
        DashboardScreen.route: (context) => const DashboardScreen(),
        ProfileScreen.route: (context) => const ProfileScreen(),
      },
    );
  }
}
