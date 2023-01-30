class BusinessModel {
  final String date;
  final String description;
  final String? descriptionVideo;
  final String? idcategorie;
  final String idcompte;
  final String idcreat;
  final String? idvideo;
  final String? lienvideo;
  final String? logo;
  final bool? mode;
  final int? notification;
  final String? offre;
  final String? playliste;
  final String? prix;
  final int range;
  final int? ready;
  final String? statut;
  final String? titre;
  final String? type;
  final String? typePaiement;
  final String? vignette;
  final int? wallet;

  BusinessModel({
    required this.date,
    required this.description,
    this.descriptionVideo,
    this.idcategorie,
    required this.idcompte,
    required this.idcreat,
    this.idvideo,
    this.lienvideo,
    this.logo,
    this.mode,
    this.notification,
    this.offre,
    this.playliste,
    this.prix,
    required this.range,
    this.ready,
    this.statut,
    this.titre,
    this.type,
    this.typePaiement,
    this.vignette,
    this.wallet,
  });

  factory BusinessModel.fromJson(Map<String, dynamic> json) {
    return BusinessModel(
      date: json['date'],
      description: json['description'],
      descriptionVideo: json['descriptionvideo'],
      idcategorie: json['idcategorie'],
      idcompte: json['idcompte'],
      idcreat: json['idcreat'],
      idvideo: json['idvideo'],
      lienvideo: json['lienvideo'],
      logo: json['logo'],
      mode: json['mode'],
      notification: json['notification'],
      offre: json['offre'],
      playliste: json['playliste'],
      prix: json['prix'],
      range: json['range'],
      ready: json['ready'],
      statut: json['statut'],
      titre: json['titre'],
      type: json['type'],
      typePaiement: json['type_paiement'],
      vignette: json['vignette'],
      wallet: json['wallet'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'description': description,
      'descriptionvideo': descriptionVideo,
      'idcategorie': idcategorie,
      'idcompte': idcompte,
      'idcreat': idcreat,
      'idvideo': idvideo,
      'lienvideo': lienvideo,
      'logo': logo,
      'mode': mode,
      'notification': notification,
      'offre': offre,
      'playliste': playliste,
      'prix': prix,
      'range': range,
      'ready': ready,
      'statut': statut,
      'titre': titre,
      'type': type,
      'type_paiement': typePaiement,
      'vignette': vignette,
      'wallet': wallet,
    };
  }
}
