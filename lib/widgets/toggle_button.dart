import 'package:flutter/material.dart';

class CourseToggleButton extends StatefulWidget {
  const CourseToggleButton({Key? key}) : super(key: key);

  @override
  _CourseToggleButtonState createState() => _CourseToggleButtonState();
}

class _CourseToggleButtonState extends State<CourseToggleButton> {
  bool isFreeCourses = true; // By default, show Free Courses

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.transparent),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Free Courses Button
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isFreeCourses = true;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isFreeCourses ? Colors.black : Colors.grey[300],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Text(
                    'Free Courses',
                    style: TextStyle(
                      color: isFreeCourses ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Paid Courses Button
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isFreeCourses = false;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: !isFreeCourses ? Colors.black : Colors.grey[300],
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Text(
                    'Paid Courses',
                    style: TextStyle(
                      color: !isFreeCourses ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
