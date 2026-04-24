import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  final IconData icon;
  final String title;
  final String rank;

  const TodoList({
    super.key,
    required this.icon,
    required this.title,
    required this.rank,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Ink(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.withAlpha(14),
          borderRadius: BorderRadius.circular(12),
          border: .all(color: Colors.black.withAlpha(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(10),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.purpleAccent.withAlpha(12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.task_alt, color: Colors.purpleAccent),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: .bold),
                  ),
                  SizedBox(height: 2),
                  Text("Rank: $rank"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
