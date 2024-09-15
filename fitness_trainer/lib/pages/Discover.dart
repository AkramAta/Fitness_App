import 'package:finalproject/Component/Build_ContainerWith_Border.dart';
import 'package:finalproject/Component/Build_Container_%20with_Fixed_width_hieght.dart';
import 'package:finalproject/Component/Button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Component/Colors.dart';
import '../Component/buid_container.dart';
import '../Component/Title.dart';
import '../Models/ExercisesData/ExercisesDatabase.dart';
import 'Exercise_Screen.dart';

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  final List<String> workout = ["biceps", "triceps", "chest", "back", "legs", "core"];
  final List<String> buttons_TxT = ["Beginner", "Intermediate", "Advanced"];
  final List<bool> IsChecked = [true, false, false]; // Default to "Beginner" selected

  String selectedLevel = "beginner"; // Default level
  String selectedMuscle = "biceps"; // Default muscle group
  List<Map> List_Data = [];
  List<Map> bookmarkedExercises = [];

  @override
  void initState() {
    super.initState();
    loadWorkoutData(selectedLevel); // Load beginner data by default
    loadBookmarkedExercises(); // Load bookmarked exercises
  }

  void loadWorkoutData(String level) {
    setState(() {
      selectedLevel = level.toLowerCase(); // Update the selected level
      loadMuscleData(selectedMuscle); // Load exercises for default muscle group (biceps)
    });
  }

  void loadMuscleData(String muscleGroup) {
    setState(() {
      List_Data = []; // Reset the exercise list

      // Find the selected level's data in the ExercisesDatabase
      var levelData = ExercisesDatabase.firstWhere(
        (item) => item.containsKey(selectedLevel),
        orElse: () => <String, Object>{},
      );

      if (levelData.isNotEmpty && levelData[selectedLevel] != null) {
        var selectedLevelData = levelData[selectedLevel] as Map<String, dynamic>;

        var muscleGroupData = (selectedLevelData["workout"] as List<dynamic>).firstWhere(
          (muscle) => (muscle as Map<String, dynamic>).containsKey(muscleGroup),
          orElse: () => <String, Object>{},
        );

        if (muscleGroupData.isNotEmpty && muscleGroupData[muscleGroup] != null) {
          var exercises = muscleGroupData[muscleGroup]['exercises'] as List<dynamic>;
          String muscleImage = muscleGroupData[muscleGroup]['image'] ?? "assets/Image/default_image.jpeg";

          for (var exercise in exercises) {
            List_Data.add({
              "name": exercise['name'] ?? "Unknown Exercise",
              "instructions": exercise['instructions'] ?? "No instructions",
              "equipment": exercise['equipment'] ?? "No equipment",
              "exerciseImage": exercise['image'] ?? "assets/Image/default_image.jpeg",
              "muscleImage": muscleImage,
            });
          }
        }
      }
    });
  }

  Future<void> saveBookmarkedExercises() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> bookmarkNames = bookmarkedExercises
        .where((exercise) => exercise['name'] != null)
        .map((exercise) => exercise['name'].toString())
        .toList();
    await prefs.setStringList('bookmarkedExercises', bookmarkNames);
  }

  Future<void> loadBookmarkedExercises() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedBookmarks = prefs.getStringList('bookmarkedExercises') ?? [];
    setState(() {
      bookmarkedExercises = List_Data.where((exercise) => savedBookmarks.contains(exercise['name'])).toList();
    });
  }

  void toggleExerciseBookmark(Map exercise) {
    setState(() {
      if (isExerciseBookmarked(exercise)) {
        bookmarkedExercises.remove(exercise);
      } else {
        bookmarkedExercises.add(exercise);
      }
      saveBookmarkedExercises();
    });
  }

  bool isExerciseBookmarked(Map exercise) {
    return bookmarkedExercises.any((e) => e['name'] == exercise['name']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(int.parse(Black)),
        title: titles(txt: "Discover Workouts", txt_color: Colors.white, Font_size: 30),
      ),
      body: buildContainer(
        backgroundColor: Color(int.parse(Black)),
        padding_All_direction: 15,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            _buildLevelSelection(),
            _buildMuscleList(), // Added this to show muscle groups
            _buildExerciseList(),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkoutSection() {
    return buildContainerWith_Fixed_Widhth_Height(
      width: double.infinity,
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: List_Data.length,
        itemBuilder: (context, index) {
          String exerciseName = List_Data[index]["name"] ?? "Unknown";
          String exerciseImage = List_Data[index]["exerciseImage"] ?? "assets/Image/default_image.jpeg";
          String muscleImage = List_Data[index]["muscleImage"] ?? "assets/Image/default_image.jpeg";

          return Row(
            children: [
              _buildWorkoutStack(muscleImage, exerciseImage, exerciseName),
              SizedBox(width: 20),
            ],
          );
        },
      ),
    );
  }

  Widget _buildWorkoutStack(String muscleImage, String exerciseImage, String title) {
    return Stack(
      children: [
        Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: AssetImage(muscleImage), fit: BoxFit.fill),
          ),
        ),
        Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [Colors.black.withOpacity(0.5), Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titles(txt: title, Font_size: 25),
                IconButton(
                  onPressed: () {},
                  icon: FaIcon(FontAwesomeIcons.bookmark, color: Color(int.parse(White))),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLevelSelection() {
    return Column(
      children: [
        buildContainerWith_Fixed_Widhth_Height(
          width: double.infinity,
          height: 65,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (int i = 0; i < buttons_TxT.length; i++)
                buildContainerWithBorder(
                  child: buttons(
                    Font_size: 20,
                    text: buttons_TxT[i],
                    action: () {
                      setState(() {
                        for (int j = 0; j < IsChecked.length; j++) {
                          IsChecked[j] = false;
                        }
                        IsChecked[i] = true;
                        loadWorkoutData(buttons_TxT[i]);
                      });
                    },
                    colour: IsChecked[i] ? Color(int.parse(Purple)) : Colors.transparent,
                  ),
                  borderWidth: 1,
                  borderColor: Color(int.parse(Purple)),
                  borderRadius: 40,
                  Margin_top_and_bottom: 0,
                ),
            ],
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildMuscleList() {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: workout.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedMuscle = workout[index]; // Set selected muscle
                loadMuscleData(selectedMuscle); // Load exercises for that muscle
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: selectedMuscle == workout[index] ? Colors.purple : Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  workout[index].toUpperCase(),
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildExerciseList() {
    return Expanded(
      child: ListView.builder(
        itemCount: List_Data.length,
        itemBuilder: (context, i) {
          String exerciseName = List_Data[i]["name"] ?? "Unknown";
          String exerciseImage = List_Data[i]["exerciseImage"] ?? "assets/Image/default_image.jpeg";

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExerciseScreen(
                    muscleGroup: selectedMuscle,
                    exercises: ExercisesDatabase[0][selectedLevel]["workout"]
                        .firstWhere((element) => element.containsKey(selectedMuscle))[selectedMuscle]["exercises"],
                  ),
                ),
              );
            },
            child: Stack(
              children: [
                _buildExerciseItem(exerciseImage, exerciseName),
                _buildGradientOverlay(exerciseName),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildExerciseItem(String imagePath, String exerciseName) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _buildGradientOverlay(String exerciseName) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [Colors.black.withOpacity(0.5), Colors.transparent],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titles(txt: exerciseName.toUpperCase(), Font_size: 25),
            IconButton(
              onPressed: () {
                toggleExerciseBookmark(List_Data.firstWhere((exercise) => exercise['name'] == exerciseName));
              },
              icon: FaIcon(
                isExerciseBookmarked(List_Data.firstWhere((exercise) => exercise['name'] == exerciseName))
                    ? FontAwesomeIcons.solidBookmark
                    : FontAwesomeIcons.bookmark,
                color: Color(int.parse(White)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
