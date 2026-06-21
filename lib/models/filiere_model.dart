class FiliereModel {
  final int id;
  final String nomFiliere;
  final String universite;
  final String etablissement;
  final int quotasBourses;
  final int quotasFpp;

  // Le constructeur de la classe
  FiliereModel({
    required this.id,
    required this.nomFiliere,
    required this.universite,
    required this.etablissement,
    required this.quotasBourses,
    required this.quotasFpp,
  });

  // La fonction magique (Factory) qui convertit une ligne du JSON en un Objet Dart
  factory FiliereModel.fromJson(Map<String, dynamic> json) {
    return FiliereModel(
      id: json['id'] as int,
      nomFiliere: json['nom_filiere'] as String,
      universite: json['universite'] as String,
      etablissement: json['etablissement'] as String,
      quotasBourses: json['quotas_bourses'] as int,
      quotasFpp: json['quotas_fpp'] as int,
    );
  }
}
