import 'package:smatch_managment/core/config/app_contants.dart';

class BusinessModel {
   String? id;
  //  String name;
   String date;
   String description;
   String? descriptionVideo;
   String? idcategorie;
   String idUser;
   String? idvideo;
   String? lienvideo;
   String? urlPicture;
   bool? mode;
   int? notification;
   String? offre;
   String? playliste;
   String? prix;
   int range;
   int? ready;
   String? statut;
   String? titre;
   String? type;
   String? typePaiement;
   String? vignette;
   int? wallet;

  BusinessModel({
     this.id, // id du business
    // required this.name,
    required this.date,
    required this.description,
    this.descriptionVideo,
    this.idcategorie,
    required this.idUser, // id de l'utilisateur
    this.idvideo,
    this.lienvideo,
    this.urlPicture,
    this.mode,
    this.notification,
    this.offre,
    this.playliste,
    this.prix,
    required this.range,
    this.ready,
    this.statut,
    this.titre,
    this.type = AppConstants.momentFieldFS,
    this.typePaiement,
    this.vignette,
    this.wallet,
  });

  factory BusinessModel.fromJson(Map<String, dynamic> json) {
    return BusinessModel(
      id: json['idcompte'],
      // name: json['nom'],
      date: json['date'],
      description: json['description'],
      descriptionVideo: json['descriptionvideo'],
      idcategorie: json['idcategorie'],
      idUser: json['idcreat'],
      idvideo: json['idvideo'],
      lienvideo: json['lienvideo'],
      urlPicture: json['logo'],
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
      'idcompte': id,
      'idcreat': idUser,
      'idvideo': idvideo,
      'lienvideo': lienvideo,
      'logo': urlPicture,
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
