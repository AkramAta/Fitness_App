import 'package:flutter/material.dart';

void snacka(BuildContext context,String text)
{
  ScaffoldMessenger.of(context).showSnackBar(

      SnackBar(content: Text(text),

        backgroundColor: Color(0xff6941ff),
        showCloseIcon: true,

      )
  );

}