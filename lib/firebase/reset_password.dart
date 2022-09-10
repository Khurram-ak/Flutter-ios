import 'package:flutter/material.dart';
import 'package:quizjets/export_files.dart';

class ResetPassword {
  final context;

  ResetPassword({this.context});

  loginUser(var emailController, var scaffoldKey) async {
    if (emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Color(0xFF007EC7),
          content: Text(
            "Please enter your email",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontFamily: Str.POPPINS,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
        ),
      );
      return;
    }

    FirebaseAuth.instance
        .sendPasswordResetEmail(
      email: emailController.text.trim(),
    )
        .then((res) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Color(0xFF007EC7),
          content: Text(
            "A reset link has been sent to your email address.Please check your email",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontFamily: Str.POPPINS,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
        ),
      );

      Navigator.of(context).pop();
    }).catchError(onError);
  }

  onError(e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Color(0xFF007EC7),
        content: Text(
          e.toString().replaceAll('[firebase_auth/wrong-password]', '').replaceAll('[firebase_auth/weak-password]', '').replaceAll('[firebase_auth/too-many-requests]', '').replaceAll('[firebase_auth/user-not-found]', ''),
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontFamily: Str.POPPINS,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }
}
