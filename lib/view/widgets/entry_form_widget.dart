import 'package:flutter/material.dart';

class EntryFormWidget extends StatelessWidget {
  const EntryFormWidget({
    super.key,
    required this.phraseController,
    required this.definitionController,
    required this.exampleController,
    required this.onPressed,
  });

  final TextEditingController phraseController;
  final TextEditingController definitionController;
  final TextEditingController exampleController;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: phraseController,
                  decoration: const InputDecoration(labelText: 'Phrase'),
                  textCapitalization: TextCapitalization.sentences,
                  autofocus: true,
                  minLines: 1,
                  maxLines: 5,
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: definitionController,
                  decoration: const InputDecoration(labelText: 'Definition'),
                  textCapitalization: TextCapitalization.sentences,
                  minLines: 1,
                  maxLines: 5,
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: exampleController,
                  decoration: const InputDecoration(labelText: 'Example (optional)'),
                  textCapitalization: TextCapitalization.sentences,
                  minLines: 1,
                  maxLines: 5,
                ),
                const SizedBox(height: 16),
                OutlinedButton(
                  onPressed: onPressed,
                  child: const Text('Save Changes'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
