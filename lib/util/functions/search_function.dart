List<Map<String, dynamic>> updateSearch(String query, List<Map<String, dynamic>> searchList) {
  String searchQuery = query.toLowerCase().replaceAll(RegExp(r'\s+'), '');

  return searchList.where((item) {
    return item.values.any((value) {
      final stringValue = value.toString().toLowerCase().replaceAll(RegExp(r'\s+'), '');
      // Fuzzy subset check: all characters of query must exist in the value string
      return searchQuery.split('').every((char) => stringValue.contains(char));
    });
  }).toList();
}
