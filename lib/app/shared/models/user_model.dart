class UserModel {
  UserModel({
    this.id,
    this.name,
    this.email,
    this.createdAt,
    this.updatedAt,
  });

  final int id;
  final String name;
  final String email;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
