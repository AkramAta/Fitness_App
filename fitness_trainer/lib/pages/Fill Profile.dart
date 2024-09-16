import 'package:finalproject/Business_Logic/Cubit/User_Cubit.dart';
import 'package:finalproject/Business_Logic/Cubit/User_State.dart';
import 'package:finalproject/Component/Button.dart';
import 'package:finalproject/Component/Colors.dart';
import 'package:finalproject/Component/Paragraphs.dart';
import 'package:finalproject/Component/Title.dart';
import 'package:finalproject/Constant/Widgets/costumBuildTextField.dart';
import 'package:finalproject/pages/Home_Screen.dart';
import 'package:finalproject/pages/Register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Fill_Profile extends StatelessWidget {
  late String userid;

  Fill_Profile({required this.userid});

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
                        onChanged: (value) => context
                            .read<UserCubit>()
                            .UpdateNameusercubit(value, userid),
                      ),
                      buildTextField(
                        label: "Enter surname",
                        hint: "Nickname",
                        value: BlocProvider.of<UserCubit>(context).nickName,
                        onChanged: (value) => context
                            .read<UserCubit>()
                            .UpdateNicknameusercubit(value, userid),
                      ),
                      buildTextField(
                        label: "Enter telephone number",
                        hint: "0123456789",
                        value: BlocProvider.of<UserCubit>(context).userphone,
                        onChanged: (value) => context
                            .read<UserCubit>()
                            .UpdateNumberusercubit(value, userid),
                        keyboardType: TextInputType.number,
                        suffixIcon: Icons.phone,
                        suffixStyle: TextStyle(fontSize: 20, color: Colors.red),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 115),
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
                                BlocProvider.of<UserCubit>(context).UpdateNumber(BlocProvider.of<UserCubit>(context).userphone, userid);
                                BlocProvider.of<UserCubit>(context).UpdateName(BlocProvider.of<UserCubit>(context).userName, userid);
                                BlocProvider.of<UserCubit>(context).UpdateNickname(BlocProvider.of<UserCubit>(context).nickName, userid);

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Home_Screen(userid: userid)));
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
