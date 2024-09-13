import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset('assets/reset_password.png')), // Insert image here
            SizedBox(height: 20),
            Text('Select which contact details should we use to reset your password'),
            SizedBox(height: 20),
            Text("Enter Your Email "),
            TextFormField(
              
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Navigate to next screen
              },
              child: Text('Continue'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
