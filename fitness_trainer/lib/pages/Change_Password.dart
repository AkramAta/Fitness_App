import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Business_Logic/Cubit/OTP_Cubit.dart';
import '../Business_Logic/Cubit/Otp_State.dart';
import '../Business_Logic/Cubit/User_Cubit.dart';
import '../Component/Button.dart';
import '../Component/Colors.dart';
import '../Component/SizedBox_for Gapping.dart';
import '../Component/Text_Form.dart';
import '../Component/Title.dart';
import '../Component/buid_container.dart';
import '../Services/FireBase_Service.dart';

class ChangePassword extends StatelessWidget {
  final String email;
  final String oldPassword;
  final dynamic userdic;

  final TextEditingController newPasswordController = TextEditingController();

  ChangePassword({
    required this.email,
    required this.oldPassword,
    required this.userdic,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OtpCubit(), // Provide the OtpCubit
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(int.parse(Black)),
          title: titles(
            txt: 'Create New Password',
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
        body: BlocBuilder<OtpCubit, OtpState>(
          builder: (context, state) {
            final userCubit = context.read<UserCubit>();

            return buildContainer(
              padding_All_direction: 20,
              backgroundColor: Color(int.parse(Black)),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage("Assets/Image/Create-password.png"),
                      ),
                      Sized_Gap(Height: 20),
                      buildTextFormField(
                        obSecured_text: userCubit.obscureText2,
                        controller: newPasswordController,
                        focusedBorderColor: Color(int.parse(Purple)),
                        borderColor: Color(int.parse(White)),
                        contentPadding: const EdgeInsets.all(25),
                        fillColor: Colors.transparent,
                        labelText: "Enter your New password",
                        labelColor: Color(int.parse(White)),
                        hintText: "***********",
                        textColor: Color(int.parse(White)),
                        iconColor: Color(int.parse(White)),
                        suffixIcon: IconButton(
                          icon: Icon(
                            userCubit.obscureText2 ? Icons.visibility_off : Icons.visibility,
                            color: Color(int.parse(White)),
                          ),
                          onPressed: () {
                            userCubit.toggleVisibility2();
                          },
                        ),
                      ),
                    ],
                  ),
                  Sized_Gap(Height: 100),
                  buttons(
                    text: "Continue",
                    action: () async {
                      await reauthenticateAndChangePassword(
                        email: email,
                        context: context,
                        newPassword: newPasswordController.text,
                        userdic: userdic,
                        oldPassword: oldPassword,
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}