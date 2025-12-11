import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:manc_dictionary/models/dictionary_entry/dictionary_entry.dart';
import 'package:manc_dictionary/service/dictionary_service.dart';
import 'package:manc_dictionary/view/widgets/dictionary_entry_card.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class DictionaryList extends StatefulWidget {
  final String searchQuery;
  final ItemScrollController itemScrollController;

  const DictionaryList({
    super.key,
    required this.searchQuery,
    required this.itemScrollController,
  });

  @override
  State<DictionaryList> createState() => _DictionaryListState();
}

class _DictionaryListState extends State<DictionaryList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('dictionaryEntries').orderBy('phrase').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Oops! Something went wrong: ${snapshot.error}'));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final List<DocumentSnapshot> documents = snapshot.data!.docs;
        final filteredDocs = DictionaryService().filterDocuments(documents, widget.searchQuery);
        if (filteredDocs.isEmpty) {
          return const Center(child: Text('No dictionary entries found!'));
        }
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusScope.of(context).unfocus(),
          child: ScrollablePositionedList.builder(
            itemScrollController: widget.itemScrollController,
            itemCount: filteredDocs.length,
            padding: const EdgeInsets.only(bottom: 90),
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
    );
  }
}
