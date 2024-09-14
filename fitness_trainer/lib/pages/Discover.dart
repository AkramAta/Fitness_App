import 'package:finalproject/Component/SizedBox_for%20Gapping.dart';
import 'package:finalproject/Component/buid_container.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Component/Build_ContainerWith_Border.dart';
import '../Component/Button.dart';
import '../Component/Colors.dart';
import '../Component/Paragraphs.dart';
import '../Component/Title.dart';
class Discover extends StatefulWidget {
  @override
  State<Discover> createState() => _DiscoverState();
}
class _DiscoverState extends State<Discover> {
  late int  Current_Index = 1;
  late List<Map> List_Data = [
    {
      "image": "Assets/Image/bg-card-7.jpg",
      "Titles": "Full Body Stretching",
      "subtitle": "beginner",
      "minutes": "45 min",
      "icon": FontAwesomeIcons.bookmark,
    },
    {
      "image": "Assets/Image/bg-card-6.jpg",
      "Titles": "Squat Movement Exercise",
      "subtitle": "Advanced",
      "icon": FontAwesomeIcons.bookmark,
    },
    {
      "image": "Assets/Image/bg-card-8.jpg",
      "Titles": "Yoga Women Exercise",
      "subtitle": "Intermediate",
      "icon": FontAwesomeIcons.bookmark,
    },
    {
      "image": "Assets/Image/bg-card-9.jpg",
      "Titles": "Yoga Movement Exercise",
      "subtitle": "Intermediate",
      "icon": FontAwesomeIcons.bookmark,
    },
    {
      "image": "Assets/Image/bg-card-10.jpg",
      "Titles": "Abdominal Exercise",
      "subtitle": "Beginner",
      "icon": FontAwesomeIcons.bookmark,
    },
  ]; // Data of the cards
  late List buttons_TxT = [
    "Beginner",
    "Intermediate",
    "Advanced"
  ]; // Three Buttons at the beginning of the page
  late List IsChecked = [
    false,
    false ,
    false,
  ]; // One-selection logic
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(int.parse(Black)),
        leading: Padding(
          padding: EdgeInsets.all(5),
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
          padding: EdgeInsets.all(10),
          child: titles(
            txt: "Discover",
            txt_color: Color(int.parse(White)),
            Font_size: 30,
          ),
        ),
      ),
      body: buildContainer(
        padding_All_direction: 20,
        backgroundColor: Color(int.parse(Black)),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: buttons_TxT.length,
                itemBuilder: (context, i) {
                  return buildContainerWithBorder(
                    child: buttons(
                      Font_size: 20,
                      text: buttons_TxT[i],
                      action: () {
                        setState(() {
                          for (int j = 0; j < IsChecked.length; j++) {
                            IsChecked[j] = false;
                          }
                          IsChecked[i] = true;
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
                  );
                },
              ),
            ),
            Sized_Gap(Height: 30),
            Expanded(
              flex: 9,
              child: ListView.builder(
                itemCount: List_Data.length,
                itemBuilder: (context, i) {
                  return Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
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
                        margin: EdgeInsets.symmetric(vertical: 10),
                        width: double.infinity,
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
                                txt: List_Data[i]["Titles"],
                                Font_size: 25,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  // paragraph(
                                  //   text: List_Data[i]["minutes"],
                                  //   Font_size: 20,
                                  // ),
                                  paragraph(
                                    text: List_Data[i]["subtitle"],
                                    Font_size: 20,
                                  ),
                                  paragraph(
                                    text: "|",
                                    Font_size: 20,
                                  ),
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
            Sized_Gap(Height: 20),
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
                    backgroundColor: Color(int.parse(Black)),
                    label: "Discover"
                ),
                BottomNavigationBarItem(
                    activeIcon: Icon(Icons.add_chart , color:Color(int.parse(Purple)),),
                    icon:Icon(Icons.add_chart),
                    backgroundColor: Color(int.parse(Black)),
                    label: "Insights"
                ),
                BottomNavigationBarItem(
                    activeIcon: Icon(Icons.person , color:Color(int.parse(Purple)),),
                    icon:Icon(Icons.person),
                    backgroundColor: Color(int.parse(Black)),
                    label: "profile"
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
