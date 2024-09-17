import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Component/awesome_dialog.dart';
import '../Component/Alert_Dialog.dart';
import '../Component/Colors.dart';
import '../Component/Text_Form.dart';
import '../Component/Title.dart';
import '../Services/FireBase_Service.dart';
import 'package:finalproject/Component/awesome_dialog.dart' as awesome_dialog;

class ChangePasswordSecurity extends StatefulWidget {
  final String userid;
  final Map<String, dynamic> data;

  ChangePasswordSecurity({
    required this.userid,
    required this.data,
  });

  @override
  _ChangePasswordSecurityState createState() => _ChangePasswordSecurityState();
}

class _ChangePasswordSecurityState extends State<ChangePasswordSecurity> {
  late FocusNode _oldPasswordFocusNode;
  late FocusNode _newPasswordFocusNode;
  late FocusNode _confirmPasswordFocusNode;

  late TextEditingController _oldPasswordController;
  late TextEditingController _newPasswordController;
  late TextEditingController _confirmPasswordController;

  bool _isOldPasswordVisible = false;
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _oldPasswordFocusNode = FocusNode();
    _newPasswordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();

    _oldPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();

    _oldPasswordFocusNode.addListener(_updateFocus);
    _newPasswordFocusNode.addListener(_updateFocus);
    _confirmPasswordFocusNode.addListener(_updateFocus);
  }

  void _updateFocus() {
    setState(() {});
  }

  void _toggleOldPasswordVisibility() {
    setState(() {
      _isOldPasswordVisible = !_isOldPasswordVisible;
    });
  }

  void _toggleNewPasswordVisibility() {
    setState(() {
      _isNewPasswordVisible = !_isNewPasswordVisible;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    });
  }

  @override
  void dispose() {
    _oldPasswordFocusNode.removeListener(_updateFocus);
    _newPasswordFocusNode.removeListener(_updateFocus);
    _confirmPasswordFocusNode.removeListener(_updateFocus);
    _oldPasswordFocusNode.dispose();
    _newPasswordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _updatePassword() async {
    if (_newPasswordController.text == _confirmPasswordController.text) {
      try {
        await updateUserField(
          newValue: _newPasswordController.text,
          userId: widget.userid,
          fieldKey: "password",
        );
        widget.data["password"] = _newPasswordController.text;
        awesome_dialog.showDialogWithContext(context, "Your password has been changed successfully");
        User? user = FirebaseAuth.instance.currentUser;
        user?.updatePassword(_newPasswordController.text);
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      } catch (e) {
        snacka(context, "Failed to change password. Please try again.");
      }
    } else {
      snacka(context, "New passwords do not match.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(int.parse(Black)),
      appBar: AppBar(
        backgroundColor: Color(int.parse(Black)),
        title: titles(
          txt: 'Security Settings',
          text_Align: TextAlign.start,
          Font_size: 20,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(int.parse(White)),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildTextFormField(
              controller: _oldPasswordController,
              obSecured_text: !_isOldPasswordVisible,
              suffixIcon: IconButton(
                icon: Icon(
                  _isOldPasswordVisible ? Icons.visibility_off : Icons.visibility,
                  color: _oldPasswordFocusNode.hasFocus ? Color(0xff6941ff) : Colors.grey,
                ),
                onPressed: _toggleOldPasswordVisibility,
              ),
              hintText: 'Enter old password',
              labelText: 'Old Password',
              focusNode: _oldPasswordFocusNode,
            ),
            SizedBox(height: 20),
            buildTextFormField(
              controller: _newPasswordController,
              obSecured_text: !_isNewPasswordVisible,
              suffixIcon: IconButton(
                icon: Icon(
                  _isNewPasswordVisible ? Icons.visibility_off : Icons.visibility,
                  color: _newPasswordFocusNode.hasFocus ? Color(0xff6941ff) : Colors.grey,
                ),
                onPressed: _toggleNewPasswordVisibility,
              ),
              hintText: 'Enter new password',
              labelText: 'New Password',
              focusNode: _newPasswordFocusNode,
            ),
            SizedBox(height: 20),
            buildTextFormField(
              controller: _confirmPasswordController,
              obSecured_text: !_isConfirmPasswordVisible,
              suffixIcon: IconButton(
                icon: Icon(
                  _isConfirmPasswordVisible ? Icons.visibility_off : Icons.visibility,
                  color: _confirmPasswordFocusNode.hasFocus ? Color(0xff6941ff) : Colors.grey,
                ),
                onPressed: _toggleConfirmPasswordVisibility,
              ),
              hintText: 'Confirm new password',
              labelText: 'Confirm Password',
              focusNode: _confirmPasswordFocusNode,
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(int.parse(Purple))),
                  padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                ),
                child: Text(
                  "Update Password",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "lora",
                    fontWeight: FontWeight.w500,
                    color: Color(int.parse(White)),
                  ),
                ),
                onPressed: () {
                  if (_oldPasswordController.text == widget.data["password"]) {
                    _updatePassword();
                  } else {
                    snacka(context, "Please enter a valid old password.");
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}