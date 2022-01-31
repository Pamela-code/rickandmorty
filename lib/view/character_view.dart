import 'package:flutter/material.dart';
import 'package:rickandmorty/model/character_model.dart';
import 'package:rickandmorty/service/character_service.dart';
import 'package:rickandmorty/view/widgets/character_list_view.dart';

class CharacterView extends StatefulWidget {
  const CharacterView({Key? key}) : super(key: key);

  @override
  _CharacterViewState createState() => _CharacterViewState();
}

class _CharacterViewState extends State<CharacterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Ricky and Morty'),
      ),
      body: FutureBuilder<List<CharacterModel>>(
        future: CharacterService().getCharacters(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CharacterList(
              snapshot: snapshot,
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Center(
                  child: CircularProgressIndicator(),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
