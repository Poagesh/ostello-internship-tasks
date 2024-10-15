import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ostello_app/widgets/bottom_nav_bar.dart';
import 'ai_tutor_page.dart';
import 'home_page.dart';
import 'schedule_page.dart';
import 'content_page.dart';
import 'batches_page.dart';
import 'package:ostello_app/providers.dart';

class MainScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
   
    final selectedIndex = ref.watch(bottomNavBarIndexProvider);

   
    final List<Widget> pages = [
      HomePage(),
      SchedulePage(),
      ContentPage(),
      BatchesPage(),
      AiTutorPage(),
    ];

    return Scaffold(
      body: pages[selectedIndex], 
      bottomNavigationBar: BottomNavBar(), 
    );
  }
}
