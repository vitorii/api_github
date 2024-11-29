import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {

  static Future<dynamic> getRepositories() async {

    var repositories;
    
    final response = await http.get(
      Uri.parse('https://api.github.com/users/vitorii/repos'),
    );

    if (response.statusCode == 200) {
      repositories = json.decode(response.body);
    }

    return repositories;
  }
}