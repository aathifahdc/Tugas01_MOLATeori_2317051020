import 'package:flutter/material.dart';
import 'login_screen.dart';

/// Halaman ProfileScreen
///
/// Berfungsi untuk menampilkan informasi pengguna seperti nama, email,
/// dan beberapa menu pengaturan akun serta tombol logout.
class ProfileScreen extends StatelessWidget {
  static const String route = '/profile'; // Route untuk navigasi ke halaman ini
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Warna latar belakang
      backgroundColor: const Color(0xFFF9F8F4),

      // AppBar dengan judul "Profile"
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E4D8E),
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, // Judul di tengah
      ),

      // Body dibungkus dengan SingleChildScrollView agar bisa di-scroll
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),

              // Foto profil pengguna
              const CircleAvatar(
                radius: 50, // Ukuran lingkaran
                backgroundImage: AssetImage('assets/profiltam.jpg'), // Path gambar
              ),

              const SizedBox(height: 16),

              // Nama pengguna
              const Text(
                'Aathifah Dihyan Calysta',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E4D8E),
                ),
              ),

              const SizedBox(height: 4),

              // Email pengguna
              const Text(
                'aathifah@gmail.com',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 32),
              const Divider(thickness: 1),

              // Menu pengaturan akun
              ListTile(
                leading: const Icon(Icons.settings, color: Color(0xFF1E4D8E)),
                title: const Text('Account Settings'),
                onTap: () {
                  // Aksi ketika menu ditekan (belum diimplementasi)
                },
              ),

              // Menu informasi aplikasi
              ListTile(
                leading:
                    const Icon(Icons.info_outline, color: Color(0xFF1E4D8E)),
                title: const Text('About App'),
                onTap: () {
                  // Aksi ketika menu ditekan (belum diimplementasi)
                },
              ),

              // Tombol logout
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.redAccent),
                title: const Text('Logout'),
                onTap: () {
                  // Kembali ke halaman login saat logout ditekan
                  Navigator.pushReplacementNamed(context, LoginScreen.route);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
