import 'package:finalproject/Business_Logic/Cubit/User_Cubit.dart';
<<<<<<< HEAD
import 'package:finalproject/pages/Age_picker.dart';
import 'package:finalproject/pages/Forget_pass.dart';

import 'package:finalproject/pages/Goal_Screen.dart';
import 'package:finalproject/pages/Home_Screen.dart';
import 'package:finalproject/pages/Login.dart';

import 'package:finalproject/pages/OTPscreen.dart';
import 'package:finalproject/pages/Physical_activity.dart';
import 'package:finalproject/pages/Register.dart';
import 'package:finalproject/pages/Splash_screen.dart';
import 'package:finalproject/pages/Tell_us.dart';
import 'package:finalproject/pages/Welcome%20Screen.dart';
import 'package:finalproject/pages/test_page.dart';
=======
import 'package:finalproject/pages/Splash_screen.dart';
import 'package:finalproject/pages/cleander.dart';
>>>>>>> 0c7733ad9c80b51a50494444ebfb18926c7876e4
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
<<<<<<< HEAD
        home: SplashScreen(),
=======
        home: HorizontalCalendar(),
>>>>>>> 0c7733ad9c80b51a50494444ebfb18926c7876e4
      ),
    );
  }
}