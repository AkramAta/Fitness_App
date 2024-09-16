import 'package:finalproject/Business_Logic/Cubit/AuthenticationCubit.dart';
import 'package:finalproject/pages/Home_Screen.dart';
import 'package:finalproject/pages/Welcome%20Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthInitial) {
          return Center(child: CircularProgressIndicator());
        } else if (state is Authenticated) {
          return Home_Screen(userid: "",data: {},);
        } else if (state is Unauthenticated) {
          return WelcomeScreen();
        }
        return Container(); // Fallback in case of an unhandled state
      },
    );
  }
}
