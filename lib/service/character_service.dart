import 'package:dio/dio.dart';
import 'package:rickandmorty/model/episodes_model.dart';
import '../model/character_model.dart';

class CharacterService {
  final url = "https://rickandmortyapi.com/api/character/?page=1";
  final dio = Dio();

  Future<List<CharacterModel>> getCharacters() async {
    final response = await dio.get(url);
    final body = response.data['results'] as List;
    final characters = body.map((map) {
      return CharacterModel(
        name: map['name'],
        image: map['image'],
        species: map['species'],
        status: map['status'],
      );
    }).toList();

    return characters;
  }

  Future<EpisodesModel> getCharactersEpisodes(index) async {
    final response = await dio.get(url);
    final body = response.data['results'][index]['episode'] as List;
    int counter = 0;

    final newUrl = body[counter];
    final responseNewUrl = await dio.get(newUrl);
    final newBody = responseNewUrl.data;
    print(newBody['air_date']);

    final episode =
        EpisodesModel(name: newBody['name'], airDate: newBody['air_date']);

    return episode;
  }
}
