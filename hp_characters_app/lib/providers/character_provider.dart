import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/character_model.dart';
import 'package:hp_characters_app/services/character_service.dart';

final characterProvider = FutureProvider<List<CharacterModel>>((ref) async {
  return CharacterService().getCharacters();
});