import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class ContentPage extends ConsumerWidget {
  const ContentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Content Page'),
      ),
      body: Center(child: Text('Content Page Content')), 
    );
  }
}
