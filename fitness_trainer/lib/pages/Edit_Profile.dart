import 'package:flutter/material.dart';
import '../Component/Button.dart';
import '../Component/Colors.dart';
import '../Component/SizedBox_for Gapping.dart';
import '../Component/Text_Form.dart';
import '../Component/Title.dart';
import '../Component/buid_container.dart';
import '../Services/FireBase_Service.dart';
import 'Profile_Setting.dart';

class Edit_Profile extends StatefulWidget {
  final String userid;
  final Map<String, dynamic> userdata;

  Edit_Profile({required this.userid, required this.userdata});

  @override
  _Edit_ProfileState createState() => _Edit_ProfileState();
}

class _Edit_ProfileState extends State<Edit_Profile> {
  late TextEditingController nameController;
  late TextEditingController usernameController;
  late TextEditingController genderController;
  late TextEditingController gmailController;
  late TextEditingController phoneController;

  String selectedCountry = "Egypt";
  String selectedGender = "Male"; // Initial gender value

  final List<String> countries = [
    'Egypt',
    'United States',
    'Canada',
    'Germany',
    'Japan',
  ];

  final List<String> genders = [
    'Male',
    'Female',
  ];

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.userdata["name"] ?? "");
    usernameController = TextEditingController(text: widget.userdata["nickName"] ?? "");
    genderController = TextEditingController(text: widget.userdata["gender"] ?? "");
    gmailController = TextEditingController(text: widget.userdata["email"] ?? "");
    phoneController = TextEditingController(text: widget.userdata["phone"] ?? "");
    selectedGender = widget.userdata["gender"] ?? "Male";
  }

  @override
  void dispose() {

    nameController.dispose();
    usernameController.dispose();
    genderController.dispose();
    gmailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(int.parse(Black)),
        title: titles(
          txt: 'Edit Profile',
          text_Align: TextAlign.start,
          Font_size: 20,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(int.parse(White)),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: buildContainer(
        padding_All_direction: 20,
        backgroundColor: Color(int.parse(Black)),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Column(
              children: [
                buildTextFormField(
                  controller: nameController,
                  Changed: (v) => v,
                  Tapped: () {},
                  labelText: "Name",
                  obSecured_text: false,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.person),
                  ),
                  hintText: 'John',
                  fillColor: Colors.black.withOpacity(0),
                  focusedBorderColor: Color(int.parse(Purple)),
                  labelColor: Color(int.parse(White)),
                  iconColor: Color(int.parse(White)),
                  fontSize: 20,
                  contentPadding: EdgeInsets.all(20),
                  textColor: Color(int.parse(White)),
                ),
                Sized_Gap(Height: 20),
                buildTextFormField(
                  controller: usernameController,
                  Changed: (v) => v,
                  Tapped: () {},
                  labelText: "Username",
                  obSecured_text: false,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.person),
                  ),
                  hintText: 'Doe',
                  fillColor: Colors.black.withOpacity(0),
                  focusedBorderColor: Color(int.parse(Purple)),
                  labelColor: Color(int.parse(White)),
                  iconColor: Color(int.parse(White)),
                  fontSize: 20,
                  contentPadding: EdgeInsets.all(20),
                  textColor: Color(int.parse(White)),
                ),
                Sized_Gap(Height: 20),
                buildTextFormField(
                  controller: gmailController,
                  Changed: (v) => v,
                  Tapped: () {},
                  labelText: "Gmail",
                  obSecured_text: false,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.mail),
                  ),
                  hintText: 'John_doe@gmail.com',
                  fillColor: Colors.black.withOpacity(0),
                  focusedBorderColor: Color(int.parse(Purple)),
                  labelColor: Color(int.parse(White)),
                  iconColor: Color(int.parse(White)),
                  fontSize: 20,
                  contentPadding: EdgeInsets.all(20),
                  textColor: Color(int.parse(White)),
                ),
                Sized_Gap(Height: 30),
                TextFormField(
                  controller: phoneController,
                  style: TextStyle(
                    color: Color(int.parse(White)),
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    labelText: "Phone number",
                    labelStyle: TextStyle(color: Color(int.parse(White))),
                    hintText: "012********",
                    suffixIcon: Icon(Icons.numbers),
                    suffixIconColor: Color(int.parse(White)),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(int.parse(Purple)), // Focus color
                      ),
                    ),
                  ),
                ),
                Sized_Gap(Height: 30),
                // Country dropdown
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white),
                  ),
                  child: DropdownButton<String>(
                    value: selectedCountry,
                    dropdownColor: Colors.grey[800],
                    icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                    isExpanded: true,
                    underline: SizedBox(),
                    style: TextStyle(
                      color: Color(int.parse(White)),
                      fontSize: 18,
                    ),
                    items: countries.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCountry = newValue!;
                      });
                    },
                  ),
                ),
                Sized_Gap(Height: 30),
                // Gender dropdown
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(int.parse(White))),
                  ),
                  child: DropdownButton<String>(
                    value: selectedGender,
                    dropdownColor: Colors.grey[800],
                    icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                    isExpanded: true,
                    underline: SizedBox(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    items: genders.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedGender = newValue!;
                      });
                    },
                  ),
                ),
                Sized_Gap(Height: 130),
                buttons(
                  text: "Verify",
                  action: () {
                    if (nameController.text != widget.userdata["name"] ||
                        genderController.text != widget.userdata["gender"] ||
                        phoneController.text != widget.userdata["phone"] ||
                        gmailController.text != widget.userdata["email"] ||
                        usernameController.text != widget.userdata["nickName"]) {

                      if (nameController.text != widget.userdata["name"]) {
                        updateUserField(
                          userId: widget.userid,
                          fieldKey: "name",
                          newValue: nameController.text,
                        );
                        widget.userdata["name"] = nameController.text;
                      }

                      if (selectedGender != widget.userdata["gender"]) {
                        updateUserField(
                          userId: widget.userid,
                          fieldKey: "gender",
                          newValue: selectedGender,
                        );
                        widget.userdata["gender"] = selectedGender;
                      }

                      if (phoneController.text != widget.userdata["phone"]) {
                        updateUserField(
                          userId: widget.userid,
                          fieldKey: "phone",
                          newValue: phoneController.text,
                        );
                        widget.userdata["phone"] = phoneController.text;
                      }

                      if (gmailController.text != widget.userdata["email"]) {
                        updateUserField(
                          userId: widget.userid,
                          fieldKey: "email",
                          newValue: gmailController.text,
                        );
                        widget.userdata["email"] = gmailController.text;
                      }

                      if (usernameController.text != widget.userdata["nickName"]) {
                        updateUserField(
                          userId: widget.userid,
                          fieldKey: "nickName",
                          newValue: usernameController.text,
                        );
                        widget.userdata["nickName"] = usernameController.text;
                      }
                    }

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Profile_Setting(
                          userdata: widget.userdata,
                          userid: widget.userid,
                        )));
                  },
                  Pad_Left_Right: 140,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}