import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewEntryWidget extends StatefulWidget {
  const NewEntryWidget({super.key});

  @override
  State<NewEntryWidget> createState() => _NewEntryWidgetState();
}

class _NewEntryWidgetState extends State<NewEntryWidget> {
  final TextEditingController _phraseController = TextEditingController();
  final TextEditingController _definitionController = TextEditingController();
  final TextEditingController _exampleController = TextEditingController();

  Future<void> _addEntry() async {
    final phrase = _phraseController.text.trim();
    final definition = _definitionController.text.trim();
    final example = _exampleController.text.trim();
    if (phrase.isEmpty || definition.isEmpty) return;

    await FirebaseFirestore.instance.collection('dictionaryEntries').add({
      'phrase': phrase,
      'definition': definition,
      'example': example,
    });

    _phraseController.clear();
    _definitionController.clear();
    _exampleController.clear();
    if (mounted) Navigator.of(context).pop();
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
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(labelText: 'Phrase'),
              autofocus: true,
              maxLines: null,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _definitionController,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(labelText: 'Definition'),
              maxLines: null,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _exampleController,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(labelText: 'Example (optional)'),
              maxLines: null,
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
