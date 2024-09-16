import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

// Function that requires context for showing the dialog
AwesomeDialog showDialogWithContext(BuildContext context,String text) {
  return AwesomeDialog(
    context: context,
    animType: AnimType.scale, // Use scale animation for minimal effect or omit this line
    dialogType: DialogType.success,
    dialogBackgroundColor: Color(0xff6941ff),
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    customHeader: Center(
      child: Icon(
        Icons.check_circle,
        size: 110,
        color: Colors.black,
      ),
    ),
    body: Center(
      child: Text(
        text,
        style: TextStyle(
          fontStyle: FontStyle.italic,
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    ),
    btnOkOnPress: () {},
    btnOkText: 'OK',
    btnOkColor: Colors.black,
    buttonsTextStyle: TextStyle(color: Colors.white),
  )..show();
}

// Function that can be called without context
void showDialog() {
  // This is just a placeholder. You need to provide a valid BuildContext to actually show the dialog.
  // Use this function with caution; it will not show a dialog without context.
  print('Cannot show dialog without context.');
}




void snacka(BuildContext context,String text)
{
  ScaffoldMessenger.of(context).showSnackBar(

      SnackBar(content: Text(text),

        backgroundColor: Color(0xff6941ff),
        showCloseIcon: true,

      )
  );

}

