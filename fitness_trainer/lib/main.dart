import 'package:finalproject/Business_Logic/Cubit/User_Cubit.dart';
import 'package:finalproject/pages/Splash_screen.dart';
import 'package:finalproject/pages/cleander.dart';
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
        home: HorizontalCalendar(),
      ),
    );
  }
}
