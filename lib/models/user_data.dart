class User {
  final String username;
  final String passwordHash;

  User({required this.username, required this.passwordHash});
}

// Uygulama açık olduğu sürece bu liste içinde kullanıcıları tutacağız
// İçine varsayılan olarak admini ekleyelim
List<User> registeredUsers = [
  User(
    username: 'admin',
    passwordHash:
        '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', // admin123
  ),
];
