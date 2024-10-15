import 'package:flutter_riverpod/flutter_riverpod.dart';

// Class Selection State Provider
final classSelectionProvider = StateProvider<String>((ref) {
  return "12th IIT JEE";
});

// Tab Selection (Free / Paid Courses) State Provider
final courseTypeProvider = StateProvider<bool>((ref) {
  return true; // true -> Free Courses, false -> Paid Courses
});

// A Riverpod provider to manage the user's coin count
final coinProvider = StateProvider<int>((ref) => 300);
// A StateProvider for the selected index of BottomNavigationBar
final bottomNavBarIndexProvider = StateProvider<int>((ref) => 0);
