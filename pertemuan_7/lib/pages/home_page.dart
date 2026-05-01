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
  // Tambahkan data agar mirip seperti gambar
  List<Quest> questList = [
    Quest(title: 'Defeat Black Bear', rank: 'A', reward: '500 Gold', imageAsset: 'assets/images/black_bear.jpg', desc: 'Defeat the bear in the dark forest.', isTaken: true),
    Quest(title: 'Find Mana Core', rank: 'C', reward: 'Mana Potion', imageAsset: 'assets/images/mana_core.jpg', desc: 'Search for mana core in the cave.'),
    Quest(title: 'Defeat Ancient Dragon', rank: 'SSS', reward: 'Dragon Sword', imageAsset: 'assets/images/ancient_dragon.jpg', desc: 'Save the world!'),
    Quest(title: 'Search Herb Plant', rank: 'F', reward: '10 Gold', imageAsset: 'assets/images/herb_plant.jpg', desc: 'Gather herbs for the local doctor.'),
    Quest(title: 'Mine Iron', rank: 'E', reward: 'Iron Ores', imageAsset: 'assets/images/mine_iron.jpg', desc: 'Work in the mines.'),
  ];

  @override
  Widget build(BuildContext context) {
    const Color bgScaffold = Color(0xFFFAFAFA); // Putih sedikit abu-abu
    const Color appBarColor = Color(0xFFB2EBF2); // Cyan muda

    return Scaffold(
      backgroundColor: bgScaffold,
      appBar: AppBar(
        title: const Text(
          'Adventure Guild',
          style: TextStyle(color: Color(0xFF006064), fontWeight: FontWeight.bold),
        ),
        backgroundColor: appBarColor,
        elevation: 0,
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300), 
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      leading: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFC4EBE7), // Background kotak icon
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset(
                          quest.imageAsset,
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        quest.title,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text('Rank: ${quest.rank}', style: const TextStyle(fontSize: 13)),
                      trailing: const Icon(Icons.chevron_right, color: Color(0xFF1E5B5B)),
                      onTap: () async {
                        // Logika yang sama: Buka halaman detail, tunggu balikan true/false
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