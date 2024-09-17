import 'package:finalproject/Component/Build_Container_%20with_Fixed_width_hieght.dart';
import 'package:finalproject/Component/Colors.dart';
import 'package:finalproject/Component/Title.dart';
import 'package:finalproject/Component/buid_container.dart';
import 'package:finalproject/Models/ExercisesData/ExercisesDatabase.dart';
import 'package:finalproject/pages/Discover.dart';
import 'package:finalproject/pages/ExerciseDetailScreen.dart'; // Import ExerciseDetailScreen
import 'package:finalproject/pages/ExerciseListScreen.dart';
import 'package:finalproject/pages/My_BookMark.dart';
import 'package:finalproject/pages/Notification_page.dart';
import 'package:finalproject/pages/Profile_Setting.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home_Screen extends StatefulWidget {
  final String userid;
  final Map<String, dynamic> data;

  Home_Screen({
    required this.userid,
    required this.data,
  });

  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  final List<String> workout = ["biceps", "triceps", "chest", "back", "legs", "core"];
  final List<String> buttons_TxT = ["beginner", "intermediate", "advanced"];
  final List<bool> IsChecked = [true, false, false]; // Default to "Beginner" selected

  String selectedLevel = ''; // Default level
  List<Map> List_Data = [];
  List<Map> bookmarkedExercises = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedLevel = widget.data["level"] ?? "Beginner"; // Initialize selectedLevel
    loadWorkoutData(selectedLevel); // Load data for the default level
    loadBookmarkedExercises(); // Load bookmarked exercises
  }

  void loadWorkoutData(String level) {
    setState(() {
      selectedLevel = level.toLowerCase(); // Update the selected level
      loadMuscleData(); // Load exercises for all muscle groups
    });
  }

  void loadMuscleData() {
    setState(() {
      List_Data = []; // Reset the exercise list

      if (ExercisesDatabase.isNotEmpty) {
        var selectedLevelData = ExercisesDatabase.firstWhere(
          (levelData) => levelData.containsKey(selectedLevel),
          orElse: () => <String, Object>{}, // Providing an empty map as a fallback
        );

        if (selectedLevelData.isNotEmpty && selectedLevelData[selectedLevel] != null) {
          var workoutList = selectedLevelData[selectedLevel]["workout"] as List<dynamic>;

          // Loop through all muscle groups
          for (var muscleGroupData in workoutList) {
            var muscleGroupName = muscleGroupData.keys.first; // Get the muscle group name
            var exercises = muscleGroupData[muscleGroupName]['exercises'] as List<dynamic>;
            String muscleImage = muscleGroupData[muscleGroupName]['image'] ?? "Assets/Image/default_image.jpeg";

            // Add each exercise from the muscle group to the List_Data
            for (var exercise in exercises) {
              List_Data.add({
                "name": exercise['name'] ?? "Unknown Exercise",
                "instructions": exercise['instructions'] ?? "No instructions",
                "equipment": exercise['equipment'] ?? "No equipment",
                "exerciseImage": exercise['image'] ?? "Assets/Image/default_image.jpeg",
                "muscleImage": muscleImage,
                "muscleGroup": muscleGroupName, // Save the muscle group name for display
              });
            }
          }
        }
      }
    });
  }

  Future<void> loadBookmarkedExercises() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedBookmarks = prefs.getStringList('bookmarkedExercises') ?? [];
    setState(() {
      bookmarkedExercises = List_Data.where((exercise) => savedBookmarks.contains(exercise['name'])).toList();
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

  void toggleBookmark(Map exercise) {
    setState(() {
      if (bookmarkedExercises.any((item) => item['name'] == exercise['name'])) {
        // If the exercise is already bookmarked, remove it
        bookmarkedExercises.removeWhere((item) => item['name'] == exercise['name']);
      } else {
        // Otherwise, add it to the bookmarks
        bookmarkedExercises.add(exercise);
      }
      // Save the updated bookmarks to persistent storage
      saveBookmarkedExercises();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          _buildHomePage(),
          Discover(userid: widget.userid, userdata: widget.data),
          Profile_Setting(userid: widget.userid, userdata: widget.data),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(int.parse(Purple)),
        unselectedItemColor: Color(int.parse(White)),
        currentIndex: currentIndex,
        backgroundColor: Color(int.parse(Black)),
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home, color: Color(int.parse(Purple))),
            icon: Icon(Icons.home, color: Color(int.parse(White))),
            label: "Home",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.compass_calibration_rounded, color: Color(int.parse(Purple))),
            icon: Icon(Icons.compass_calibration_rounded, color: Color(int.parse(White))),
            label: "Discover",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.person, color: Color(int.parse(Purple))),
            icon: Icon(Icons.person, color: Color(int.parse(White))),
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
            titles(txt: "Morning, ${widget.data["name"] ?? 'User'}", Font_size: 40),
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
      height: 205, // Increased height to accommodate more levels
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: buttons_TxT.length, // Loop through the levels (Beginner, Intermediate, Advanced)
        itemBuilder: (context, levelIndex) {
          String level = buttons_TxT[levelIndex].toLowerCase();
          List<dynamic> workoutList = [];

          // Get the workout list for the current level
          if (ExercisesDatabase.isNotEmpty && ExercisesDatabase[0].containsKey(level)) {
            workoutList = ExercisesDatabase[0][level]["workout"] as List<dynamic>;
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: workoutList.length,
                  itemBuilder: (context, index) {
                    String muscleGroup = workoutList[index].keys.first; // Get the muscle group name
                    String muscleImage = workoutList[index]['image'] ?? 'Assets/Image/default_image.jpeg';

                    return GestureDetector(
                      onTap: () {
                        // Navigate to ExerciseListScreen with selected muscleGroup and level
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExerciseListScreen(
                              muscleGroup: muscleGroup,
                              level: level,
                            ),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          _buildMuscleStack(muscleImage, muscleGroup),
                          SizedBox(width: 20),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildMuscleStack(String muscleImage, String muscleGroup) {
    return Container(
      width: 150,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(muscleImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.5), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Text(
              muscleGroup.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExerciseList() {
    if (List_Data.isEmpty) {
      return Center(
        child: Text(
          "No exercises available for the selected muscle group and level.",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      );
    }

    return Expanded(
      child: ListView.builder(
        itemCount: List_Data.length,
        itemBuilder: (context, index) {
          String exerciseName = List_Data[index]["name"] ?? "Unknown";
          String exerciseImage = List_Data[index]["exerciseImage"] ?? "Assets/Image/default_image.jpeg";
          String muscleGroup = List_Data[index]["muscleGroup"] ?? "Unknown Muscle Group";
          bool isBookmarked = bookmarkedExercises.any((exercise) => exercise['name'] == exerciseName);

          return GestureDetector(
            onTap: () {
              // Navigate to ExerciseDetailScreen when the exercise is tapped
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExerciseDetailScreen(
                    exercise: List_Data[index], // Pass the selected exercise data
                  ),
                ),
              );
            },
            child: Stack(
              children: [
                _buildExerciseItem(exerciseImage, exerciseName),
                _buildGradientOverlay(exerciseName, muscleGroup),
                Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                    icon: Icon(
                      isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                      color: isBookmarked ? Colors.yellow : Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      toggleBookmark(List_Data[index]);
                    },
                  ),
                ),
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
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildGradientOverlay(String exerciseName, String muscleGroup) {
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
            Text(
              muscleGroup.toUpperCase(),
              style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text(
              exerciseName.toUpperCase(),
              style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLevelSelection() {
    return Column(
      children: [
        buildContainerWith_Fixed_Widhth_Height(
          width: double.infinity,
          height: 65,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: buttons_TxT.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    // Update the selected level
                    for (int i = 0; i < IsChecked.length; i++) {
                      IsChecked[i] = i == index;
                    }
                    loadWorkoutData(buttons_TxT[index]);
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: IsChecked[index] ? Color(int.parse(Purple)) : Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(30),
                    color: IsChecked[index] ? Color(int.parse(Purple)) : Colors.transparent,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    buttons_TxT[index],
                    style: TextStyle(
                      fontSize: 18,
                      color: IsChecked[index] ? Colors.white : Colors.white,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
