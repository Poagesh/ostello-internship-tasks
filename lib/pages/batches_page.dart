import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class BatchesPage extends ConsumerWidget {
  const BatchesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Batches Page'),
      ),
      body: Center(child: Text('Batches Page Content')),

    );
  }
}
