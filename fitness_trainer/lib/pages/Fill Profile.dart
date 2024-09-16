import 'package:finalproject/Business_Logic/Cubit/User_Cubit.dart';
import 'package:finalproject/Business_Logic/Cubit/User_State.dart';
import 'package:finalproject/Component/Button.dart';
import 'package:finalproject/Component/Colors.dart';
import 'package:finalproject/Component/Paragraphs.dart';
import 'package:finalproject/Component/Title.dart';
import 'package:finalproject/Constant/Widgets/costumBuildTextField.dart';
import 'package:finalproject/pages/Home_Screen.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class Fill_Profile extends StatefulWidget {
  late String userid;

  Fill_Profile({required this.userid});

  @override
  State<Fill_Profile> createState() => _Fill_ProfileState();
}

class _Fill_ProfileState extends State<Fill_Profile> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  String? downloadURL; // Add this line to declare the class-level variable

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

  Future<void> _pickImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      File imageFile = File(image.path);
      setState(() {
        _image = imageFile;
      });
      downloadURL = await uploadImageToFirebase(imageFile, widget.userid); // Assign to class-level variable
      if (downloadURL != null) {
        BlocProvider.of<UserCubit>(context).updateimage(downloadURL!, widget.userid);
      }
    }
  }

  Future<void> _pickImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      File imageFile = File(image.path);
      setState(() {
        _image = imageFile;
      });
      downloadURL = await uploadImageToFirebase(imageFile, widget.userid); // Assign to class-level variable
      if (downloadURL != null) {
        BlocProvider.of<UserCubit>(context).updateimage(downloadURL!, widget.userid);
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
                                          _pickImageFromCamera();
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.photo_album),
                                        title: Text('Select from gallery'),
                                        onTap: () {
                                          _pickImageFromGallery();
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
                            .UpdateNameusercubit(value, widget.userid),
                      ),
                      buildTextField(
                        label: "Enter surname",
                        hint: "Nickname",
                        value: BlocProvider.of<UserCubit>(context).nickName,
                        onChanged: (value) => context
                            .read<UserCubit>()
                            .UpdateNicknameusercubit(value, widget.userid),
                      ),
                      buildTextField(
                        label: "Enter telephone number",
                        hint: "0123456789",
                        value: BlocProvider.of<UserCubit>(context).userphone,
                        onChanged: (value) => context
                            .read<UserCubit>()
                            .UpdateNumberusercubit(value, widget.userid),
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
                              BlocProvider.of<UserCubit>(context)
                                  .UpdateNumber(
                                BlocProvider.of<UserCubit>(context)
                                    .userphone,
                                widget.userid,
                              );
                              BlocProvider.of<UserCubit>(context).UpdateName(
                                  BlocProvider.of<UserCubit>(context)
                                      .userName,
                                  widget.userid);
                              BlocProvider.of<UserCubit>(context).UpdateNickname(
                                  BlocProvider.of<UserCubit>(context)
                                      .nickName,
                                  widget.userid);
                              if (downloadURL != null) {
                                BlocProvider.of<UserCubit>(context)
                                    .updateimage(downloadURL!, widget.userid);
                              }
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home_Screen(
                                        userid: widget.userid,
                                        data: <String, dynamic>{},
                                      )));
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