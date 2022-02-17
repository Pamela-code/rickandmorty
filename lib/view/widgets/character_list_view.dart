import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rickandmorty/controller/character_controller.dart';
import 'package:rickandmorty/view/widgets/description_modal.dart';

class CharacterList extends StatefulWidget {
  const CharacterList({Key? key, required this.snapshot}) : super(key: key);
  final AsyncSnapshot snapshot;

  @override
  _CharacterListState createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  final controller = CharacterController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Characters',
          style: TextStyle(
            fontSize: 25,
            color: Colors.green,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: Observer(builder: (_) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: widget.snapshot.data!.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    ListTile(
                      leading: ClipOval(
                        child:
                            Image.network(widget.snapshot.data![index].image),
                      ),
                      title: Text(
                        widget.snapshot.data![index].name,
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
                        },
                      ),
                    ),
                  ],
                );
              },
            );
          }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Observer(builder: (_) {
                return ElevatedButton(
                  onPressed: () {
                    controller.previousPage();
                    controller.getCharacters(controller.actualPage);
                  },
                  child: const Text(
                    'Previous',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Observer(builder: (_) {
                return ElevatedButton(
                  onPressed: () {
                    controller.nextPage();
                    controller.getCharacters(controller.actualPage);
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                );
              }),
            ),
          ],
        )
      ],
    );
  }
}
