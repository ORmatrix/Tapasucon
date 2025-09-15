import 'package:flutter/material.dart';
import 'package:tapasucon/main/models/database_helper.dart';

class Note {
  final int? id;
  final String title;
  final String content;

  Note({this.id, required this.title, required this.content});

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'content': content};
  }
}

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  List<Note> _notes = [];

  final List<Color> cardColors = [
    Color(0xFFFFF9C4),
    Color(0xFFC8E6C9),
    Color(0xFFBBDEFB),
    Color(0xFFFFCDD2),
    Color(0xFFD1C4E9),
    Color(0xFFFFE0B2),
  ];

  @override
  void initState() {
    super.initState();
    _refreshNotes();
  }

  Future<void> _refreshNotes() async {
    final notesData = await _databaseHelper.getNotes();
    setState(() {
      _notes = notesData
          .map((note) =>
          Note(id: note['id'], title: note['title'], content: note['content']))
          .toList();
    });
  }

  Future<void> _addOrUpdateNote([Note? note]) async {
    final titleController = TextEditingController(text: note?.title);
    final contentController = TextEditingController(text: note?.content);

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.all(16),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text(note == null ? "Add Note" : "Edit Note",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue)),
              SizedBox(height: 12),
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              SizedBox(height: 8),
              TextField(
                controller: contentController,
                maxLines: 4,
                decoration: InputDecoration(labelText: 'Content'),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Cancel")),
                  ElevatedButton(
                      onPressed: () async {
                        final newNote = Note(
                          id: note?.id,
                          title: titleController.text,
                          content: contentController.text,
                        );
                        if (note == null) {
                          await _databaseHelper.insertNote(newNote.toMap());
                        } else {
                          await _databaseHelper.updateNote(newNote.toMap());
                        }
                        Navigator.pop(context);
                        _refreshNotes();
                      },
                      child: Text("Save"))
                ],
              )
            ]),
          ),
        );
      },
    );
  }

  void _deleteNote(int id) async {
    await _databaseHelper.deleteNote(id);
    _refreshNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notepad",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addOrUpdateNote(),
        child: Icon(Icons.add, size: 28),
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      body: _notes.isEmpty
          ? Center(
        child: Text(
          "No notes yet.\nTap + to add one!",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.grey[600]),
        ),
      )
          : ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: _notes.length,
        itemBuilder: (context, index) {
          final note = _notes[index];
          final color = cardColors[index % cardColors.length];

          return TweenAnimationBuilder(
            duration: Duration(milliseconds: 500 + (index * 100)),
            tween: Tween<double>(begin: 0, end: 1),
            builder: (context, double value, child) => Opacity(
              opacity: value,
              child: Transform.translate(
                  offset: Offset(0, 30 * (1 - value)), child: child),
            ),
            child: Card(
              color: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                contentPadding:
                EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                title: Text(note.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18)),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Text(note.content,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 15)),
                ),
                onTap: () => _addOrUpdateNote(note),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _deleteNote(note.id!),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
