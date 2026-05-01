import 'package:flutter/material.dart';
import '../models/app_models.dart';

class DetailQuestPage extends StatelessWidget {
  final Quest quest;

  const DetailQuestPage({super.key, required this.quest});

  // --- TEMA WARNA GUILD ---
  final Color primaryDark = const Color(0xFF1E5B5B);
  final Color bgScaffold = const Color(0xFFFAFAFA);
  final Color appBarColor = const Color(0xFFB2EBF2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgScaffold,
      appBar: AppBar(
        title: const Text(
          'Quest Details',
          style: TextStyle(color: Color(0xFF006064), fontWeight: FontWeight.bold),
        ),
        backgroundColor: appBarColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF006064)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. GAMBAR BESAR DENGAN GAYA MODERN (Rounded & Shadow)
            Container(
              width: double.infinity,
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  quest.imageAsset,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey.shade200,
                      child: const Center(
                        child: Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
                      ),
                    );
                  },
                ),
              ),
            ),
            
            const SizedBox(height: 24),

            Text(
              quest.title,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: primaryDark),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildBadge('Rank: ${quest.rank}', Colors.orange.shade100, Colors.orange.shade800),
                const SizedBox(width: 8),
                _buildBadge(
                  quest.isTaken ? 'Status: Taken' : 'Status: Available',
                  quest.isTaken ? Colors.green.shade100 : Colors.blue.shade100,
                  quest.isTaken ? Colors.green.shade800 : Colors.blue.shade800,
                ),
              ],
            ),
            
            const SizedBox(height: 20),
            Divider(color: Colors.grey.shade300, thickness: 1.5),
            const SizedBox(height: 16),

            Expanded(
              child: SingleChildScrollView( 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Mission Objective',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      quest.desc,
                      style: const TextStyle(fontSize: 16, height: 1.5, color: Colors.black87),
                    ),
                    
                    const SizedBox(height: 30),
                    
                    const Text(
                      'Rewards',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    // KOTAK REWARD (Gaya keemasan agar menonjol)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF8E1), 
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.amber.shade300),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.monetization_on, color: Colors.amber, size: 28),
                          const SizedBox(width: 10),
                          Text(
                            quest.reward, 
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.brown),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: quest.isTaken ? null : () => Navigator.pop(context, true),
                icon: Icon(quest.isTaken ? Icons.lock : Icons.add_task, color: Colors.white),
                label: Text(
                  quest.isTaken ? 'Quest is Active' : 'Take Quest',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: quest.isTaken ? Colors.grey.shade400 : primaryDark,
                  disabledBackgroundColor: Colors.grey.shade400,
                  elevation: quest.isTaken ? 0 : 5, 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildBadge(String text, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20), 
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 13),
      ),
    );
  }
}