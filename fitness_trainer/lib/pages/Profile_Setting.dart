import 'package:finalproject/Component/SizedBox_for%20Gapping.dart';
import 'package:finalproject/Component/buid_container.dart';
import 'package:finalproject/pages/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Component/Colors.dart';
import '../Component/Title.dart';
import 'Edit_Profile.dart';
import 'Notification_Settings.dart';
import 'Notification_page.dart';
import 'Security.dart';
class Profile_Setting extends StatefulWidget {
  final String userid;
  final Map <String, dynamic> userdata;
  Profile_Setting({required this.userid,required this.userdata});
  @override
  State<Profile_Setting> createState() => _Profile_SettingState();
}




class _Profile_SettingState extends State<Profile_Setting> {
  late int Current_Index = 3;    // for index of bottom navigator bar
  late String userName ; // put username here !
  late String userGmail ; // put usergmail here !

  @override
  void initState() {
    super.initState();
    userName = widget.userdata["nickName"];
    userGmail =widget.userdata["email"];
    String userid = widget.userid;
     Map userdata = widget.userdata;

  }

  late List <Map> Data_LIstTiles =[
    {
      "title": "Edit Profile",
      "icon" : Icons.person,
    },
    {
      "title": "Notifications",
      "icon" : FontAwesomeIcons.bell,
    },
    {
      "title": "Security",
      "icon" : Icons.security,
    },
    {
      "title": "Help",
      "icon" : Icons.help,
    },
  ];
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
            txt: "Profile",
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
          backgroundColor: Color(int.parse(Black)),
          padding_All_direction: 20,
          child: Column(
            children: [
              Sized_Gap(Height: 20),
              Column(
                children: [
                  Stack(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('Assets/Image/profile.png'),
                          backgroundColor: Colors.transparent,
                          radius: 80,
                        ),
                        Positioned(
                          left: 110,
                          bottom: 5,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(int.parse(Purple)),
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color: Color(int.parse(Purple)),
                                )
                            ),
                            child: IconButton(
                              icon: Icon(Icons.edit),
                              color: Color(
                                int.parse(White),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ]),
                  titles(txt: userName , Font_size: 20),
                  titles(txt: userGmail , Font_size: 20),
                ],
              ),
              Sized_Gap(Height: 20),
              SizedBox(
                height: 2,
                width: 350,
                child: Divider(
                  color: Color(int.parse(White)),
                  thickness: 0.25,
                ),
              ),
              for(int i = 0; i<Data_LIstTiles.length; i++)
              ListTile(
                onTap: (){
                  if(Data_LIstTiles[i]["title"] == "Edit Profile")
                  {
                    print(widget.userdata);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Edit_Profile(userid: widget.userid,userdata:widget.userdata,)));
                  } else if(Data_LIstTiles[i]["title"] == "Notifications")
                  {
                    print(widget.userdata);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationSettings()));
                  }else if(Data_LIstTiles[i]["title"] == "Security")
                    {
                      print(widget.userdata);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Security_Settings(userid: widget.userid,data: widget.userdata,)));


                    }
                },
                contentPadding: EdgeInsets.all(0),
                leading: IconButton(
                    onPressed: (){

                    },
                    icon:
                    Icon(Data_LIstTiles[i]["icon"] , color: Color(int.parse(White)),)
                ),
                title: titles(txt:Data_LIstTiles[i]["title"]
                    , Font_size: 20,
                    text_Align: TextAlign.start
                ),
              ),
              ListTile(
                onTap: (){},
                contentPadding: EdgeInsets.all(0),
                leading: IconButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.of(context).push(MaterialPageRoute(builder:  (context) => Login()));
                    },
                    icon:
                    Icon(FontAwesomeIcons.rightFromBracket, color: Colors.red,)
                ),
                title: titles(txt:"Logout"
                    , Font_size: 20,
                    txt_color: Colors.red,
                    text_Align: TextAlign.start
                ),
              ),
              Spacer(),
              
            ],
          ),

      ),
    );
  }
}
