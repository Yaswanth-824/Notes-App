import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:learning/models/notes_model.dart';
import 'package:learning/widget/notes_card.dart';

class NotesList extends StatelessWidget {
  const NotesList({
    super.key,
    required this.box,
    required this.alternateBox,
    required this.isEditable,
  });
  final Box<NoteModel> box;
  final Box<NoteModel> alternateBox;
  final bool isEditable;
  Future<void> _permanetlyDeleteNote(int index) async {
    await box.deleteAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: box.listenable(),
      builder: (context, box, _) {
        return ListView.builder(
          itemCount: box.length,
          itemBuilder: ((context, index) {
            final NoteModel note = box.getAt(index)!;
            return Dismissible(
              key: ValueKey(note.id),
              direction: DismissDirection.endToStart,
              child: NoteCard(
                note: note,
                isEditable: isEditable,
                permanentDelete: () {
                  _permanetlyDeleteNote(index);
                },
              ),
            );
          }),
        );
      },
    );
  }
}
