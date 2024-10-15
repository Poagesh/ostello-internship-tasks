import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class SchedulePage extends ConsumerWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule Page'),
      ),
      body: Center(child: Text('Schedule Page Content')),
    );
  }
}
