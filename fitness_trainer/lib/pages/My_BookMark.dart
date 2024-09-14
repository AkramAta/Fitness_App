import "package:finalproject/Component/buid_container.dart";
import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "../Component/Button.dart";
import "../Component/Colors.dart";
import "../Component/Paragraphs.dart";
import "../Component/Title.dart";

class My_Bookmark extends StatelessWidget {
  late List<Map> bookmarkedWorkouts = [];
  My_Bookmark({required this.bookmarkedWorkouts});
  late List<Map> List_Data = [
    {
      "image": "Assets/Image/bg-card-1.jpg",
      "Titles": "Full Body Stretching",
      "subtitle": "Intermediate",
      "icon": FontAwesomeIcons.bookmark,
    },
    {
      "image": "Assets/Image/bg-card-2.jpg",
      "Titles": "Squat Movement Exercise",
      "subtitle": "Intermediate",
      "icon": FontAwesomeIcons.bookmark,
    },
    {
      "image": "Assets/Image/bg-card-3.jpg",
      "Titles": "Yoga Women Exercise",
      "subtitle": "Intermediate",
      "icon": FontAwesomeIcons.bookmark,
    },
    {
      "image": "Assets/Image/bg-card-4.jpg",
      "Titles": "Yoga Movement Exercise",
      "subtitle": "Intermediate",
      "icon": FontAwesomeIcons.bookmark,
    },
    {
      "image": "Assets/Image/bg-card-5.jpg",
      "Titles": "Abdominal Exercise",
      "subtitle": "Intermediate",
      "icon": FontAwesomeIcons.bookmark,
    },
    {
      "image": "Assets/Image/bg-card-6.jpg",
      "Titles": "Abdominal Crunches Exercise",
      "subtitle": "Intermediate",
      "icon": FontAwesomeIcons.bookmark,
    },
    {
      "image": "Assets/Image/bg-card-7.jpg",
      "Titles": "High-Intensity Interval Training",
      "subtitle": "Intermediate",
      "icon": FontAwesomeIcons.bookmark,
    },
    {
      "image": "Assets/Image/bg-card-8.jpg",
      "Titles": "Push-Ups Exercise",
      "subtitle": "Intermediate",
      "icon": FontAwesomeIcons.bookmark,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(int.parse(Black)),
        title: titles(
          txt: 'My Bookmark',
          text_Align: TextAlign.start,
          Font_size: 20,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(int.parse(White)),
          ),
          onPressed: () {
            // Define action on back button press
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: FaIcon(
              FontAwesomeIcons.tableList,
              color: Color(int.parse(White)),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: FaIcon(
              FontAwesomeIcons.bookmark,
              color: Color(int.parse(Purple)),
            ),
          ),
        ],
      ),
      body: buildContainer(
        padding_All_direction: 20,
        backgroundColor: Color(int.parse(Black)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 5
                ),
                itemCount: List_Data.length,
                itemBuilder: (BuildContext context, int i) {
                  return Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(List_Data[i]["image"]),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Container(
                          height: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.5),
                                Colors.transparent,
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        ),
                      ),
                      // Add Positioned widget to place the ListTile at the bottom
                      Container(
                        height: 180,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.all(10),
                              title: titles(
                                txt: List_Data[i]["Titles"],
                                Font_size: 14,
                                text_Align: TextAlign.start,
                              ),
                              subtitle: paragraph(
                                text: List_Data[i]["subtitle"],
                                Font_size: 12,
                                TextAlign: TextAlign.start,
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                                                },
                                icon: FaIcon(
                                  FontAwesomeIcons.solidBookmark,
                                  color: Color(int.parse(White)),
                                ),
                              ),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    backgroundColor: Color(int.parse(Black)),
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min, // Ensures the dialog is sized according to its content
                                        children: [
                                          // Title
                                          titles(
                                            txt: "Remove from Bookmark?",
                                            Font_size: 18,
                                            text_Align: TextAlign.center,
                                          ),
                                          Divider(
                                            color: Color(int.parse(Purple)),
                                            thickness: 1,
                                          ),
                                          SizedBox(height: 20),
                                          // Card preview (image, title, and subtitle)
                                          Container(
                                            height: 150,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              image: DecorationImage(
                                                image: AssetImage(List_Data[i]["image"]),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  bottom: 10,
                                                  left: 10,
                                                  right: 10,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      titles(
                                                        txt: List_Data[i]["Titles"],
                                                        Font_size: 16,
                                                        text_Align: TextAlign.start,
                                                        txt_color: Color(int.parse(White)),
                                                      ),
                                                      paragraph(
                                                        text: List_Data[i]["subtitle"], // Add any subtitle or detail here
                                                        Font_size: 12,
                                                        TextAlign: TextAlign.start,
                                                        color: Colors.white,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          // Buttons
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              // Cancel Button
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop(); // Close the dialog
                                                },
                                                style: TextButton.styleFrom(
                                                  backgroundColor: Color(int.parse(Grayish)),
                                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(30),
                                                  ),
                                                ),
                                                child: Text(
                                                  "Cancel",
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                              ),
                                              // Yes, Remove Button
                                              TextButton(
                                                onPressed: () {
                                                  // Add your logic for removing the bookmark here
                                                  Navigator.of(context).pop(); // Close the dialog
                                                },
                                                style: TextButton.styleFrom(
                                                  backgroundColor: Color(int.parse(Purple)),
                                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(30),
                                                  ),
                                                ),
                                                child: Text(
                                                  "Yes, Remove",
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },


                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}