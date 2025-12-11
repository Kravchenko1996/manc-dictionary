import 'package:flutter/material.dart';
import 'package:manc_dictionary/view/widgets/dictionary_list.dart';
import 'package:manc_dictionary/view/widgets/new_entry_widget.dart';
import 'package:manc_dictionary/view/widgets/search_field.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({super.key});

  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ItemScrollController _itemScrollController = ItemScrollController();

  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manc Dictionary'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: SearchField(
            controller: _searchController,
            onChanged: (value) {
              setState(() {
                _searchQuery = value.trim().toLowerCase();
              });
            },
          ),
        ),
      ),
      body: DictionaryList(searchQuery: _searchQuery, itemScrollController: _itemScrollController),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddEntryDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddEntryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('New Dictionary Entry'),
        content: NewEntryWidget(),
      ),
    ).then((index) {
      _itemScrollController.scrollTo(index: index, duration: Duration(milliseconds: 300));
    });
  }
}
