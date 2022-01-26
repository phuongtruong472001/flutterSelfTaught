import 'package:request_api/models/film.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class AllFilm {
  static Future<List<Film>> fetchAllFilm(String query) async {
    String url = "https://www.episodate.com/api/most-popular";
    try {
      final respone = await http.get(Uri.parse(url));
      final extractedData = convert.jsonDecode(respone.body);
      List<dynamic> listFilms = extractedData["tv_shows"];
      return listFilms.map((json) => Film.fromJson(json)).where((film) {
        final nameLower = film.name.toLowerCase();
        final searchLower = query.toLowerCase();
        return nameLower.contains(searchLower);
      }).toList();
    } catch (error) {
      rethrow;
    }
  }
}
