class User {
  final int id;
  final String name;
  final String email;
  final int points;
  

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.points,
  });

  factory User.fromJson(Map&lt;String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      points: json['points']
    );
  }
}