import 'package:flutter/material.dart';
import 'package:manc_dictionary/service/dictionary_service.dart';
import 'package:manc_dictionary/view/widgets/entry_form_widget.dart';

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

    DictionaryService().addEntry(phrase, definition, example);

    _phraseController.clear();
    _definitionController.clear();
    _exampleController.clear();
    if (mounted) Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _phraseController.dispose();
    _definitionController.dispose();
    _exampleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return EntryFormWidget(
      phraseController: _phraseController,
      definitionController: _definitionController,
      exampleController: _exampleController,
      onPressed: _addEntry,
    );
  }
}
