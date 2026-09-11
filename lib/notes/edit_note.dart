import 'package:flutter/material.dart';

import 'package:learning/models/notes_model.dart';

class EditNote extends StatefulWidget {
  final NoteModel note;
  const EditNote({super.key, required this.note});

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  // creates the controller when page opened
  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _titleController.text = widget.note.title!;
    _descriptionController.text = widget.note.description;
  }

  // disposes the controller / created controller on closing
  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      appBar: AppBar(
        title: Text("Edit Note"),
        backgroundColor: Color(0xFF1E1E1E),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              widget.note.title = _titleController.text;
              widget.note.description = _descriptionController.text;
              widget.note.id = DateTime.now().microsecondsSinceEpoch.toString();
              widget.note.save();
              Navigator.pop(context);
            },
            icon: Icon(Icons.save, color: Colors.white),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              maxLength: 50,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Title with 50 chars",
                label: Text("Title"),
              ),
            ),
            // SizedBox(height: 100, child: Text("Need to add Categories Box")),
            SizedBox(
              height: 200,
              child: TextField(
                expands: true,
                controller: _descriptionController,
                keyboardType: TextInputType.multiline,
                style: TextStyle(
                  color: Colors.white,
                  overflow: TextOverflow.fade,
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Start Typing your Note hear",
                  label: Text("Description"),
                ),
                maxLines: null,
                minLines: null,
                // maxLength: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
