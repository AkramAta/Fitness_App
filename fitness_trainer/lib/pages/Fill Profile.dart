// import 'package:finalproject/Component/Button.dart';
// import 'package:finalproject/Component/Colors.dart';
// import 'package:finalproject/Component/Paragraphs.dart';
// import 'package:finalproject/Component/Title.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';

// class Fill_Profile extends StatefulWidget {
//   @override
//   State<Fill_Profile> createState() => _Fill_ProfileState();
// }

// class _Fill_ProfileState extends State<Fill_Profile> {
//   late TextEditingController Text_name = TextEditingController();
//   late TextEditingController Text_SurName = TextEditingController();
//   late TextEditingController Text_Email = TextEditingController();
//   late TextEditingController Text_Number = TextEditingController();
//   late double Text_padding = 10; // padding of between text Filed
//   late Color Icon_color = Color(int.parse(White)); // Mail_icon of Txt-Field
//   // late FocusNode Icon = FocusNode();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(int.parse(Black)),
//       ),
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         color: Color(int.parse(Black)),
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Animate(
//                 effects: [
//                   FadeEffect(
//                     duration: Duration(seconds: 5),
//                   )
//                 ],
//                 child: titles(txt: "Fill your profile"),
//               ),
//               Animate(
//                 effects: [
//                   FadeEffect(
//                       duration: Duration(seconds: 5),
//                       delay: Duration(milliseconds: 500))
//                 ],
//                 child: paragraph(
//                     text:
//                         "don't worry you can always change it or you can skip it",
//                     color: Color(int.parse(Grayish))),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               Stack(children: [
//                 CircleAvatar(
//                   backgroundImage: AssetImage('Assets/Image/profile.png'),
//                   backgroundColor: Colors.transparent,
//                   radius: 80,
//                 ),
//                 Positioned(
//                   left: 120,
//                   bottom: 20,
//                   child: IconButton(
//                     icon: Icon(Icons.edit),
//                     color: Color(
//                       int.parse(Purple),
//                     ),
//                     onPressed: () {},
//                   ),
//                 )
//               ]),
//               Animate(
//                 effects: [
//                   SlideEffect(
//                       curve: Curves.easeInOut,
//                       begin: Offset(-1, 0),
//                       duration: Duration(seconds: 1))
//                 ],
//                 child: Padding(
//                   padding: EdgeInsets.all(Text_padding),
//                   child: TextFormField(
//                     controller: Text_name,
//                     style: TextStyle(
//                         fontSize: 20,
//                         color: Color(
//                           int.parse(White),
//                         )),
//                     decoration: InputDecoration(
//                         filled: true,
//                         labelStyle: TextStyle(color: Colors.grey),
//                         fillColor: Color(int.parse(Black)),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               width: 2, color: Color(int.parse(Grayish))),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               width: 2, color: Color(int.parse(Grayish))),
//                         ),
//                         hintText: "john",
//                         contentPadding: EdgeInsets.all(20),
//                         labelText: "Enter name"),
//                   ),
//                 ),
//               ),
//               Animate(
//                 effects: [
//                   SlideEffect(
//                       curve: Curves.easeInOut,
//                       begin: Offset(-1, 0),
//                       delay: Duration(milliseconds: 500),
//                       duration: Duration(seconds: 1))
//                 ],
//                 child: Padding(
//                   padding: EdgeInsets.all(Text_padding),
//                   child: TextFormField(
//                     controller: Text_SurName,
//                     style: TextStyle(
//                         fontSize: 20,
//                         color: Color(
//                           int.parse(White),
//                         )),
//                     decoration: InputDecoration(
//                         filled: true,
//                         labelStyle: TextStyle(color: Colors.grey),
//                         fillColor: Color(int.parse(Black)),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               width: 2, color: Color(int.parse(Grayish))),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               width: 2, color: Color(int.parse(Grayish))),
//                         ),
//                         hintText: "doe",
//                         contentPadding: EdgeInsets.all(20),
//                         labelText: "Enter surname"),
//                   ),
//                 ),
//               ),
//               Animate(
//                 effects: [
//                   SlideEffect(
//                       curve: Curves.easeInOut,
//                       begin: Offset(-1, 0),
//                       delay: Duration(milliseconds: 750),
//                       duration: Duration(seconds: 1))
//                 ],
//                 child: Padding(
//                   padding: EdgeInsets.all(Text_padding),
//                   child: TextFormField(
//                     controller: Text_Email,
//                     style: TextStyle(
//                         fontSize: 20,
//                         color: Color(
//                           int.parse(White),
//                         )),
//                     decoration: InputDecoration(
//                         suffixIcon: Icon(Icons.mail),
//                         suffixIconColor: Icon_color,
//                         filled: true,
//                         labelStyle: TextStyle(color: Colors.grey),
//                         fillColor: Color(int.parse(Black)),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               width: 2, color: Color(int.parse(Grayish))),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               width: 2, color: Color(int.parse(Purple))),
//                         ),
//                         hintText: "Example@Gmail.com",
//                         contentPadding: EdgeInsets.all(20),
//                         labelText: "Enter Email"),
//                     onTap: () {

//                       setState(() {
//                         if (Icon_color == Color(int.parse(White))) {
//                           Icon_color = Color(int.parse(Purple));
//                         } else {
//                           Icon_color = Color(int.parse(White));
//                         }
//                       });
//                     },
//                   ),
//                 ),
//               ),
//               Animate(
//                 effects: [
//                   SlideEffect(
//                       curve: Curves.easeInOut,
//                       begin: Offset(-1, 0),
//                       delay: Duration(milliseconds: 1000),
//                       duration: Duration(seconds: 1))
//                 ],
//                 child: Padding(
//                   padding: EdgeInsets.all(Text_padding),
//                   child: TextFormField(
//                     keyboardType: TextInputType.number,
//                     controller: Text_Number,
//                     style: TextStyle(
//                         fontSize: 20,
//                         color: Color(
//                           int.parse(White),
//                         )),
//                     decoration: InputDecoration(
//                         filled: true,
//                         labelStyle: TextStyle(color: Colors.grey),
//                         fillColor: Color(int.parse(Black)),
//                         suffixText: "\u{1F1FA}\u{1F1F8}",
//                         suffixStyle: TextStyle(fontSize: 20, color: Colors.red),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               width: 2, color: Color(int.parse(Grayish))),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               width: 2, color: Color(int.parse(Grayish))),
//                         ),
//                         hintText: "555***-***",
//                         contentPadding: EdgeInsets.all(20),
//                         labelText: "Enter telephone-number"),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(10),
//                 child: Expanded(
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           width: 190,
//                           child: buttons(
//                               text: "skip",
//                               action: () {},
//                               colour: Colors.white10),
//                         ),
//                         Container(
//                           width: 190,
//                           child: buttons(
//                             text: "Next",
//                             action: () {},
//                           ),
//                         ),
//                       ]),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:finalproject/Business_Logic/Cubit/User_Cubit.dart';
import 'package:finalproject/Business_Logic/Cubit/User_State.dart';
import 'package:finalproject/Component/Button.dart';
import 'package:finalproject/Component/Colors.dart';
import 'package:finalproject/Component/Paragraphs.dart';
import 'package:finalproject/Component/Title.dart';
import 'package:finalproject/Constant/Widgets/costumBuildTextField.dart';
import 'package:finalproject/pages/Register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Fill_Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(int.parse(Black)),
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            color: Color(int.parse(Black)),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  titles(txt: "Fill your profile"),
                  paragraph(
                    text:
                        "Don't worry, you can always change it or you can skip it",
                    color: Color(int.parse(Grayish)),
                  ),
                  SizedBox(height: 30),
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('Assets/Image/profile.png'),
                        backgroundColor: Colors.transparent,
                        radius: 80,
                      ),
                      Positioned(
                        left: 120,
                        bottom: 20,
                        child: IconButton(
                          icon: Icon(Icons.edit),
                          color: Color(int.parse(Purple)),
                          onPressed: () {

                            // BlocProvider.of<UserCubit>(context).UpdateImage();
                          },
                        ),
                      )
                    ],
                  ),
                   Column(
                        children: [
                          buildTextField(
                            label: "Enter name",
                            hint: "Name",
                            value: BlocProvider.of<UserCubit>(context).userName,
                            suffixIcon: Icons.person,
                            keyboardType: TextInputType.name,
                            onChanged: (value) =>
                                context.read<UserCubit>().UpdateName(value),
                          ),
                          buildTextField(
                            label: "Enter surname",
                            hint: "Nickname",
                            value: BlocProvider.of<UserCubit>(context).nickName,
                            onChanged: (value) =>
                                context.read<UserCubit>().UpdateNickname(value),
                          ),
                          buildTextField(
                            label: "Enter Email",
                            hint: "example@gmail.com",
                            value: BlocProvider.of<UserCubit>(context).email,
                            onChanged: (value) =>
                                context.read<UserCubit>().UpdateEmail(value),
                            suffixIcon: Icons.mail,
                          ),
                          buildTextField(
                            label: "Enter telephone number",
                            hint: "0123456789",
                            value:
                                BlocProvider.of<UserCubit>(context).userphone,
                            onChanged: (value) =>
                                context.read<UserCubit>().UpdateNumber(value),
                            keyboardType: TextInputType.number,
                            suffixIcon: Icons.phone,
                            suffixStyle:
                                TextStyle(fontSize: 20, color: Colors.red),
                          ),
                        ],
                      ),
                    
                  
                  Padding(
                    padding: EdgeInsets.only(top: 10,left: 115),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Container(
                        //   width: 190,
                        //   child: buttons(
                        //       text: "Skip",
                        //       action: () {},
                        //       colour: Colors.white10),
                        // ),
                        
                        Container(
                          width: 160,
                          child: buttons(
                              text: "Next",
                              action: () {
                                // print(
                                //     BlocProvider.of<UserCubit>(context).email);
                                // print(BlocProvider.of<UserCubit>(context)
                                //     .userphone);
                                // print(BlocProvider.of<UserCubit>(context)
                                //     .userName);
                                // print(BlocProvider.of<UserCubit>(context)
                                //     .nickName);
                                // Navigator.pushNamed(context, "Register");
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
