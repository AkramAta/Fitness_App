import 'package:finalproject/Component/Button.dart';
import 'package:finalproject/pages/Fill%20Profile.dart';
import 'package:finalproject/pages/Login.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Component/Colors.dart';
import '../Component/Title.dart';

class Get_Started extends StatelessWidget {
  late List<String> images = [
    "Assets/Image/p_v-2.jpg",
    "Assets/Image/p_v-3.jpg"
  ];
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      // ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              children: [
                Column(
                  children: [
                    Container(
                      height:
                          400, // Adjusted the height to make room for other elements
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("Assets/Image/p_v-1.jpg"),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        width: double.infinity,
                        color: Color(int.parse(Black)),
                        child: Column(
                          children: [
                            titles(txt: "find the right"),
                            titles(txt: "workout for what"),
                            titles(txt: "you need"),
                            SizedBox(height: 20),
                            // buttons(text: "Next", action: () {})
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 400, // Adjusted the height
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("Assets/Image/p_v-2.jpg"),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        width: double.infinity,
                        color: Color(int.parse(Black)),
                        child: Column(
                          children: [
                            titles(txt: "make suitable"),
                            titles(txt: "workout and great"),
                            titles(txt: "results"),
                            const SizedBox(height: 20),
                            // buttons(text: "Next", action: () {})
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 400, // Adjusted the height
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("Assets/Image/p_v-3.jpg"),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        width: double.infinity,
                        color: Color(int.parse(Black)),
                        child: Column(
                          children: [
                            titles(txt: "let's do a workout"),
                            titles(txt: "and live healthy"),
                            titles(txt: "with us"),
                            const SizedBox(height: 20),
                            buttons(text: "Next", action: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                            })
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
              width: double.infinity,
              color: Color(int.parse(Black)),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Center(
                  child: SmoothPageIndicator(
                      controller: pageController, // PageController
                      count: 3,
                      effect: const WormEffect(),
                      onDotClicked: (index) {}),
                ),
              )),
        ],
      ),
    );
  }
}