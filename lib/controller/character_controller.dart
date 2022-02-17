import 'package:dio/dio.dart';
import 'package:rickandmorty/model/episodes_model.dart';
import '../model/character_model.dart';
import 'package:mobx/mobx.dart';

part 'character_controller.g.dart';

class CharacterController = _CharacterControllerBase with _$CharacterController;

abstract class _CharacterControllerBase with Store {
  @observable
  var dio = Dio();

  @observable
  int actualPage = 1;

  @action
  nextPage() {
    if (actualPage < 42) {
      actualPage++;
      print(actualPage);
    }
  }

  @action
  previousPage() {
    if (actualPage > 0) {
      actualPage--;
      print(actualPage);
    }
  }

  @action
  Future<List<CharacterModel>> getCharacters(page) async {
    String url = "https://rickandmortyapi.com/api/character/?page=$page";

    final response = await dio.get(url);
    print(url);
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

  @action
  Future<List<EpisodesModel>> getCharactersEpisodes(index, page) async {
    String url = "https://rickandmortyapi.com/api/character/?page=$page";
    final response = await dio.get(url);
    print(url);
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

    return episodes;
  }
}
