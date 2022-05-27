import 'package:barcodeapp/services/firebase_service.dart';
import 'package:barcodeapp/widgets/snackbar_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationService{
  static Future signUpwithEmail(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      await FirebaseService.auth
          .createUserWithEmailAndPassword(email: email, password: password);
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Mysnackbar.showmysnack(
            context: context,
            text: 'make sure your password is not typical !',
            color: Colors.red);
      } else if (e.code == 'email-already-in-use') {
        Mysnackbar.showmysnack(
            context: context,
            text: 'this email is already in use !',
            color: Colors.red);
      }
    } catch (e) {
      debugPrint('ERROR ACCURED HERE :|| $e');
    }

  }
}