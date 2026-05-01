// lib/models/app_models.dart

class UserData {
  final String nama;
  final String level;
  final String rank;
  final String job;

  UserData({
    required this.nama,
    required this.level,
    required this.rank,
    required this.job,
  });
}

class Quest {
  final String title;
  final String rank;
  final String reward;
  final String imageAsset;
  final String desc;
  bool isTaken;

  Quest({
    required this.title,
    required this.rank,
    required this.reward,
    required this.imageAsset,
    required this.desc,
    this.isTaken = false,
  });
}