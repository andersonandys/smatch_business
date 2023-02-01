class UserModel {
  final String uid;
  final String nom;
  final String? avatar;
  final String email;

  UserModel({
    required this.uid,
    required this.nom,
    this.avatar,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['iduser'],
      nom: json['nom'],
      email: json['email'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': nom,
      // 'lastName': lastName,
      'email': email,
    };
  }
}
