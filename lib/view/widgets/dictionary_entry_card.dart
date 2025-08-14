import 'package:flutter/material.dart';
import 'package:manc_dictionary/models/dictionary_entry/dictionary_entry.dart';
import 'package:manc_dictionary/service/dictionary_service.dart';
import 'package:manc_dictionary/view/widgets/edit_entry_widget.dart';

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
      direction: DismissDirection.horizontal,
      background: Container(
        color: Colors.blueAccent,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.edit, color: Colors.white),
      ),
      secondaryBackground: Container(
        color: Colors.redAccent,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          _showDeleteConfirmationDialog(
            context,
            entry.phrase,
            () async {
              await DictionaryService().deleteEntry(id);
              if (!context.mounted) return;
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Entry deleted')),
              );
            },
          );
        } else if (direction == DismissDirection.startToEnd) {
          _showEditEntryDialog(
            context,
            entry.phrase,
            entry.definition,
            (phrase, definition, example) {
              DictionaryService().updateEntry(id, phrase, definition, example);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Entry updated')),
              );
            },
          );
          return null;
        }
        return null;
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

  void _showDeleteConfirmationDialog(
    BuildContext context,
    String phrase,
    Function onDelete,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Entry'),
        content: Text('Are you sure you want to delete phrase "$phrase"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              onDelete();
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _showEditEntryDialog(
    BuildContext context,
    String initialPhrase,
    String initialDefinition,
    Function(String, String, String) onSave,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Entry'),
        content: EditEntryWidget(
          initialPhrase: initialPhrase,
          initialDefinition: initialDefinition,
          onSave: onSave,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
