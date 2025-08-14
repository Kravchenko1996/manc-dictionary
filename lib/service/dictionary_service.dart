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
}