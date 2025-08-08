import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddEntryWidget extends StatefulWidget {
  const AddEntryWidget({super.key});

  @override
  State<AddEntryWidget> createState() => _AddEntryWidgetState();
}

class _AddEntryWidgetState extends State<AddEntryWidget> {
  final TextEditingController _phraseController = TextEditingController();
  final TextEditingController _meaningController = TextEditingController();

  Future<void> _addEntry() async {
    final phrase = _phraseController.text.trim();
    final meaning = _meaningController.text.trim();
    if (phrase.isEmpty || meaning.isEmpty) return;

    await FirebaseFirestore.instance.collection('dictionaryEntries').add({
      'phrase': phrase,
      'meaning': meaning,
    });

    _phraseController.clear();
    _meaningController.clear();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Entry added!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _phraseController,
              decoration: const InputDecoration(labelText: 'Phrase'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _meaningController,
              decoration: const InputDecoration(labelText: 'Meaning'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _addEntry,
              child: const Text('Add Entry'),
            ),
          ],
        ),
      ),
    );
  }
}