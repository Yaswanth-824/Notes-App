import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:learning/models/notes_model.dart';
import 'package:learning/notes/add_note.dart';
import 'package:learning/widget/notes_card.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>("user_notes");
  await Hive.openBox<NoteModel>("deleted_notes");
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(
          0xFF121212,
        ), // Match your dark background
        canvasColor: const Color(0xFF121212),
        colorScheme: const ColorScheme.dark(surface: Color(0xFF121212)),
      ),
      home: Home(),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF121212),
        canvasColor: const Color(0xFF121212),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<NoteModel> allNotes = [];
  Box<NoteModel> get notesBox => Hive.box<NoteModel>("user_notes");
  Box<NoteModel> get deletedBox => Hive.box<NoteModel>("deleted_notes");
  bool isLoading = true;
  late bool isSeachEnabled;
  @override
  void initState() {
    super.initState();
    _getAllNotes();
    isLoading = false;
    isSeachEnabled = false;
  }

  void _getAllNotes() {
    allNotes = notesBox.values.toList();
  }

  Future<void> _deleteNote(int index, NoteModel note) async {
    await notesBox.deleteAt(index);
    await deletedBox.add(note);

    if (mounted) {}
  }

  Future<void> _reAddNote(int index, NoteModel note) async {
    await deletedBox.deleteAt(index);
    await notesBox.add(note);

    if (mounted) {}
  }

  Future<void> _permanetlyDeleteNote(int index) async {
    await deletedBox.deleteAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Color(0xFF1E1E1E),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu, color: Colors.white),
        ),
        title: Text(
          "My Notes",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              setState(() {
                isSeachEnabled = !isSeachEnabled;
              });
            },
          ),
        ],
      ),

      body: isLoading
          ? Center(child: CircularProgressIndicator(color: Color(0xFF80CBC4)))
          : Column(
              children: [
                isSeachEnabled
                    ? Text("Search Enabled")
                    : Text("Seach Desabled"),
                Text(
                  "All Notes.. [<- to delete]",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ValueListenableBuilder(
                    valueListenable: notesBox.listenable(),
                    builder: (context, Box<NoteModel> box, _) {
                      return ListView.builder(
                        itemCount: box.length,
                        itemBuilder: (context, index) {
                          final note = box.getAt(index)!;
                          return Dismissible(
                            key: Key(note.id!),
                            direction: DismissDirection.endToStart,
                            onDismissed: (direction) => setState(() {
                              _deleteNote(index, note);
                            }),
                            background: Container(
                              color: Colors.white,
                              child: Icon(Icons.delete),
                            ),
                            child: NoteCard(
                              note: note,
                              isEditable: true,
                              permanenetDelete: () =>
                                  _permanetlyDeleteNote(index),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Text(
                  "Deleted Notes... [-> to add]",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ValueListenableBuilder(
                    valueListenable: deletedBox.listenable(),
                    builder: (context, Box<NoteModel> box, _) {
                      print("deleted Notes :${box.length}");
                      return ListView.builder(
                        itemCount: box.length,
                        itemBuilder: (context, index) {
                          final note = box.getAt(index)!;
                          return Dismissible(
                            key: Key(note.id!),
                            direction: DismissDirection.startToEnd,
                            onDismissed: (direction) => setState(() {
                              _reAddNote(index, note);
                            }),
                            child: NoteCard(
                              note: note,
                              isEditable: false,
                              permanenetDelete: () =>
                                  _permanetlyDeleteNote(index),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final NoteModel? newNote = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddNote()),
          );
          if (newNote!.title == null) {
            newNote.title = newNote.description[3];
            print("title : ${newNote.title}");
          }
          await notesBox.add(newNote);
          setState(() {});
        },
        backgroundColor: const Color(0xFF80CBC4),
        shape:
            const CircleBorder(), // Or RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
        child: const Icon(Icons.add, size: 24, color: Colors.black),
      ),
    );
  }
}
