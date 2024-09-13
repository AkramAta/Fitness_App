import 'package:finalproject/Component/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget buildOtpTextField(TextEditingController c, BuildContext context) {
    return SizedBox(
      width: 64,
      height: 64,
      child: TextFormField(
        controller: c,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          color: Color(int.parse(White)),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        decoration: InputDecoration(
          hintText: "X",
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(int.parse(White)),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(int.parse(Purple)),
            ),
          ),
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }

