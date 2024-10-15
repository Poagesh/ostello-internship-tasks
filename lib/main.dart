import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ostello_app/pages/main_page.dart';


void main() {
  runApp(const ProviderScope(child: OstelloApp()));
}

class OstelloApp extends StatelessWidget {
  const OstelloApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ostello App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 16, color: Colors.black),
          titleLarge: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      home: MainScreen(),
    );
  }
}
