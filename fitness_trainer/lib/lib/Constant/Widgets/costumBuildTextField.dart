import 'package:finalproject/Component/Colors.dart';
import 'package:flutter/material.dart';

Widget buildTextField({
    required String label,
    required String hint,
    required String value,
    required Function(String) onChanged,
    TextInputType? keyboardType,
    IconData? suffixIcon,
    String? suffixText,
    TextStyle? suffixStyle,
  }) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        keyboardType: keyboardType,
        initialValue: value,
        onChanged: onChanged,
        style: TextStyle(fontSize: 20, color: Color(int.parse(White))),
        decoration: InputDecoration(
          suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
          suffixText: suffixText,
          suffixStyle: suffixStyle,
          filled: true,
          labelStyle: TextStyle(color: Colors.grey),
          fillColor: Color(int.parse(Black)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Color(int.parse(Grayish))),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Color(int.parse(Grayish))),
          ),
          hintText: hint,
          contentPadding: EdgeInsets.all(20),
          labelText: label,
        ),
      ),
    );
  }

