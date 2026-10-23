import 'dart:convert';
import 'dart:io';

/// Synthetic test data in the server's response shape, not a live route result.
Map<String, dynamic> routeResponseJson() => jsonDecode(
  File('test/fixtures/route_search_response.json').readAsStringSync(),
) as Map<String, dynamic>;
