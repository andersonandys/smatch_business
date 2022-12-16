class ChaineModel {
  final String id;
  final String firstName;
  final String lastName;
  final String canalName;
  final bool free;
  final String accountType;
  final String? compagnyFilialeId;
  final String? compagnyFilialeName;
  final String? desc;
  final String? urlPicture;

  ChaineModel({
    required this.id,
    required this.firstName,
    required this.lastName,
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
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
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
