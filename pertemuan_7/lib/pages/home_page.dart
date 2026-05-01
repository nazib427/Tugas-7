// lib/pages/home_page.dart
import 'package:flutter/material.dart';
import '../models/app_models.dart';
import '../widgets/header_widget.dart';
import 'detail_quest_page.dart';

class HomePage extends StatefulWidget {
  final UserData userData;

  const HomePage({super.key, required this.userData});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Quest> questList = [
    Quest(title: 'Defeat Black Bear', rank: 'A', reward: '500 Gold', imageAsset: 'assets/images/black_bear.jpg', desc: 'Defeat the bear in the dark forest.', isTaken: true),
    Quest(title: 'Find Mana Core', rank: 'C', reward: 'Mana Potion', imageAsset: 'assets/images/mana_core.jpg', desc: 'Search for mana core in the cave.'),
    Quest(title: 'Defeat Ancient Dragon', rank: 'SSS', reward: 'Dragon Sword', imageAsset: 'assets/images/ancient_dragon.jpg', desc: 'Save the world!'),
    Quest(title: 'Search Herb Plant', rank: 'F', reward: '10 Gold', imageAsset: 'assets/images/herb_plant.jpg', desc: 'Gather herbs for the local doctor.'),
    Quest(title: 'Mine Iron', rank: 'E', reward: 'Iron Ores', imageAsset: 'assets/images/iron_ore.jpg', desc: 'Work in the mines.'),
  ];

  @override
  Widget build(BuildContext context) {
    const Color bgScaffold = Color(0xFFFAFAFA); 
    const Color appBarColor = Color(0xFFB2EBF2); 
    const Color primaryDark = Color(0xFF1E5B5B); 

    return Scaffold(
      backgroundColor: bgScaffold,
      appBar: AppBar(
        title: const Text(
          'Adventure Guild',
          style: TextStyle(color: Color(0xFF006064), fontWeight: FontWeight.bold),
        ),
        backgroundColor: appBarColor,
        elevation: 0,
        automaticallyImplyLeading: false, 
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            HeaderWidget(userData: widget.userData),
            const SizedBox(height: 24),
            const Text(
              "Today's Quest",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: questList.length,
                itemBuilder: (context, index) {
                  final quest = questList[index];
                  
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: quest.isTaken ? const Color(0xFFF0FDF8) : Colors.white, 
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        // Border lebih tebal dan berwarna teal gelap jika quest aktif
                        color: quest.isTaken ? primaryDark.withOpacity(0.5) : Colors.grey.shade300,
                        width: quest.isTaken ? 1.5 : 1.0, 
                      ),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      leading: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          // Latar ikon diubah menjadi gelap jika quest aktif
                          color: quest.isTaken ? primaryDark : const Color(0xFFC4EBE7), 
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          quest.isTaken ? Icons.check_circle : Icons.circle_outlined,
                          // Warna ikon menjadi putih terang jika aktif
                          color: quest.isTaken ? Colors.white : primaryDark, 
                          size: 28,
                        ),
                      ),
                      title: Text(
                        quest.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: quest.isTaken ? primaryDark : Colors.black87, 
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Row(
                          children: [
                            Text('Rank: ${quest.rank}', style: const TextStyle(fontSize: 13)),
                            
                            // --- TANDA BACA QUEST AKTIF (BADGE) ---
                            if (quest.isTaken) ...[
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.green.shade100,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: const Text(
                                  'Active',
                                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.green),
                                ),
                              ),
                            ]
                          ],
                        ),
                      ),
                      trailing: Icon(Icons.chevron_right, color: primaryDark),
                      onTap: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailQuestPage(quest: quest),
                          ),
                        );

                        if (result == true) {
                          setState(() {
                            questList[index].isTaken = true;
                          });
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}