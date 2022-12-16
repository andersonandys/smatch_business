class CompagnyModel {
  final String id;
  final String name;
  final String? desc;
  final String? urlPicture;

  CompagnyModel({
    required this.id,
    required this.name,
    this.desc,
    this.urlPicture,
  });
}
