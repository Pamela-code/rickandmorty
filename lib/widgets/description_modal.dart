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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 15, left: 15),
            child: const Text(
              'About the Character',
              style: TextStyle(
                fontSize: 25,
                color: Colors.green,
                fontWeight: FontWeight.w700,
              ),
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
                      Text(
                        snapshot.data![widget.index].species,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontSize: 18,
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
    );
  }
}
