import 'package:flutter/material.dart';

/// Widget untuk menampilkan logo Saigon Tasks

/// Default ukuran logo adalah 140 jika tidak ditentukan.
class SaigonLogo extends StatelessWidget {
  // Konstruktor dengan parameter opsional [size]
  const SaigonLogo({super.key, this.size = 140});

  // Properti ukuran logo
  final double size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/SaigonLogo.png', // Lokasi file logo di folder assets
      width: size,             // Lebar logo
      height: size,            // Tinggi logo
      fit: BoxFit.contain,     // Menjaga proporsi gambar agar tidak terpotong
    );
  }
}
