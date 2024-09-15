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
import 'My_Bookmark.dart';
import 'Notification_page.dart';
import 'Profile_Setting.dart';
import 'Discover.dart';
import 'Exercise_Screen.dart';

class Home_Screen extends StatefulWidget {
  final String userid;
  Home_Screen({required this.userid});
  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  final List<String> workout = ["biceps", "triceps", "chest", "back", "legs", "core"];
  final List<String> buttons_TxT = ["Beginner", "Intermediate", "Advanced"];
  final List<bool> IsChecked = [true, false, false]; // Default to "Beginner" selected

  String selectedLevel = "beginner"; // Default level
  String selectedMuscle = "biceps"; // Default muscle group
  List<Map> List_Data = [];
  List<Map> bookmarkedExercises = [];
  int currentIndex = 0;
  String username = "akram";

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

  // Function to load exercises for a specific muscle group based on the selected level
  void loadMuscleData(String muscleGroup) {
  setState(() {
    List_Data = []; // Reset the exercise list

    // Ensure ExercisesDatabase and selected level exist
    if (ExercisesDatabase.isNotEmpty) {
      // Use firstWhere to find the correct level data or provide an empty map if not found
      var selectedLevelData = ExercisesDatabase.firstWhere(
        (levelData) => levelData.containsKey(selectedLevel),
        orElse: () => <String, Object>{}, // Providing an empty map as a fallback
      );

      // Proceed only if we have valid data for the selected level
      if (selectedLevelData.isNotEmpty && selectedLevelData[selectedLevel] != null) {
        var workoutList = selectedLevelData[selectedLevel]["workout"] as List<dynamic>;

        // Find the correct muscle group data
        var muscleGroupData = workoutList.firstWhere(
          (muscle) => (muscle as Map<String, dynamic>).containsKey(muscleGroup),
          orElse: () => <String, Object>{}, // Fallback if muscle group is not found
        );

        // Check if muscle group data is valid
        if (muscleGroupData.isNotEmpty && muscleGroupData[muscleGroup] != null) {
          var exercises = muscleGroupData[muscleGroup]['exercises'] as List<dynamic>;
          String muscleImage = muscleGroupData[muscleGroup]['image'] ?? "assets/Image/default_image.jpeg";

          // Populate List_Data with exercises
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
      body: IndexedStack(
        index: currentIndex,
        children: [
          _buildHomePage(),
          Discover(),
          Profile_Setting(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: Colors.white,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home, color: Color(int.parse(Purple))),
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.compass_calibration_rounded, color: Color(int.parse(Purple))),
            icon: Icon(Icons.compass_calibration_rounded),
            label: "Discover",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.person, color: Color(int.parse(Purple))),
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  Widget _buildHomePage() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(int.parse(Black)),
        leading: IconButton(
          onPressed: () {},
          icon: FaIcon(FontAwesomeIcons.dumbbell, color: Color(int.parse(White))),
        ),
        title: titles(txt: "Gofit", txt_color: Color(int.parse(White)), Font_size: 30),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Notification_Page()));
            },
            icon: FaIcon(FontAwesomeIcons.bell, color: Color(int.parse(White))),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => My_Bookmark(bookmarkedExercises: bookmarkedExercises)
              ));
            },
            icon: FaIcon(FontAwesomeIcons.bookmark, color: Color(int.parse(White))),
          ),
        ],
      ),
      body: buildContainer(
        backgroundColor: Color(int.parse(Black)),
        padding_All_direction: 15,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titles(txt: "Morning, $username", Font_size: 40),
            SizedBox(height: 10),
            titles(txt: "Featured Workouts", txt_color: Color(int.parse(White)), Font_size: 20),
            SizedBox(height: 10),
            _buildWorkoutSection(),
            SizedBox(height: 10),
            titles(txt: "Workout Levels", Font_size: 20),
            SizedBox(height: 10),
            _buildLevelSelection(),
            SizedBox(height: 10),
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
        itemCount: workout.length, // Number of muscles
        itemBuilder: (context, index) {
          String muscleGroup = workout[index]; // Fetching the muscle group name

          // Fetching the corresponding image for each muscle group from the database
          String muscleImage = 'assets/Image/default_image.jpeg'; // Default image

          if (ExercisesDatabase.isNotEmpty &&
              ExercisesDatabase[0].containsKey(selectedLevel) &&
              ExercisesDatabase[0][selectedLevel] != null &&
              (ExercisesDatabase[0][selectedLevel]["workout"] as List<dynamic>).length > index) {
            muscleImage = ExercisesDatabase[0][selectedLevel]["workout"][index]?['image'] ?? 'assets/Image/default_image.jpeg';
          }

          return Row(
            children: [
              _buildMuscleStack(muscleImage, muscleGroup),
              SizedBox(width: 20),
            ],
          );
        },
      ),
    );
  }

  Widget _buildMuscleStack(String muscleImage, String muscleGroup) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMuscle = muscleGroup; // Update selected muscle group
          loadMuscleData(selectedMuscle); // Load exercises for this muscle group
        });
      },
      child: Stack(
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
                  titles(txt: muscleGroup.toUpperCase(), Font_size: 25), // Display muscle group name
                ],
              ),
            ),
          ),
        ],
      ),
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
              for (int i = 0; i < buttons_TxT.length; i++) ...[
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
                // Adding space between the buttons
                SizedBox(width: 10),
              ],
            ],
          ),
        ),
        SizedBox(height: 20),
      ],
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
