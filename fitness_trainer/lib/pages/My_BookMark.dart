import "package:finalproject/Component/buid_container.dart";
import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:shared_preferences/shared_preferences.dart"; // Import shared_preferences
import "../Component/Colors.dart";
import "../Component/Title.dart";

class My_Bookmark extends StatefulWidget {
  final List<Map> bookmarkedExercises; // Dynamic data passed from Home_Screen

  My_Bookmark({required this.bookmarkedExercises}); // Constructor

  @override
  _My_BookmarkState createState() => _My_BookmarkState();
}

class _My_BookmarkState extends State<My_Bookmark> {
  late List<Map> bookmarkedExercises;

  @override
  void initState() {
    super.initState();
    bookmarkedExercises = widget.bookmarkedExercises; // Initialize the list with passed data
  }

  // Method to remove a bookmark
  Future<void> _removeBookmark(Map exercise) async {
    setState(() {
      bookmarkedExercises.removeWhere((item) => item['name'] == exercise['name']); // Remove the bookmark from the list
    });

    // Update shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> updatedBookmarks = bookmarkedExercises
        .map((exercise) => exercise['name'].toString())
        .toList(); // Convert to a list of names
    await prefs.setStringList('bookmarkedExercises', updatedBookmarks);
  }

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
            Navigator.pop(context); // Define action on back button press
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
        child: bookmarkedExercises.isEmpty
            ? Center(
                child: Text(
                  'No bookmarks added yet!',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 5,
                ),
                itemCount: bookmarkedExercises.length,
                itemBuilder: (BuildContext context, int i) {
                  return Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(bookmarkedExercises[i]["exerciseImage"]),
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
                      Container(
                        height: 180,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.all(10),
                              title: titles(
                                txt: bookmarkedExercises[i]["name"], // Use "name" here
                                Font_size: 14,
                                text_Align: TextAlign.start,
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  // Optionally handle removing the bookmark
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
                                          Container(
                                            height: 150,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              image: DecorationImage(
                                                image: AssetImage(bookmarkedExercises[i]["exerciseImage"]),
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
                                                        txt: bookmarkedExercises[i]["name"], // Use "name"
                                                        Font_size: 16,
                                                        text_Align: TextAlign.start,
                                                        txt_color: Color(int.parse(White)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
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
                                              TextButton(
                                                onPressed: () {
                                                  _removeBookmark(bookmarkedExercises[i]); // Remove the bookmark
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
    );
  }
}
