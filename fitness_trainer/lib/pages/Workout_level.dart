import 'package:finalproject/Component/buid_container.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Component/Build_ContainerWith_Border.dart';
import '../Component/Button.dart';
import '../Component/Colors.dart';
import '../Component/Paragraphs.dart';
import '../Component/SizedBox_for Gapping.dart';
import '../Component/Title.dart';
class WorkoutLevel extends StatefulWidget {
  @override
  State<WorkoutLevel> createState() => _WorkoutLevelState();
}
class _WorkoutLevelState extends State<WorkoutLevel> {
  late List buttons_TxT =[
    "Beginner",
    "Intermediate",
    "Advanced"
  ];
 // three Buttons in begin of the page
  late  List IsChecked = [
    false,
    false,
    false,
  ];
 // for Button one-selection
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
  ];  // Data for Cards
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(int.parse(Black)),
        leading: IconButton(
          onPressed: (){},
          icon: Icon( Icons.arrow_back),
          color:
          Color(int.parse(White)),
        ),
        title: titles(txt: "workout Levels" , Font_size: 20),
        actions: [
          IconButton(onPressed: (){},
              icon: FaIcon(FontAwesomeIcons.bars) , color: Color(int.parse(White)),)
        ],
      ),
      body: buildContainer(
        padding_All_direction: 20,
      backgroundColor:Color(int.parse(Black)),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                ),
              ],
                  ),
                ),
          Expanded(
            flex: 8,
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
                ],
            ),
      )
    );
  }
}