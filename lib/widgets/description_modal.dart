import 'package:flutter/material.dart';
import 'package:rickandmorty/model/episodes_model.dart';
import 'package:rickandmorty/service/character_service.dart';
import '../model/character_model.dart';

class DescriptionModal extends StatefulWidget {
  const DescriptionModal({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  _DescriptionModalState createState() => _DescriptionModalState();
}

class _DescriptionModalState extends State<DescriptionModal> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) =>
            Container(
              height: constraints.maxHeight,
              margin: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'About the Character',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.green,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 30,
                          left: 40,
                          right: 40,
                        ),
                        child: FutureBuilder<List<CharacterModel>>(
                          future: CharacterService().getCharacters(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                    child: Image.network(
                                      snapshot.data![widget.index].image,
                                      height: 200,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Name: ',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.green,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data![widget.index].name,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Species: ',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.green,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data![widget.index].species,
                                        textAlign: TextAlign.justify,
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Status: ',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.green,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data![widget.index].status,
                                        textAlign: TextAlign.justify,
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  FutureBuilder(
                                      future: CharacterService()
                                          .getCharactersEpisodes(widget.index),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.done) {
                                          return Column(
                                            children: [
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Text(
                                                'Episodes:',
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              ListView.builder(
                                                  itemCount: (snapshot.data!
                                                          as List<
                                                              EpisodesModel>)
                                                      .length,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  itemBuilder:
                                                      (context, index) {
                                                    var item = (snapshot.data!
                                                            as List<
                                                                EpisodesModel>)[
                                                        index];
                                                    return Card(
                                                      color: Colors.lightGreen,
                                                      child: ListTile(
                                                        title: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(item.name),
                                                            Text(
                                                                'Air Date: ${item.airDate}')
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                            ],
                                          );
                                        } else {
                                          return Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            ],
                                          );
                                        }
                                      })
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
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }
}
