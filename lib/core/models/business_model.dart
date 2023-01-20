class BusinessModel {
  final String idCreat;
  final String name;
  final String description;
  final String playlist;
  final String idCompte;
  final String? idVideo;
  final String logo;
  final String vignette;

  BusinessModel({
    required this.idCreat,
    required this.playlist,
    required this.name,
    required this.description,
    required this.idCompte,
    required this.idVideo,
    required this.logo,
    required this.vignette,
  });

  factory BusinessModel.fromJson(Map<String, dynamic> json) {
    return BusinessModel(
      idCreat: json['id'],
      name: json['nom'],
      playlist: json['playliste'],
      description: json['description'],
      idCompte: json['idcompte'],
      idVideo: json['type'],
      logo: json['logo'],
      vignette: json['vignette'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': idCreat,
      'nom': name,
      'playliste': playlist,
      'description': description,
      'type': idVideo,
      'logo': logo,
      'vignette': vignette,
    };
  }
}
