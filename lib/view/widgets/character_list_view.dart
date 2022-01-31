import 'package:flutter/material.dart';
import 'package:rickandmorty/view/widgets/description_modal.dart';

class CharacterList extends StatefulWidget {
  const CharacterList({Key? key, required this.snapshot}) : super(key: key);
  final snapshot;

  @override
  _CharacterListState createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
          child: ListView.builder(
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
                          }),
                    ),
                  ],
                );
              }),
        ),
      ],
    );
  }
}
