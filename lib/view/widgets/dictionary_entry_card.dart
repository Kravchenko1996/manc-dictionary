import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:manc_dictionary/models/dictionary_entry/dictionary_entry.dart';

class DictionaryEntryCard extends StatelessWidget {
  const DictionaryEntryCard({
    super.key,
    required this.id,
    required this.entry,
  });

  final String id;
  final DictionaryEntry entry;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.redAccent,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) async {
        await FirebaseFirestore.instance.collection('dictionaryEntries').doc(id).delete();
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Entry deleted')),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              entry.phrase,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              entry.definition,
              style: const TextStyle(fontSize: 16),
            ),
            if (entry.example != null && entry.example!.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                'Example: ${entry.example}',
                style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
