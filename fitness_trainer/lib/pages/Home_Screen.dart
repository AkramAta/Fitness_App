import 'package:finalproject/Component/Build_ContainerWith_Border.dart';
import 'package:finalproject/Component/Build_Container_%20with_Fixed_width_hieght.dart';
import 'package:finalproject/Component/Button.dart';
import 'package:finalproject/Component/Paragraphs.dart';
import 'package:finalproject/Component/SizedBox_for%20Gapping.dart';
import 'package:finalproject/Component/Title.dart';
import 'package:finalproject/Component/buid_container.dart';
import 'package:finalproject/Models/ExercisesData/ExercisesDatabase.dart';
import 'package:finalproject/pages/Discover.dart';
import 'package:finalproject/pages/My_BookMark.dart';
import 'package:finalproject/pages/Notification_page.dart';
import 'package:finalproject/pages/Profile_Setting.dart';
import 'package:finalproject/pages/Workout_level.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Component/Colors.dart';

class Home_Screen extends StatefulWidget {
  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  late List<String> workout = [
    "biceps",
    "triceps",
    "chest",
    "back",
    "shoulders",
    "legs",
    "push",
    "pull",
    "core",
  ];
  late String username = "akram";

  late List<String> buttons_TxT = [
    "Beginner",
    "Intermediate",
    "Advanced"
  ]; // for Button_Text

  late List<bool> IsChecked = [
    false,
    false,
    false,
  ]; // for Button one-selection
  late List<Map> List_Data = [];
  late List<Map> bookmarkedWorkouts = []; // For bookmarked workouts
  late int Current_Index = 0; // for navigation Bottom bar

  // Function to handle loading data based on button selection
  void loadWorkoutData(String level) {
    setState(() {
      List<Map> combinedWorkouts = [];

      for (int i = 0; i < workout.length; i++) {
        if (level == "Beginner") {
          combinedWorkouts.addAll(
              ExercisesDatabase[0]["beginner"][workout[i]] ?? []);
        } else if (level == "Intermediate") {
          combinedWorkouts.addAll(
              ExercisesDatabase[0]["intermediate"][workout[i]] ?? []);
        } else if (level == "Advanced") {
          combinedWorkouts.addAll(
              ExercisesDatabase[0]["advanced"][workout[i]] ?? []);
        }
      }

      // Ensure that List_Data is not null by assigning an empty list as a fallback
      List_Data = combinedWorkouts.isNotEmpty ? combinedWorkouts : [];
    });
  }

  @override
  void initState() {
    super.initState();
    // Load default beginner data on first load
    loadWorkoutData("Beginner");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(int.parse(Black)),
        leading: Padding(
          padding: EdgeInsets.all(5),
          child: IconButton(
            onPressed: () {},
            icon: FaIcon(
              FontAwesomeIcons.dumbbell,
              color: Color(int.parse(White)),
            ),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.all(10),
          child: titles(
            txt: "Gofit",
            txt_color: Color(int.parse(White)),
            Font_size: 30,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Notification_Page()));
            },
            icon: FaIcon(
              FontAwesomeIcons.bell,
              color: Color(int.parse(White)),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => My_Bookmark(
                    bookmarkedWorkouts: bookmarkedWorkouts,
                  ),
                ),
              );
            },
            icon: FaIcon(
              FontAwesomeIcons.bookmark,
              color: Color(int.parse(White)),
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
            titles(
              txt: "Morning, $username",
              Font_size: 40,
              text_Align: TextAlign.start,
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
                  ),
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
              padding_All_direction: 0,
              width: double.infinity,
              height: 200,
              child: ListView(
                padding: EdgeInsets.all(20),
                scrollDirection: Axis.horizontal,
                children: [
                  _buildWorkoutStack(
                    "assets/Image/Workout.jpeg",
                    "Full Body Stretching",
                    "10 minutes",
                    "Full Body", // Pass muscle group name
                  ),
                  Sized_Gap(Width: 20),
                  _buildWorkoutStack(
                    "assets/Image/work out.jpeg",
                    "Yoga Body Stretching",
                    "8 minutes",
                    "Yoga", // Pass muscle group name
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Workout levels",
                  style: TextStyle(fontSize: 20, color: Color(int.parse(White))),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WorkoutLevel()));
                  },
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
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (int i = 0; i < buttons_TxT.length; i++)
                        buildContainerWithBorder(
                          child: buttons(
                            Font_size: 20,
                            text: buttons_TxT[i],
                            action: () {
                              setState(() {
                                for (int j = 0; j < IsChecked.length; j++) {
                                  IsChecked[j] = false; // Uncheck all buttons
                                }
                                IsChecked[i] = true; // Check the selected button
                                loadWorkoutData(buttons_TxT[i]); // Load the corresponding workout
                              });
                            },
                            colour: IsChecked[i] == true
                                ? Color(int.parse(Purple))
                                : Colors.transparent,
                          ),
                          borderWidth: 1,
                          borderColor: Color(int.parse(Purple)),
                          borderRadius: 40,
                          Margin_top_and_bottom: 0,
                        )
                    ],
                  )
                ],
              ),
            ),
            Sized_Gap(Height: 20),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: List_Data.length,
                itemBuilder: (context, i) {
                  bool isBookmarked = bookmarkedWorkouts.contains(List_Data[i]);

                  return Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(List_Data[i]["image"] ?? ""),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
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
                                txt: List_Data[i]["name"] ?? "Unknown Exercise",
                                Font_size: 25,
                              ),
                              paragraph(
                                text: List_Data[i]["instructions"] ?? "",
                                Font_size: 16,
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (isBookmarked) {
                                      bookmarkedWorkouts.remove(List_Data[i]); // Remove from bookmark
                                    } else {
                                      bookmarkedWorkouts.add(List_Data[i]); // Add to bookmark
                                    }
                                  });
                                },
                                icon: FaIcon(
                                  isBookmarked
                                      ? FontAwesomeIcons.solidBookmark // Filled bookmark icon
                                      : FontAwesomeIcons.bookmark, // Regular bookmark icon
                                  color: Color(int.parse(White)),
                                ),
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
              backgroundColor: Colors.white,
              onTap: (value) {
                setState(() {
                  Current_Index = value;
                });

                // Navigate based on the selected index
                if (value == 0) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Home_Screen()));
                } else if (value == 1) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Discover()));
                } else if (value == 2) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Profile_Setting()));
                }
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
          ],
        ),
      ),
    );
  }

  // Helper method to build a workout stack with muscle name
  Widget _buildWorkoutStack(String imagePath, String title, String duration, String muscleName) {
    return GestureDetector(
      onTap: () {
        // Show muscle group name when pressed
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Muscle Group"),
            content: Text(muscleName),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("OK"),
              ),
            ],
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            width: 300,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            width: 300, // Match the size of the first container
            height: 200,
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
                    txt: title,
                    Font_size: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      paragraph(text: duration, Font_size: 20),
                      paragraph(text: "|", Font_size: 20),
                      paragraph(text: muscleName, Font_size: 20), // Display muscle group
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
    );
  }
}
