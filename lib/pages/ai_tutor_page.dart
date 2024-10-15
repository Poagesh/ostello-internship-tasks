import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class AiTutorPage extends ConsumerWidget {
  const AiTutorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AI Tutor Page'),
      ),
      body: Center(child: Text('AI Tutor Page Content')),

    );
  }
}
