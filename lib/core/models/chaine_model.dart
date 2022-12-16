class ChaineModel {
  String? id;
  final String firstName;
  final String lastName;
  final String email;
  final String canalName;
  final bool free;
  final String accountType;
  final String? compagnyFilialeId;
  final String? compagnyFilialeName;
  final String? desc;
  String? urlPicture;

  ChaineModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.canalName,
    required this.free,
    required this.accountType,
    this.compagnyFilialeId,
    this.compagnyFilialeName,
    this.desc,
    this.urlPicture,
  });

  factory ChaineModel.fromJson(Map<String, dynamic> json) {
    return ChaineModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      canalName: json['canalName'],
      free: json['free'],
      accountType: json['accountType'],
      compagnyFilialeId: json['compagnyFilialeId'],
      compagnyFilialeName: json['compagnyFilialeName'],
      desc: json['desc'],
      urlPicture: json['urlPicture'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'canalName': canalName,
      'free': free,
      'accountType': accountType,
      'compagnyFilialeId': compagnyFilialeId,
      'compagnyFilialeName': compagnyFilialeName,
      'desc': desc,
      'urlPicture': urlPicture,
    };
  }
}
