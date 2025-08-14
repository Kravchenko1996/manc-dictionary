import 'package:flutter/material.dart';
import 'package:manc_dictionary/view/widgets/entry_form_widget.dart';

class EditEntryWidget extends StatefulWidget {
  final String initialPhrase;
  final String initialDefinition;
  final String? initialExample;
  final void Function(String phrase, String definition, String example) onSave;

  const EditEntryWidget({
    super.key,
    required this.initialPhrase,
    required this.initialDefinition,
    this.initialExample,
    required this.onSave,
  });

  @override
  State<EditEntryWidget> createState() => _EditEntryWidgetState();
}

class _EditEntryWidgetState extends State<EditEntryWidget> {
  late TextEditingController _phraseController;
  late TextEditingController _definitionController;
  late TextEditingController _exampleController;

  @override
  void initState() {
    super.initState();
    _phraseController = TextEditingController(text: widget.initialPhrase);
    _definitionController = TextEditingController(text: widget.initialDefinition);
    _exampleController = TextEditingController(text: widget.initialExample ?? '');
  }

  @override
  void dispose() {
    _phraseController.dispose();
    _definitionController.dispose();
    _exampleController.dispose();
    super.dispose();
  }

  void _save() {
    final phrase = _phraseController.text.trim();
    final definition = _definitionController.text.trim();
    final example = _exampleController.text.trim();
    if (phrase.isEmpty || definition.isEmpty) return;
    widget.onSave(phrase, definition, example);
  }

  @override
  Widget build(BuildContext context) {
    return EntryFormWidget(
      phraseController: _phraseController,
      definitionController: _definitionController,
      exampleController: _exampleController,
      onPressed: _save,
    );
  }
}
