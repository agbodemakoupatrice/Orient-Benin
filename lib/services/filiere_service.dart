import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';
import '../models/filiere_model.dart';

class FiliereService {
  // Nom de fonction 100% en ASCII sans accent
  static Future<List<FiliereModel>> recupererToutesLesFilieres() async {
    try {
      final response = await http.get(Uri.parse(AppConstants.apiFilieresRoute));

      if (response.statusCode == 200) {
        final Map<String, dynamic> dataDecodee = jsonDecode(response.body);
        final List<dynamic> listeFilieresJson = dataDecodee['donnees'];

        return listeFilieresJson
            .map((itemJson) => FiliereModel.fromJson(itemJson))
            .toList();
      } else {
        throw Exception("Erreur serveur code : ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Impossible de joindre le serveur. Allume Node.js.");
    }
  }
}
