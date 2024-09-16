import 'package:flutter/material.dart';
import '../Component/Title.dart';
import '../Component/Paragraphs.dart';
import '../Component/Colors.dart';

class ExerciseScreen extends StatelessWidget {
  final String muscleGroup;
  final List<Map> exercises;

  ExerciseScreen({required this.muscleGroup, required this.exercises});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$muscleGroup Exercises'),
        backgroundColor: Color(int.parse(Black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: exercises.length,
          itemBuilder: (context, index) {
            String exerciseName = exercises[index]["name"] ?? "Unknown Exercise";
            String exerciseInstructions = exercises[index]["instructions"] ?? "No instructions available.";
            String exerciseImage = exercises[index]["image"] ?? "assets/Image/default_image.jpeg";

            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Displaying the exercise image
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                    child: Image.asset(
                      exerciseImage,
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title of the exercise
                        titles(
                          txt: exerciseName,
                          txt_color: Color(int.parse(Black)),
                          Font_size: 20,
                        ),
                        SizedBox(height: 8),
                        // Instructions for the exercise
                        paragraph(
                          text: exerciseInstructions,
                          Font_size: 16,
                          TextAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}