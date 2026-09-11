// lib/core/utils/fuzzy_city.dart
// Simple fuzzy city search utility used by WeatherController.
// This implementation provides a lightweight, case‑insensitive substring
// matching for a list of city names. It can be replaced with a more
// sophisticated fuzzy‑matching package (e.g., `fuzzy` or `rapidfuzz`) if
// needed in the future.

/// A sample list of city names. In a real app this could be loaded from
/// an asset file or a remote source.
final List<String> _cityDatabase = [
  'New Delhi',
  'Mumbai',
  'Kolkata',
  'Chennai',
  'Bengaluru',
  'Hyderabad',
  'Pune',
  'Ahmedabad',
  'Jaipur',
  'Lucknow',
  'Kanpur',
  'Nagpur',
  'Surat',
  'Kochi',
  'Visakhapatnam',
  'Indore',
  'Thane',
  'Bhopal',
  'Patna',
  'Ludhiana'
];

/// Returns a list of city suggestions based on [query].
/// The search is case‑insensitive and matches any city containing the
/// query as a substring. If [query] is empty, an empty list is returned.
List<String> fuzzyCitySearch(String query) {
  if (query.isEmpty) return [];
  final lower = query.toLowerCase();
  return _cityDatabase.where((c) => c.toLowerCase().contains(lower)).toList();
}
