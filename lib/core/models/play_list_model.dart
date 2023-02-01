// categorie represente la play liste
// creer la play list dans le noeur(business)

class PlayListModel {
  String date;
  String idCompte;
  String nom;
  int range;

  PlayListModel({
    required this.date,
    required this.idCompte,
    required this.nom,
    required this.range,
  });

  factory PlayListModel.fromJson(Map<String, dynamic> json) {
    return PlayListModel(
      date: json['date'],
      idCompte: json['idCompte'],
      nom: json['nom'],
      range: json['range'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'idCompte': idCompte,
      'nom': nom,
      'range': range,
    };
  }
}
