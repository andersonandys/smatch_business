class UserModel {
  final String uid;
  final String? firstName;
  final String? lastName;
  final String? email;

  UserModel({
    required this.uid,
    this.firstName,
    this.lastName,
    this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['iduser'],
      // firstName: json['firstName'] ?? '',
      // lastName: json['lastName'] ?? '',
      // email: json['email'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
    };
  }
}
