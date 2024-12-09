import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/jokes.dart';

class JokeService {
  static const String _baseUrl = 'https://official-joke-api.appspot.com';

  Future<List<String>> getJokeTypes() async {
    final url = Uri.parse('$_baseUrl/types');
    return _handleGetRequest<List<String>>(
      url,
          (data) => List<String>.from(data),
    );
  }

  Future<List<Joke>> getJokesByType(String type) async {
    final url = Uri.parse('$_baseUrl/jokes/$type/ten');
    return _handleGetRequest<List<Joke>>(
      url,
          (data) => (data as List).map((joke) => Joke.fromJson(joke)).toList(),
    );
  }

  Future<Joke> getRandomJoke() async {
    final url = Uri.parse('$_baseUrl/random_joke');
    return _handleGetRequest<Joke>(
      url,
          (data) => Joke.fromJson(data),
    );
  }

  Future<T> _handleGetRequest<T>(
      Uri url,
      T Function(dynamic) parseFunction,
      ) async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return parseFunction(data);
      } else {
        throw Exception('Failed to load data from $url');
      }
    } catch (e) {
      throw Exception('An error occurred while fetching data: $e');
    }
  }
}
