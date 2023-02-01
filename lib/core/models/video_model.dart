class VideoModel {
  final int comment;
  final String date;
  final String description;
  final String idCategorie; //id playlist
  final String idVideo;
  final String idVlog;
  final int like;
  final int partage;
  final String playListe; //nom de la playlist
  final int range;
  final String titre;
  final String lienVideo;
  final String vignette;
  final int vue;

  VideoModel({
    this.comment = 0,
    required this.date,
    required this.description,
    required this.idCategorie,
    required this.idVideo,
    required this.idVlog,
    this.like = 0,
    this.partage = 0,
    required this.playListe,
    required this.range,
    required this.titre,
    required this.lienVideo,
    required this.vignette,
    this.vue = 0,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      comment: json['comment'],
      date: json['date'],
      description: json['description'],
      idCategorie: json['idcategorie'],
      idVideo: json['idvideo'],
      idVlog: json['idvlog'],
      like: json['like'],
      partage: json['partage'],
      playListe: json['playliste'],
      range: json['range'],
      titre: json['titre'],
      lienVideo: json['video'],
      vignette: json['vignette'],
      vue: json['vue'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'comment': comment,
      'date': date,
      'description': description,
      'idcategorie': idCategorie,
      'idvideo': idVideo,
      'idvlog': idVlog,
      'like': like,
      'partage': partage,
      'playliste': playListe,
      'range': range,
      'titre': titre,
      'video': lienVideo,
      'vignette': vignette,
      'vue': vue,
    };
  }
}
