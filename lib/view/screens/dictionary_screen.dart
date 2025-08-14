import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:manc_dictionary/service/dictionary_service.dart';
import 'package:manc_dictionary/view/widgets/new_entry_widget.dart';
import 'package:manc_dictionary/models/dictionary_entry/dictionary_entry.dart';
import 'package:manc_dictionary/view/widgets/dictionary_entry_card.dart';
import 'package:manc_dictionary/view/widgets/search_field.dart';

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({super.key});

  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  final TextEditingController _searchController = TextEditingController();
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
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('dictionaryEntries').orderBy('phrase').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Oops! Something went wrong: ${snapshot.error}'));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            final List<DocumentSnapshot> documents = snapshot.data!.docs;
            final filteredDocs = DictionaryService().filterDocuments(documents, _searchQuery);
            if (filteredDocs.isEmpty) {
              return const Center(child: Text('No dictionary entries found!'));
            }
            return Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: ListView.builder(
                itemCount: filteredDocs.length,
                itemBuilder: (context, index) {
                  final doc = filteredDocs[index];
                  final data = doc.data() as Map<String, dynamic>;
                  final entry = DictionaryEntry.fromJson({
                    'phrase': data['phrase'] ?? 'No Phrase',
                    'definition': data['definition'] ?? 'No Definition',
                    'example': data['example'] ?? '',
                  });
                  return DictionaryEntryCard(
                    id: doc.id,
                    entry: entry,
                  );
                },
              ),
            );
          },
        ),
      ),
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
