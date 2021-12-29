import 'package:flutter/material.dart';
import 'package:rickandmorty/model/character_model.dart';
import 'package:rickandmorty/service/character_service.dart';
import 'package:rickandmorty/widgets/description_modal.dart';

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
            return Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      CharacterService().getCharactersEpisodes(0);
                    },
                    child: Text('data')),
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: ClipOval(
                            child: Image.network(snapshot.data![index].image),
                          ),
                          title: Text(
                            snapshot.data![index].name,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black87,
                            ),
                          ),
                          onTap: () => showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              context: context,
                              builder: (BuildContext context) {
                                return DescriptionModal(
                                  index: index,
                                );
                              }),
                        );
                      }),
                ),
              ],
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
