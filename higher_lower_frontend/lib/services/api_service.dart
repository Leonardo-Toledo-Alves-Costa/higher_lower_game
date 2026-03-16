import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character.dart';

class ApiService {
  final String baseUrl = "http://10.0.2.2:3000";

  Future<List<Character>> fetchShuffle() async {
    final url = Uri.parse('$baseUrl/sorteio');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((jsonItem) => Character.fromJson(jsonItem)).toList();
    } else {
      throw Exception("Failed to load the data from API");
    }
  }
}
