import 'package:flutter/material.dart';

class FilterContainer extends StatefulWidget {
  const FilterContainer({Key? key}) : super(key: key);

  @override
  _FilterContainerState createState() => _FilterContainerState();
}

class _FilterContainerState extends State<FilterContainer> {
  List<String> allFilters = ['Verified', 'Popularity', 'Rating', 'Resent', 'Subject'];
  List<String> selectedFilters = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.transparent),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return ListView(
                    padding: const EdgeInsets.all(16.0),
                    children: allFilters.map((filter) {
                      return CheckboxListTile(
                        title: Text(filter),
                        value: selectedFilters.contains(filter),
                        onChanged: (bool? isSelected) {
                          setState(() {
                            if (isSelected == true) {
                              selectedFilters.add(filter);
                            } else {
                              selectedFilters.remove(filter);
                            }
                          });
                          Navigator.pop(context);
                        },
                      );
                    }).toList(),
                  );
                },
              );
            },
            icon: const Icon(Icons.filter_list, size: 20),
            label: const Text(
              'Filters',
              style: TextStyle(fontSize: 14),
            ),
          ),
          const SizedBox(width: 10),

          
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: selectedFilters.map((filter) {
                  return Row(
                    children: [
                      Chip(
                        label: Text(filter),
                        deleteIcon: const Icon(Icons.close, size: 18),
                        onDeleted: () {
                          setState(() {
                            selectedFilters.remove(filter); 
                          });
                        },
                      ),
                      const SizedBox(width: 8),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
