import 'package:flutter/material.dart';
import '../models/app_models.dart';

class HeaderWidget extends StatelessWidget {
  final UserData userData;

  const HeaderWidget({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    const Color primaryDark = Color(0xFF1E5B5B); // Warna teks hijau gelap
    const Color bgCard = Color(0xFFE4F6F5); // Warna background card profil

    return Column(
      children: [
        // --- PROFILE CARD ---
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: bgCard,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              // Avatar & Level (Menggunakan Stack agar Level menumpuk di atas gambar)
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(
                        'assets/images/knigth_img.jpg'), // Ganti URL gambar jika perlu
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Level ${userData.level}',
                      style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              // Name & Job
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userData.nama,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryDark),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      userData.job,
                      style: const TextStyle(fontSize: 14, color: primaryDark),
                    ),
                  ],
                ),
              ),
              // Rank Box
              Container(
                width: 100,
                height: 70,
                decoration: BoxDecoration(
                  color: const Color(0xFFC4EBE7),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    userData.rank.toUpperCase(),
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: primaryDark),
                  ),
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 16),
        Wrap(
                  spacing: 12, // Jarak horizontal antar item (pengganti SizedBox width)
                  runSpacing: 12, // Jarak vertikal jika item turun ke baris bawah
                  children: [
                    _buildStatCard(Icons.favorite, Colors.red, 'HP', '8000', const Color(0xFFFFEBEE), Colors.red.shade200),
                    _buildStatCard(Icons.shield, Colors.blue, 'Shield', '1000', const Color(0xFFE3F2FD), Colors.blue.shade200),
                    _buildStatCard(Icons.water_drop, Colors.orange, 'Damage', '1700', const Color(0xFFFFF3E0), Colors.orange.shade200),
                  ],
                ),
      ],
    );
  }

  // Widget helper untuk membuat kotak HP, Shield, Damage
  Widget _buildStatCard(IconData icon, Color iconColor, String title, String value, Color bgColor, Color borderColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 16),
          const SizedBox(width: 4),
          Text('$title: ', style: const TextStyle(fontSize: 12)),
          Text(value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}