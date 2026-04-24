import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderWidget extends StatelessWidget {
  final String name;
  final String role;
  final String rank;
  final int level;

  const HeaderWidget({
    super.key,
    required this.name,
    required this.role,
    required this.level,
    required this.rank,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, const Color.fromARGB(255, 160, 11, 11), const Color.fromARGB(255, 8, 99, 144)],
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 32,
                backgroundImage: NetworkImage(
                  "https://picsum.photos/seed/picsum/200/300",
                ),
              ),
              Positioned(
                right: 9,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 2, 112, 168),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Container(
                    child: Text(
                      "Level $level",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 154, 154, 154),
                        fontSize: 10,
                        fontWeight: .bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: .bold,
                    fontSize: 20,
                    color: const Color.fromARGB(221, 46, 46, 46),
                  ),
                ),
                Text(
                  role,
                  style: TextStyle(
                    fontSize: 12,
                    color: const Color.fromARGB(221, 73, 73, 73),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(32),
              borderRadius: .circular(4),
            ),
            child: Text(
              rank,
              style: GoogleFonts.bubblegumSans(
                textStyle: TextStyle(fontSize: 48, color: Colors.white)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
