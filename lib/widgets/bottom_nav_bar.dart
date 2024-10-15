import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ostello_app/providers.dart'; 

class BottomNavBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
   
    final selectedIndex = ref.watch(bottomNavBarIndexProvider);

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex, 
      onTap: (index) {
        
        ref.read(bottomNavBarIndexProvider.notifier).state = index;
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Schedule',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.description),
          label: 'Content',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'Batches',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.support_agent),
          label: 'Ai Tutor',
        ),
      ],
      selectedItemColor: Colors.purple, 
      unselectedItemColor: Colors.grey, 
      showUnselectedLabels: true,       
    );
  }
}
