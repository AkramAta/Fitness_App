import "package:finalproject/Component/Button.dart";
import "package:finalproject/Component/buid_container.dart";
import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "../Component/Colors.dart";
import "../Component/Title.dart";
class Workout_Activity extends StatelessWidget {
  late List <Map> List_Data = [
    {
      "image":"Assets/Image/Workout_activity-1.jpg" ,
      "Titles":"warrior I",
      "minutes":"30 seconds",
    },
    {
      "image":"Assets/Image/Workout_activity-2.jpg" ,
      "Titles":"Side-plank",
      "minutes":"20 seconds",
    },
    {
      "image":"Assets/Image/Workout_activity-3.jpg" ,
      "Titles":"one leg down",
      "minutes":"20 seconds",
    },
    {
      "image":"Assets/Image/Workout_activity-4.jpg" ,
      "Titles":"Triangle Pose",
      "minutes":"40 seconds",
    },
    {
      "image":"Assets/Image/Workout_activity-5.jpg" ,
      "Titles":"Stark pose",
      "minutes":"20 seconds",
    },
  ];  // Data for Cards
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
            txt: "Workout Activity",
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
            child: IconButton(
              onPressed: () {},
              icon: FaIcon(
                FontAwesomeIcons.ellipsis,
                color: Color(int.parse(White)),
              ),
            ),
          ),

        ],
      ),
      body: buildContainer(
      padding_All_direction: 15,
      backgroundColor: Color(int.parse(Black)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: List_Data.length,
              itemBuilder: (context, i) {
                return Container(
                  margin: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(int.parse(White))),
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    onTap: () {},
                    contentPadding: EdgeInsets.all(10),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        List_Data[i]["image"],
                        width: 100,
                        height: 80,
                        fit: BoxFit.fill,
                      ),
                    ),
                    title: Text(
                      List_Data[i]["Titles"],
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      List_Data[i]["minutes"],
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Center(
            child:
            buttons(text: "Start", action: (){} , Pad_Left_Right: 150),
          )
        ],
      ),
    ),
    );
  }
}