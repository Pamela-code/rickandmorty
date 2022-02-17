import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rickandmorty/model/character_model.dart';
import 'package:rickandmorty/controller/character_controller.dart';
import 'package:rickandmorty/view/widgets/character_list_view.dart';

class CharacterView extends StatefulWidget {
  const CharacterView({Key? key}) : super(key: key);

  @override
  _CharacterViewState createState() => _CharacterViewState();
}

class _CharacterViewState extends State<CharacterView> {
  final controller = CharacterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Ricky and Morty'),
      ),
      body: Observer(builder: (_) {
        return FutureBuilder<List<CharacterModel>>(
          future: controller.getCharacters(controller.actualPage),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Observer(builder: (_) {
                return CharacterList(
                  snapshot: snapshot,
                );
              });
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
        );
      }),
    );
  }
}
