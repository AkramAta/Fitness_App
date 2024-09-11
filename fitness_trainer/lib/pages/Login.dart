import 'package:finalproject/Component/Title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../Component/Colors.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  late final AnimationController anime_controller;
  late final Animation<double> _animation;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late bool _obscureText = true;
  late bool? isChecked = false;
  late List Delays = [250, 500, 750];
// padding control
  late double Padding_values = 10;
  // List of Logos
  late List<String> Logos = [
    "Assets/Image/Facebook.png",
    "Assets/Image/Google.png",
    "Assets/Image/Apple.png"
  ];
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

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  FadeTransition(
                      opacity: _animation,
                      child: titles(
                        txt: "login to your account",
                      )),
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
                        bottom: 30),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: _obscureText,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "******",
                        labelStyle: const TextStyle(color: Colors.white),
                        contentPadding: const EdgeInsets.all(25),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.white,
                          ),
                          onPressed: _toggleVisibility,
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
                      Checkbox(
                        value: isChecked,
                        onChanged: (newBool) {
                          setState(() {
                            isChecked = newBool;
                          });
                        },
                        activeColor: Color(int.parse(Purple)),
                        fillColor: WidgetStateProperty.all(Colors.transparent),
                        splashRadius: 15,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "Remember me",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      )
                    ],
                  ), // For checkbox
                  const SizedBox(height: 15),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(int.parse(Purple))),
                      padding: MaterialStateProperty.all(EdgeInsets.only(
                          left: 150, right: 150, top: 10, bottom: 10)),
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
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                      Navigator.pushNamed(context, "Home");
                    },
                  ),
                  const SizedBox(
                    height: 22,
                  ),
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
                            )),
                      ),
                      Text(
                        "or countiune with",
                        style: TextStyle(
                            color: Color(int.parse(White)), fontSize: 15),
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
                            )),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int i = 0; i < Logos.length; i++)
                          Animate(
                            child: Container(
                              width: 80,
                              height: 85,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 5, color: Color(int.parse(Black))),
                                color: Color(0xff21242a),
                              ),
                              child: Image.asset(
                                Logos[i],
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            effects: [
                              FadeEffect(
                                  delay: Duration(milliseconds: Delays[i]),
                                  duration: Duration(seconds: 2)),
                            ],
                          )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account ? ",
                        style: TextStyle(color: Color(int.parse(Grayish))),
                      ),
                      Text(
                        "Sign up",
                        style: TextStyle(color: Color(int.parse(Purple))),
                      ),
                    ],
                  )
                ]),
          ),
        ));
  }
}
