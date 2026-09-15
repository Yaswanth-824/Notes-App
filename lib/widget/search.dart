import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:learning/models/notes_model.dart';
import 'package:learning/notes/edit_note.dart';

class Search extends SearchDelegate<NoteModel> {
  final Box<NoteModel> searchNotes;

  Search({required this.searchNotes});

  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => "Search....";

  @override
  String get query => super.query;

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear_rounded),
        onPressed: () {
          query = "";
          // Do something to check it
        },
      ),
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    print("query : $query");
    List<NoteModel> search = [];
    for (int index = 0; index < searchNotes.length; index++) {
      final note = searchNotes.getAt(index)!;
      if (note.title!.trim().toLowerCase().contains(query) ||
          note.description.trim().toLowerCase().contains(query)) {
        search.add(note);
      }
    }
    if (query.isEmpty) {
      return Center(child: Text("No results found"));
    }
    return ListView.builder(
      itemCount: search.length,
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: BoxBorder.all(color: Colors.white),
          borderRadius: BorderRadiusGeometry.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              search[index].title!,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(),
            Text(
              search[index].description,
              style: TextStyle(),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    List<NoteModel> search = [];
    for (int index = 0; index < searchNotes.length; index++) {
      final note = searchNotes.getAt(index)!;
      if (note.title!.trim().toLowerCase().contains(query) ||
          note.description.trim().toLowerCase().contains(query)) {
        search.add(note);
      }
    }
    if (query.isEmpty) {
      return Center(child: Text("No results found"));
    }
    return ListView.builder(
      itemCount: search.length,
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: BoxBorder.all(color: Colors.white),
          borderRadius: BorderRadiusGeometry.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    search[index].title!,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.open_in_full),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EditNote(note: search[index], readOnly: true),
                      ),
                    );
                  },
                ),
              ],
            ),
            Divider(),
            Text(
              search[index].description,
              style: TextStyle(),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
