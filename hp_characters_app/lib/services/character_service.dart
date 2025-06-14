import 'package:dio/dio.dart';
import 'package:hp_characters_app/models/character_model.dart';

class CharacterService {
  final Dio _dio = Dio();
  final String _baseUrl = "https://hp-api.onrender.com/api/characters";

  Future<List<CharacterModel>> getCharacters() async {
    final response = await _dio.get(_baseUrl);
    return (response.data as List)
        .map((json) => CharacterModel.fromJson(json))
        .toList();
  }
}