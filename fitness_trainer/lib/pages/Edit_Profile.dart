import 'package:finalproject/Component/Button.dart';
import 'package:finalproject/Component/SizedBox_for%20Gapping.dart';
import 'package:finalproject/Component/buid_container.dart';
import 'package:flutter/material.dart';
import '../Component/Colors.dart';
import '../Component/Text_Form.dart';
import '../Component/Title.dart';

class Edit_Profile extends StatefulWidget {
  @override
  _Edit_ProfileState createState() => _Edit_ProfileState();
}

class _Edit_ProfileState extends State<Edit_Profile> {
  // Controllers
  late TextEditingController Name = TextEditingController();
  late TextEditingController Sur_Name = TextEditingController();
  late TextEditingController Birth_date = TextEditingController();
  late TextEditingController Gmail = TextEditingController();
  late TextEditingController Phone = TextEditingController();
  // Dropdown initial values
  String selectedCountry = "Egypt";
  String selectedGender = "Male"; // Initial gender value
  // Country list
  final List<String> countries = [
    'Egypt',
    'United States',
    'Canada',
    'Germany',
    'Japan',
  ];
  // Gender list
  final List<String> genders = [
    'Male',
    'Female',
  ];
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
                buildTextFormField(  // Text_Field Function
                  controller: Name,
                  Changed: (v) {
                    return v;
                  },
                  Tapped: () {},
                  labelText: "Name",
                  obSecured_text: false,
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: Icon(Icons.person)),
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
                buildTextFormField(  // Text_Field Function
                  controller: Sur_Name,
                  Changed: (v) {
                    return v;
                  },
                  Tapped: () {},
                  labelText: "Surname",
                  obSecured_text: false,
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: Icon(Icons.person)),
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
                buildTextFormField(  // Text_Field Function
                  controller: Gmail,
                  Changed: (v) {
                    return v;
                  },
                  Tapped: () {},
                  labelText: "Gmail",
                  obSecured_text: false,
                  suffixIcon: IconButton(
                  onPressed: () {}, icon: Icon(Icons.mail)),
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
                  controller: Phone,
                  style: TextStyle(
                    color: Color(int.parse(White)),
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    labelText: "Phone_number",
                    labelStyle: TextStyle(
                      color: Color(int.parse(White))
                    ),
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
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  child: DropdownButton<String>(
                    value: selectedCountry,
                    dropdownColor: Colors.grey[800],
                    icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                    isExpanded: true,
                    underline: SizedBox(), // Remove default underline
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
                    border: Border.all(
                      color: Color(int.parse(White)),
                    ),
                  ),
                  child: DropdownButton<String>(
                    value: selectedGender,
                    dropdownColor: Colors.grey[800],
                    icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                    isExpanded: true,
                    underline: SizedBox(), // Remove default underline
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
                    action: (){},
                    Pad_Left_Right: 140,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}