import 'package:finalproject/Component/Button.dart';
import 'package:finalproject/Component/Paragraphs.dart';
import 'package:finalproject/Component/SizedBox_for%20Gapping.dart';
import 'package:finalproject/Component/buid_container.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter/material.dart';
import '../Component/Colors.dart';
import '../Component/Title.dart';
class Forget_Pass extends StatelessWidget {
  late String Gmail = "my******@gmail.com"; // add the user gmail here
  late int Timer= 59; // add Timer here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(int.parse(Black)),
        title: titles(
            txt: 'Forgot Password',
            text_Align: TextAlign.start,
            Font_size: 20),
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
      body:buildContainer(
        padding_All_direction: 50,
        backgroundColor: Color(int.parse(Black)),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            paragraph(
              text: "code sent to ${Gmail}"
            ,color: Color(int.parse(White)),
              Font_size: 20,
            ),
            Sized_Gap(Height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 64,
                  height:64 ,
                  child:TextFormField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(int.parse(White))
                    ),
                    onChanged: (value){
                      if(value.length ==1 ){
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "X",
                      enabledBorder:OutlineInputBorder(
                          borderSide: BorderSide(
                              color:Color(int.parse(White))
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color:Color(int.parse(Purple))
                        )
                      )
                    ),
                    inputFormatters: [LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                    ],
                  ) ,
                ),
                SizedBox(
                  width: 64,
                  height:64 ,
                  child:TextFormField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(int.parse(White))
                    ),
                    onChanged: (value){
                      if(value.length ==1 ){
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "X",
                        enabledBorder:OutlineInputBorder(
                            borderSide: BorderSide(
                                color:Color(int.parse(White))
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:Color(int.parse(Purple))
                            )
                        )
                    ),
                    inputFormatters: [LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ) ,
                ),
                SizedBox(
                  width: 64,
                  height:64 ,
                  child:TextFormField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(int.parse(White))
                    ),
                    onChanged: (value){
                      if(value.length ==1 ){
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "X",
                        enabledBorder:OutlineInputBorder(
                            borderSide: BorderSide(
                                color:Color(int.parse(White))
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:Color(int.parse(Purple))
                            )
                        )
                    ),
                    inputFormatters: [LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ) ,
                ),
                SizedBox(
                  width: 64,
                  height:64 ,
                  child:TextFormField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(int.parse(White))
                    ),
                    onChanged: (value){
                      if(value.length ==1 ){
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "X",
                        enabledBorder:OutlineInputBorder(
                            borderSide: BorderSide(
                                color:Color(int.parse(White))
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:Color(int.parse(Purple))
                            )
                        )
                    ),
                    inputFormatters: [LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ) ,
                ),
              ]
            ),
            Sized_Gap(Height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  paragraph(
                    text: "Resend code in   "
                    ,color: Color(int.parse(White)),
                    Font_size: 20,
                  ),
                  paragraph(
                    text: "${Timer}"
                    ,color: Color(int.parse(Purple)),
                    Font_size: 20,
                  ),
                ],
              ),
            Spacer(),
            buttons(text: "Verify",
              action:() {},
              Pad_Left_Right: 115
            )
          ],
        )
      ),
    );
  }
}