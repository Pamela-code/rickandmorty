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

  Future getCharactersEpisodes(index) async {
    final response = await dio.get(url);
    final body = response.data['results'][index]['episode'] as List;
    int counter = 0;
    List<EpisodesModel> episodes = <EpisodesModel>[];

    for (counter = 0; counter < body.length; counter++) {
      final newUrl = body[counter];
      final responseNewUrl = await dio.get(newUrl);
      final newBody = responseNewUrl.data;

      final episode =
          EpisodesModel(name: newBody['name'], airDate: newBody['air_date']);

      episodes.add(episode);
    }
    print(episodes.length);
    return episodes;
  }
}
