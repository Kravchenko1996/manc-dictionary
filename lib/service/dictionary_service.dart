import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manc_dictionary/models/dictionary_entry/dictionary_entry.dart';

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

  Future<DictionaryEntry?> getWordOfTheDay() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection('dictionaryEntries').get();
      if (snapshot.docs.isNotEmpty) {
        final randomIndex = Random().nextInt(snapshot.docs.length);
        final randomDoc = snapshot.docs[randomIndex];
        final data = randomDoc.data();
        // Assuming your DictionaryEntry.fromJson can handle this structure
        return DictionaryEntry.fromJson({
          'phrase': data['phrase'] ?? 'No Phrase',
          'definition': data['definition'] ?? 'No Definition',
          'example': data['example'] ?? '',
        });
      }
      return null; // No documents found
    } catch (e) {
      // Log the error or handle it as needed
      print('Error fetching word of the day: $e');
      return null; // Error occurred
    }
  }
}
