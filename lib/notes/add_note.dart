import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learning/models/notes_model.dart';

// void main() {
//   runApp(MaterialApp(home: AddNote()));
// }

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }

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
        title: Text(
          "New Note",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        backgroundColor: Color(0xFF121212),
        actions: [
          ElevatedButton(
            onPressed: () {
              String title = _titleController.text.trim();
              title = title.isEmpty ? "Untitled" : title;
              String description = _descriptionController.text.trim();
              NoteModel newNote = NoteModel(
                title: title,
                description: description,
                date: DateFormat('MMM dd, yyyy').format(DateTime.now()),
              );

              // dispose();
              Navigator.pop(context, newNote);
            },
            child: Text(
              "Save",
              style: TextStyle(
                color: Color(0xFF80CBC4),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            // dispose();
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
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
