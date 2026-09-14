import 'package:flutter/material.dart';
import 'package:learning/models/notes_model.dart';
import 'package:learning/notes/edit_note.dart';

class NoteCard extends StatelessWidget {
  NoteCard({
    super.key,
    required this.note,
    required this.isEditable,
    required this.permanentDelete,
  });
  final NoteModel note;
  final Icon deleteIcon = Icon(Icons.delete);
  final Icon editIcon = Icon(Icons.edit);
  final bool isEditable;
  final VoidCallback permanentDelete;
  Widget deleteAction() {
    return IconButton(
      onPressed: () {
        permanentDelete();
      },
      icon: deleteIcon,
    );
  }

  Widget editAction(BuildContext context, NoteModel note) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditNote(note: note)),
        );
      },
      icon: editIcon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF1E1E1E),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                note.title!,
                overflow: TextOverflow.ellipsis,

                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),

              Expanded(
                child: isEditable ? editAction(context, note) : deleteAction(),
              ),
            ],
          ),
          const Divider(color: Color(0xFF121212)),
          // Description
          Text(
            // "Your goal is to build the complete, multi-card homepage for your Notes app, based on the specific layout parameters we've already defined. This is a crucial step for managing lists of data.",
            note.description,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          Align(
            alignment: AlignmentGeometry.bottomRight,
            child: Text(
              note.date,
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
          // Date
        ],
      ),
    );
  }
}
