import 'package:flutter/material.dart';

class ExerciseDetailScreen extends StatelessWidget {
  final Map exercise;

  ExerciseDetailScreen({required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(exercise['name'] ?? 'Exercise Detail'),
      ),
      body: SingleChildScrollView( // Added scrollable view
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 250, // Set a fixed height for the image
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(exercise['image'] ?? 'Assets/Image/default_image.jpeg'),
                  fit: BoxFit.cover, // Make the image cover the container
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              exercise['name'] ?? "Unknown Exercise",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87, // Enhanced text color
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Equipment: ${exercise['equipment'] ?? 'No equipment'}",
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            SizedBox(height: 10),
            Divider(), // Add a divider between sections
            SizedBox(height: 10),
            Text(
              "Instructions",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            Text(
              exercise['instructions'] ?? 'No instructions available.',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
