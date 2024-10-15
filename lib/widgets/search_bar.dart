import 'package:flutter/material.dart';

class SearchAndFilterBar extends StatelessWidget {
  final Function(String)? onSearchChanged; 

  const SearchAndFilterBar({Key? key, this.onSearchChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.purple.shade100, width: 1.5), 
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Search here...', 
                      border: InputBorder.none,
                    ),
                    onChanged: onSearchChanged, 
                  ),
                ),
                const Icon(Icons.search, color: Colors.purple), 
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 16),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              backgroundColor: Colors.purple,
            ),
            onPressed: () {
              // Handle the Study button press
            },
            child: const Text(
              'Study',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
