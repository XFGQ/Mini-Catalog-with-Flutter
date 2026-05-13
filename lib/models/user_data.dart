import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  String username;
  String passwordHash;
  List<int> favoriteIds;

  User({
    required this.username,
    required this.passwordHash,
    List<int>? favoriteIds,
  }) : favoriteIds = favoriteIds ?? [];

  Map<String, dynamic> toJson() => {
    'username': username,
    'passwordHash': passwordHash,
    'favoriteIds': favoriteIds,
  };

  factory User.fromJson(Map<String, dynamic> json) => User(
    username: json['username'],
    passwordHash: json['passwordHash'],
    favoriteIds: List<int>.from(json['favoriteIds'] ?? []),
  );
}

List<User> registeredUsers = [];
User? currentUser;

Future<void> loadUsersFromStorage() async {
  final prefs = await SharedPreferences.getInstance();
  final String? data = prefs.getString('users_database');

  if (data != null) {
    final List<dynamic> decoded = jsonDecode(data);
    registeredUsers = decoded.map((e) => User.fromJson(e)).toList();
  } else {
    registeredUsers = [
      User(
        username: 'admin',
        passwordHash:
            '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9',
      ),
    ];
    await saveUsersToStorage();
  }
}

Future<void> saveUsersToStorage() async {
  final prefs = await SharedPreferences.getInstance();
  final String encoded = jsonEncode(
    registeredUsers.map((e) => e.toJson()).toList(),
  );
  await prefs.setString('users_database', encoded);
}
