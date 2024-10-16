import 'package:flutter/material.dart';

class CategoryContainer extends StatelessWidget {
  final String imagePath;
  final String buttonText;
  final VoidCallback onPressed;

  const CategoryContainer({
    Key? key,
    required this.imagePath,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Rounded corners
        ),
        elevation: 4, // Add shadow effect
        child: Container(
          width: 95,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white, // Background color
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                buttonText,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
