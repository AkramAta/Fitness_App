import 'package:finalproject/Business_Logic/Cubit/User_Cubit.dart';
import 'package:finalproject/Business_Logic/Cubit/User_State.dart';
import 'package:finalproject/Component/Title.dart';
import 'package:finalproject/Services/FireBase_Service.dart';
import 'package:finalproject/pages/Forget_pass.dart';
import 'package:finalproject/pages/Register.dart';
import 'package:finalproject/pages/Tell_us.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Component/Colors.dart';

class Login extends StatelessWidget {
  late String userid;
  final List Delays = [250, 500, 750];
  final double Padding_values = 10;
  final List<String> Logos = [
    "Assets/Image/Facebook.png",
    "Assets/Image/Google.png",
    "Assets/Image/Apple.png"
  ];
  String spe ="";
  List listtoken=[];

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(int.parse(Black)),
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Color(int.parse(Black)),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Using AnimatedOpacity instead of FadeTransition
                  AnimatedOpacity(
                    opacity: 1.0, // Fully visible
                    duration: const Duration(seconds: 3), // Duration of fade-in
                    child: titles(
                      Font_size: 30,
                      txt: "Login to your account",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: Padding_values,
                      right: Padding_values,
                      top: 40,
                    ),
                    child: TextFormField(
                      controller: emailController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: "Example@gmail.com",
                        labelStyle: TextStyle(color: Colors.white),
                        suffixIcon: Icon(
                          Icons.mail,
                          color: Colors.white,
                        ),
                        contentPadding: EdgeInsets.all(25),
                        labelText: "Enter your gmail",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: Padding_values,
                      right: Padding_values,
                      top: 20,
                      bottom: 10,
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: BlocProvider.of<UserCubit>(context).obscureText,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(color: Colors.white),
                        contentPadding: const EdgeInsets.all(25),
                        suffixIcon: IconButton(
                          icon: Icon(
                            BlocProvider.of<UserCubit>(context).obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.white,
                          ),
                          onPressed: BlocProvider.of<UserCubit>(context).toggleVisibility,
                        ),
                        labelText: "Enter your password",
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordScreen()));
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Color(int.parse(Purple)),
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: BlocProvider.of<UserCubit>(context).isChecked,
                        onChanged: (newBool) {
                          BlocProvider.of<UserCubit>(context).Check(newBool!);
                        },
                        activeColor: Color(int.parse(Purple)),
                        fillColor: WidgetStateProperty.all(Colors.transparent),
                        splashRadius: 15,
                      ),
                      const Text(
                        "Remember me",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(int.parse(Purple))),
                      padding: MaterialStateProperty.all(EdgeInsets.only(
                        left: 150,
                        right: 150,
                        top: 5,
                        bottom: 5,
                      )),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: "lora",
                        fontWeight: FontWeight.w500,
                        color: Color(int.parse(White)),
                      ),
                    ),
                    onPressed: () async {
                       loginUser(emailController.text,passwordController.text,context,listtoken,spe);

                    },
                  ),
                  const SizedBox(height: 22),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 100,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Divider(
                            height: 30,
                            thickness: 0.5,
                            endIndent: 1,
                            indent: 1,
                          ),
                        ),
                      ),
                      Text(
                        "or continue with",
                        style: TextStyle(
                          color: Color(int.parse(White)),
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        width: 100,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Divider(
                            height: 30,
                            thickness: 0.5,
                            endIndent: 1,
                            indent: 1,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      color: Colors.black,
                      margin: EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 5),
                      padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 50),
                      child: InkWell(
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                        },
                        child: ListTile(
                          onTap: () {
                            signInWithGoogle();
                          },
                          title: Text(
                            "Continue with Google",
                            style: TextStyle(
                              color: Color(int.parse(White)),
                              fontSize: 14,
                            ),
                          ),
                          leading: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 20,
                            backgroundImage: AssetImage("Assets/Image/Google.png"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(color: Color(int.parse(Grayish))),
                      ),


                        TextButton(
                          child: Text(
                            "Sign up",
                          style: TextStyle(color: Color(int.parse(Purple))),
                          ),
                          onPressed: () {
                            emailController.clear();
                            passwordController.clear();
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                          },

                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}