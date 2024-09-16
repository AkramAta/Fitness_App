import 'package:finalproject/Component/Build_ContainerWith_Border.dart';
import 'package:finalproject/Component/Button.dart';
<<<<<<< HEAD
import 'package:finalproject/pages/Notification_page.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Component/Build_Container_ with_Fixed_width_hieght.dart';
import '../Component/Colors.dart';
import '../Component/buid_container.dart';
import '../Component/Title.dart';
import '../Models/ExercisesData/ExercisesDatabase.dart';
import 'My_Bookmark.dart';

import 'Profile_Setting.dart';
import 'Discover.dart';
import 'Exercise_Screen.dart';

class Home_Screen extends StatefulWidget {
  final String userid;
  final  Map <String, dynamic> data;

  Home_Screen({
    required this.userid,
    required this.data,
  });

=======
import 'package:finalproject/Component/Paragraphs.dart';
import 'package:finalproject/Component/SizedBox_for%20Gapping.dart';
import 'package:finalproject/Component/Title.dart';
import 'package:finalproject/Component/buid_container.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Component/Colors.dart';
class Home_Screen extends StatefulWidget {
 late String userid;
 Home_Screen({required this.userid});
>>>>>>> 0c7733ad9c80b51a50494444ebfb18926c7876e4
  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}
class _Home_ScreenState extends State<Home_Screen> {
<<<<<<< HEAD
  final List<String> workout = ["biceps", "triceps", "chest", "back", "legs", "core"];
  final List<String> buttons_TxT = ["Beginner", "Intermediate", "Advanced"];
  final List<bool> IsChecked = [true, false, false]; // Default to "Beginner" selected

