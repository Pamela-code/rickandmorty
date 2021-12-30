import 'package:flutter/material.dart';
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
    return SingleChildScrollView(
      child: Container(
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
            Container(
              margin: const EdgeInsets.only(
                top: 30,
                left: 40,
                right: 40,
              ),
              child: FutureBuilder<List<CharacterModel>>(
                future: CharacterService().getCharacters(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
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

                        // FutureBuilder(
                        //     future: CharacterService()
                        //         .getCharactersEpisodes(widget.index),
                        //     builder: (context, snapshot) {
                        //       if (snapshot.connectionState ==
                        //           ConnectionState.done) {
                        //         return ListView.builder(
                        //           itemCount: snapshot.data![widget.index].length,
                        //             itemBuilder: (context, index) {
                        //           return ListTile(
                        //             title: Text(snapshot.data!['name']),
                        //           );
                        //         });
                        //       } else {
                        //         return Column(
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           children: const [
                        //             Center(
                        //               child: CircularProgressIndicator(),
                        //             ),
                        //           ],
                        //         );
                        //       }
                        //     })
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
          ],
        ),
      ),
    );
  }
}
