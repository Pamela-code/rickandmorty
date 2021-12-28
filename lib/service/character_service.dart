import 'package:dio/dio.dart';
import '../model/character_model.dart';

class CharacterService {
  final url = "https://rickandmortyapi.com/api/character/?page=1";
  final dio = Dio();

  Future<List<CharacterModel>> getCharacters() async {
    final response = await dio.get(url);
    final body = response.data['results'] as List;
    final characters = body
        .map(
          (map) => CharacterModel(
            name: map['name'],
            image: map['image'],
            // episode: map['episode'],
            species: map['species'],
            status: map['status'],
          ),
        )
        .toList();
    return characters;
  }
}
