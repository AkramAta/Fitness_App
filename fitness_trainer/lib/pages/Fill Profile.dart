import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../Business_Logic/Cubit/User_Cubit.dart';
import '../Business_Logic/Cubit/User_State.dart';
import '../Component/Button.dart';
import '../Component/Colors.dart';
import '../Component/Paragraphs.dart';
import '../Component/Title.dart';
import '../Constant/Widgets/costumBuildTextField.dart';
import 'Home_Screen.dart';

class Fill_Profile extends StatelessWidget {
  final String userid;
  final ImagePicker _picker = ImagePicker();

  Fill_Profile({required this.userid});

  Future<String?> uploadImageToFirebase(File imageFile, String userId) async {
    try {
      final storageRef = FirebaseStorage.instance.ref().child("user_images/$userId.jpg");
      final uploadTask = await storageRef.putFile(imageFile);
      final downloadURL = await storageRef.getDownloadURL();
      return downloadURL;
    } catch (e) {
      print("Error uploading image: $e");
      return null;
    }
  }

  Future<void> _pickImageFromCamera(BuildContext context) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      File imageFile = File(image.path);
      final downloadURL = await uploadImageToFirebase(imageFile, userid);
      if (downloadURL != null) {
        BlocProvider.of<UserCubit>(context).updateimage(downloadURL, userid);
      }
    }
  }

  Future<void> _pickImageFromGallery(BuildContext context) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      File imageFile = File(image.path);
      final downloadURL = await uploadImageToFirebase(imageFile, userid);
      if (downloadURL != null) {
        BlocProvider.of<UserCubit>(context).updateimage(downloadURL, userid);
      }
    }
  }

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
                    text: "Don't worry, you can always change it or you can skip it",
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
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: 150,
                                  child: Column(
                                    children: [
                                      ListTile(
                                        leading: Icon(Icons.camera_alt),
                                        title: Text('Take a picture from camera'),
                                        onTap: () {
                                          _pickImageFromCamera(context);
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.photo_album),
                                        title: Text('Select from gallery'),
                                        onTap: () {
                                          _pickImageFromGallery(context);
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
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
                        Container(
                          width: 160,
                          child: buttons(
                            text: "Next",
                            action: () {
                              BlocProvider.of<UserCubit>(context).UpdateNumber(
                                BlocProvider.of<UserCubit>(context).userphone,
                                userid,
                              );
                              BlocProvider.of<UserCubit>(context).UpdateName(
                                BlocProvider.of<UserCubit>(context).userName,
                                userid,
                              );
                              BlocProvider.of<UserCubit>(context).UpdateNickname(
                                BlocProvider.of<UserCubit>(context).nickName,
                                userid,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Home_Screen(
                                    userid: userid,
                                    data: <String, dynamic>{},
                                  ),
                                ),
                              );
                            },
                          ),
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