import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/local_db/local_db.dart';

class Providers {
  static Widget init(Widget child) => ProviderScope(child: child);
}




final databaseProvider = Provider<DatabaseHelper>((ref) {
  return DatabaseHelper();
});

// final loggedInUserProvider = StateProvider<String?>((ref) {
//   return null;
// });