  String selectedLevel = ''; // Default level
  String selectedMuscle = "biceps"; // Default muscle group
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
      loadMuscleData(selectedMuscle); // Load exercises for default muscle group (biceps)
    });
  }

  void loadMuscleData(String muscleGroup) {
    setState(() {
      List_Data = []; // Reset the exercise list

      if (ExercisesDatabase.isNotEmpty) {
        var selectedLevelData = ExercisesDatabase.firstWhere(
              (levelData) => levelData.containsKey(selectedLevel),
          orElse: () => <String, Object>{}, // Providing an empty map as a fallback
        );

        if (selectedLevelData.isNotEmpty && selectedLevelData[selectedLevel] != null) {
          var workoutList = selectedLevelData[selectedLevel]["workout"] as List<dynamic>;

          var muscleGroupData = workoutList.firstWhere(
                (muscle) => (muscle as Map<String, dynamic>).containsKey(muscleGroup),
            orElse: () => <String, Object>{}, // Fallback if muscle group is not found
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
          Discover(userid: widget.userid, userdata: widget.data),
          Profile_Setting(userid: widget.userid, userdata: widget.data),
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
=======
  late String username = "hanna";
  late List buttons_TxT =[
      "Beginner",
      "Intermediate",
      "Advanced"
    ]; // for Button_Text
  late  List IsChecked = [
    false,
    false,
    false,
  ]; // for Button one-selection
  late List <Map> List_Data = [
    {
      "image":"Assets/Image/img.png" ,
      "Titles":"Full Body Stretching",
      "minutes":"10 minuets",
      "separator":"|",
      "subtitle":"Intermediate",
      "icon":FontAwesomeIcons.bookmark,
    },
    {
      "image":"Assets/Image/img_1.png" ,
      "Titles":"Squat Movement Exercise",
      "minutes":"6 minuets",
      "separator":"|",
      "subtitle":"Intermediate",
      "icon":FontAwesomeIcons.bookmark,
    },
    {
      "image":"Assets/Image/img_2.png" ,
      "Titles":"Yoga Women Exercise",
      "minutes":"8 minuets",
      "separator":"|",
      "subtitle":"Intermediate",
      "icon":FontAwesomeIcons.bookmark,
    },
    {
      "image":"Assets/Image/img_3.png" ,
      "Titles":"Yoga Movement Exercise",
      "minutes":"10 minuets",
      "separator":"|",
      "subtitle":"Intermediate",
      "icon":FontAwesomeIcons.bookmark,
    },
    {
      "image":"Assets/Image/img_4.png" ,
      "Titles":"Abdominal Exercise",
      "minutes":"6 minuets",
      "separator":"|",
      "subtitle":"Intermediate",
      "icon":FontAwesomeIcons.bookmark,
    },
  ];
  late int Current_Index  = 0; // for navigation Bottom bar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
>>>>>>> 0c7733ad9c80b51a50494444ebfb18926c7876e4
      appBar: AppBar(
        backgroundColor: Color(int.parse(Black)),
        leading: Padding(
          padding: EdgeInsets.only(
            top: 5,
            bottom: 5,
            left: 5,
            right: 0,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(int.parse(Purple)),
            ),
            padding: EdgeInsets.all(1),
            child: IconButton(
              onPressed: () {},
              icon: FaIcon(
                FontAwesomeIcons.dumbbell,
                color: Color(int.parse(White)),
              ),
            ),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(
            top: 10,
            bottom: 10,
            left: 0,
            right: 0,
          ),
          child: titles(
            txt: "Gofit",
            txt_color: Color(int.parse(White)),
            Font_size: 30,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              top: 5,
              bottom: 5,
              left: 20,
              right: 0,
            ),
            child: FaIcon(
              FontAwesomeIcons.bell,
              color: Color(int.parse(White)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 5,
              bottom: 5,
              left: 20,
              right: 10,
            ),
            child: IconButton(
              onPressed: () {},
              icon: FaIcon(
                FontAwesomeIcons.bookmark,
                color: Color(int.parse(White)),
              ),
            ),
          ),
        ],
      ),
      body: buildContainer(
        backgroundColor: Color(int.parse(Black)),
        padding_All_direction: 15,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
<<<<<<< HEAD
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
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: workout.length,
        itemBuilder: (context, index) {
          String muscleGroup = workout[index];
          String muscleImage = 'assets/Image/default_image.jpeg';

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
          selectedMuscle = muscleGroup;
          loadMuscleData(selectedMuscle);
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
=======
            titles(
              txt: "Morning, ${username}",
              Font_size: 40,
              text_Align: TextAlign.start,
>>>>>>> 0c7733ad9c80b51a50494444ebfb18926c7876e4
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: paragraph(
                    text: "Featured workout",
                    Font_size: 20,
                    color: Color(int.parse(White)),
                  )
                ),
                TextButton(
                  onPressed: () {},
                  child: paragraph(
                    text: "See all",
                    Font_size: 20,
                    color: Color(int.parse(Purple)),
                  ),
                ),
              ],
            ),
            buildContainerWith_Fixed_Widhth_Height(
              padding_All_direction:0 ,
              width: double.infinity,
              height: 200,
              child: ListView(
                padding: EdgeInsets.all(20),
                scrollDirection: Axis.horizontal,
                children: [
<<<<<<< HEAD
                  titles(txt: muscleGroup.toUpperCase(), Font_size: 25),
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
=======
                  Stack(
                    children: [
                      Container(
                        width: 300,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                      /*    image: DecorationImage(
                           *//* image: AssetImage("Assets/Image/bg-card-1.jpg"),*//*
                            fit: BoxFit.fill,
                          ),*/
                        ),
                      ),
                      Container(
                        width: 300, // Match the size of the first container
                        height: 200, //
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.5), // Semi-transparent black
                              Colors.transparent, // Transition to transparent
                            ],
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
                              titles(
                                txt: "Full Body Stretching",
                                Font_size: 25,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  paragraph(
                                      text: "10 minutes", Font_size: 20),
                                  paragraph(text: "|", Font_size: 20),
                                  paragraph(
                                      text: "Intermediate", Font_size: 20),
                                  IconButton(
                                    onPressed: () {},
                                    icon: FaIcon(
                                      FontAwesomeIcons.bookmark,
                                      color: Color(int.parse(White)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Sized_Gap(Width: 20),
                  Stack(
                    children: [
                      Container(
                        width: 300,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                         /* image: DecorationImage(
                            image: AssetImage(""),
                            fit: BoxFit.fill,
                          ),*/
                        ),
                      ),
                      Container(
                        width: 300, // Match the size of the first container
                        height: 200, // Match the height of the first container
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.5), // Semi-transparent black
                              Colors.transparent, // Transition to transparent
                            ],
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
                              titles(
                                txt: "Yoga Body Stretching",
                                Font_size: 25,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  paragraph(
                                      text: "8 minutes", Font_size: 20),
                                  paragraph(text: "|", Font_size: 20),
                                  paragraph(
                                      text: "Intermediate", Font_size: 20),
                                  IconButton(
                                    onPressed: () {},
                                    icon: FaIcon(
                                      FontAwesomeIcons.bookmark,
                                      color: Color(int.parse(White)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
>>>>>>> 0c7733ad9c80b51a50494444ebfb18926c7876e4
              children: [
                TextButton(
                  onPressed: () {},
                  child: paragraph(
                    text: "Workout levels",
                    Font_size: 20,
                    color: Color(int.parse(White)),)
                ),
                TextButton(
                  onPressed: () {},
                  child: paragraph(
                    text: "See all",
                    Font_size: 20,
                    color: Color(int.parse(Purple)),
                  ),
                ),
              ],
            ),
           buildContainerWith_Fixed_Widhth_Height(
            width: double.infinity,
            height: 65,
              child:ListView(
                scrollDirection: Axis.horizontal,
                children: [
                 Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for(int i =0; i < buttons_TxT.length;i++)
                        buildContainerWithBorder(
                            child:
                            buttons(
                              Font_size: 20,
                              text: buttons_TxT[i]
                              , action: (){
                              setState(() {
                                for (int j = 0; j < IsChecked.length; j++) {
                                  IsChecked[j] = false; // Uncheck all buttons
                                }
                                IsChecked[i] = true; // Check the selected button
                              });
                            },
                              colour: IsChecked[i] == true
                                  ? Color(int.parse(Purple))
                                  : Colors.transparent,
                            ),
                            borderWidth: 1,
                            borderColor: Color(int.parse(Purple)),
                            borderRadius: 40,
                            Margin_top_and_bottom: 0
                        )
                    ],
                  )
                ],
              )
           ),
            Sized_Gap(Height: 20),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: List_Data.length,
                itemBuilder: (context , i){
                  return Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top:10  , bottom: 10),
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(List_Data[i]["image"]),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top:10  , bottom: 10),
                        width: double.infinity, // Match the size of the first container
                        height: 200, // Match the height of the first container
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.5), // Semi-transparent black
                              Colors.transparent, // Transition to transparent
                            ],
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
                              titles(
                                txt: List_Data[i]["Titles"],
                                Font_size: 25,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  paragraph(
                                      text: List_Data[i]["minutes"], Font_size: 20),
                                  paragraph(text: List_Data[i]["separator"], Font_size: 20),
                                  paragraph(
                                      text: List_Data[i]["subtitle"], Font_size: 20),
                                  IconButton(
                                    onPressed: () {},
                                    icon: FaIcon(
                                      FontAwesomeIcons.bookmark,
                                      color: Color(int.parse(White)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          BottomNavigationBar(
            currentIndex: Current_Index,
            backgroundColor: Colors.black,
            onTap: (value) {
            setState(() {
              Current_Index = value;
            });
            },
            items: [
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.home , color:Color(int.parse(Purple)),),
                backgroundColor: Color(int.parse(Black)),
                icon:Icon(Icons.home),
                label: "home"
              ),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.compass_calibration_rounded , color:Color(int.parse(Purple)),),
                  icon:Icon(Icons.compass_calibration_rounded ),
                  label: "Discover"
              ),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.add_chart , color:Color(int.parse(Purple)),),
                  icon:Icon(Icons.add_chart),
                  label: "Insights"
              ),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.person , color:Color(int.parse(Purple)),),
                  icon:Icon(Icons.person),
                  label: "profile"
              ),
            ],
          )
          ]
        ),
    ),
    );
  }
}