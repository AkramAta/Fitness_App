import 'package:finalproject/Component/Build_ContainerWith_Border.dart';
import 'package:finalproject/Component/Build_Container_%20with_Fixed_width_hieght.dart';
import 'package:finalproject/Component/Button.dart';
import 'package:finalproject/Component/Paragraphs.dart';
import 'package:finalproject/Component/SizedBox_for%20Gapping.dart';
import 'package:finalproject/Component/Title.dart';
import 'package:finalproject/Component/buid_container.dart';
import 'package:flutter/material.dart';
import '../Component/Colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Home_Screen extends StatefulWidget {
  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}
class _Home_ScreenState extends State<Home_Screen> {
  late String username = "akram";
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
      "image":"Assets/Image/bg-card-1.jpg" ,
      "Titles":"Full Body Stretching",
      "minutes":"10 minuets",
      "separator":"|",
      "subtitle":"Intermediate",
      "icon":FontAwesomeIcons.bookmark,
    },
    {
      "image":"Assets/Image/bg-card-2.jpg" ,
      "Titles":"Squat Movement Exercise",
      "minutes":"6 minuets",
      "separator":"|",
      "subtitle":"Intermediate",
      "icon":FontAwesomeIcons.bookmark,
    },
    {
      "image":"Assets/Image/bg-card-3.jpg" ,
      "Titles":"Yoga Women Exercise",
      "minutes":"8 minuets",
      "separator":"|",
      "subtitle":"Intermediate",
      "icon":FontAwesomeIcons.bookmark,
    },
    {
      "image":"Assets/Image/bg-card-4.jpg" ,
      "Titles":"Yoga Movement Exercise",
      "minutes":"10 minuets",
      "separator":"|",
      "subtitle":"Intermediate",
      "icon":FontAwesomeIcons.bookmark,
    },
    {
      "image":"Assets/Image/bg-card-5.jpg" ,
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
            titles(
              txt: "Morning, ${username}",
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
                  Stack(
                    children: [
                      Container(
                        width: 300,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage("Assets/Image/bg-card-1.jpg"),
                            fit: BoxFit.fill,
                          ),
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
                          image: DecorationImage(
                            image: AssetImage("Assets/Image/bg-card-2.jpg"),
                            fit: BoxFit.fill,
                          ),
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