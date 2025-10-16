import 'package:flutter/material.dart';
import 'profile_screen.dart';

/// Halaman Dashboard Saigon Tasks
/// 
/// Menampilkan daftar tugas dalam bentuk ListView dan tombol untuk menambah tugas.
/// Juga memiliki ikon profil di AppBar untuk navigasi ke halaman ProfileScreen.
class DashboardScreen extends StatelessWidget {
  static const String route = '/dashboard'; // Route untuk navigasi ke dashboard
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Contoh data tugas
    final tasks = [
      'Tugas Mola Teori',
      'Beli Makanan Kucing',
      'Bersihin Kamar',
    ];

    return Scaffold(
      // AppBar berisi judul dan tombol profil
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E4D8E), // Warna biru khas Saigon
        title: const Text(
          'Saigon Tasks',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          // Tombol menuju halaman profil
          IconButton(
            icon: const Icon(Icons.person_outline, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, ProfileScreen.route);
            },
          ),
        ],
      ),

      // Bagian utama (body) berisi daftar tugas
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: tasks.length, // Jumlah item dalam list
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: const Icon(Icons.task_alt, color: Color(0xFF1E4D8E)), // Icon tugas
                title: Text(tasks[index]), // Nama tugas
                trailing: const Icon(Icons.chevron_right), // Icon navigasi
              ),
            );
          },
        ),
      ),

      // Tombol tambah tugas (floating button)
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF1E4D8E),
        onPressed: () {
          // Aksi untuk menambah tugas baru (belum diimplementasi)
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
