import 'package:finalproject/Component/Colors.dart';
import 'package:finalproject/Models/ExercisesData/ExercisesDatabase.dart';
import 'package:finalproject/pages/ExerciseDetailScreen.dart';
import 'package:flutter/material.dart';

class ExerciseListScreen extends StatelessWidget {
  final String muscleGroup;
  final String level;

  ExerciseListScreen({required this.muscleGroup, required this.level});

  @override
  Widget build(BuildContext context) {
    List<Map> exerciseList = [];

    // Fetch exercises from the database
    if (ExercisesDatabase.isNotEmpty) {
      var selectedLevelData = ExercisesDatabase.firstWhere(
        (levelData) => levelData.containsKey(level),
        orElse: () => <String, Object>{},
      );

      if (selectedLevelData.isNotEmpty && selectedLevelData[level] != null) {
        var workoutList = selectedLevelData[level]["workout"] as List<dynamic>;

        var muscleGroupData = workoutList.firstWhere(
          (muscle) => (muscle as Map<String, dynamic>).containsKey(muscleGroup),
          orElse: () => <String, Object>{},
        );

        if (muscleGroupData.isNotEmpty && muscleGroupData[muscleGroup] != null) {
          exerciseList = List<Map>.from(muscleGroupData[muscleGroup]['exercises']);
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: Color(int.parse(Black)),
        title: Text("$muscleGroup Exercises",
        style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Color(int.parse(Black)),
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
          itemCount: exerciseList.length,
          itemBuilder: (context, index) {
            var exercise = exerciseList[index];
        
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExerciseDetailScreen(exercise: exercise),
                  ),
                );
              },
              child: Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  leading: Image.asset(exercise['image'] ?? 'Assets/Image/default_image.jpeg'),
                  title: Text(exercise['name'] ?? "Unknown Exercise"),
                  trailing: Icon(Icons.arrow_forward),
                  subtitle: Text(exercise['equipment'] ?? "No equipment"),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
