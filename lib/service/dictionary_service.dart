import 'package:cloud_firestore/cloud_firestore.dart';

class DictionaryService {
  List filterDocuments(List documents, String searchQuery) {
    final query = searchQuery.trim().toLowerCase();
    return documents.where((doc) {
      final data = doc.data() as Map<String, dynamic>;
      final phrase = (data['phrase'] ?? '').toString().toLowerCase();
      final definition = (data['definition'] ?? '').toString().toLowerCase();
      return phrase.contains(query) || definition.contains(query);
    }).toList();
  }

  Future<void> addEntry(String phrase, String definition, String example) async {
    await FirebaseFirestore.instance.collection('dictionaryEntries').add({
      'phrase': phrase,
      'definition': definition,
      'example': example,
    });
  }

  Future<void> deleteEntry(String id) async {
    await FirebaseFirestore.instance.collection('dictionaryEntries').doc(id).delete();
  }

  Future<void> updateEntry(
    String id,
    String phrase,
    String definition,
    String example,
  ) async {
    await FirebaseFirestore.instance.collection('dictionaryEntries').doc(id).update({
      'phrase': phrase,
      'definition': definition,
      'example': example,
    });
  }
}
