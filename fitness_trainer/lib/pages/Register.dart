import 'package:finalproject/Business_Logic/Cubit/User_Cubit.dart';
import 'package:finalproject/Business_Logic/Cubit/User_State.dart';
import 'package:finalproject/Component/Alert_Dialog.dart';
import 'package:finalproject/Component/Snack_Bar.dart';
import 'package:finalproject/Component/Title.dart';
import 'package:finalproject/Services/FireBase_Service.dart';
import 'package:finalproject/pages/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../Component/Colors.dart';





class Register extends StatefulWidget {


  const Register({super.key});
  @override
  State<Register> createState() => _RegisterState();
}






class _RegisterState extends State<Register> with TickerProviderStateMixin {
  late final AnimationController anime_controller;
  late final Animation<double> _animation;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  late bool? isChecked = false;
  late List Delays = [250, 500, 750];

// padding control
  late double Padding_values = 10;

  // List of Logos


  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    anime_controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    _animation =
        CurvedAnimation(parent: anime_controller, curve: Curves.easeIn);
    // Run the animation once
    anime_controller.forward();
  }

  @override
  void dispose() {
    anime_controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            return Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.black,
                    child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FadeTransition(
                                opacity: _animation,
                                child: titles(txt: "Create your account")),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: Padding_values, right: Padding_values, top: 40),
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
                            ), // for email
                            Padding(
                              padding: EdgeInsets.only(
                                  left: Padding_values,
                                  right: Padding_values,
                                  top: 40,
                                  bottom: 30
                              ),
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: BlocProvider.of<UserCubit>(context).obscureText,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: "******",
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
                            ), // for password
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                const SizedBox(
                                  width: 5,
                                ),

                              ],
                            ), // For checkbox
                            const SizedBox(height: 250),
                            TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all(Color(int.parse(Purple))),
                                padding: MaterialStateProperty.all(EdgeInsets.only(
                                    left: 150, right: 150, top: 10, bottom: 10)),
                              ),
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "lora",
                                  fontWeight: FontWeight.w500,
                                  color: Color(int.parse(White)),
                                ),
                              ),
                              onPressed: () {
                                RegisterWith(emailController.text, passwordController.text,context);
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),


                          ]),
                    )
                );
          },
        )
    );
  }
}