class UserModel {
  final int id;
  final String email;
  final bool isAdmin;
  final String? createdAt;
  final String? updatedAt;

  UserModel({
    required this.id,
    required this.email,
    required this.isAdmin,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      email: json["email"] ?? '',
      isAdmin: json["is_admin"] ?? false,
      createdAt: json["created_at"], // Bisa null
      updatedAt: json["updated_at"], // Bisa null
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'is_admin': isAdmin,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };
}
