import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_blocs.dart';

class SignInCotroller {
  final BuildContext context;
  const SignInCotroller({required this.context});
  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          //
          // print("email empty");
        } else {
          print("email is $emailAddress");
        }
        if (password.isEmpty) {
          //
          print("password empty");
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            //
            print("user does not exist");
          }
          if (!credential.user!.emailVerified) {
            //
            print("not verified");
          }

          var user = credential.user;
          if (user != null) {
            //we got verified user from firebase
            print("user exist");
          } else {
            //we have error getting user from firebase
            print("no user");
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            print("no user found for that email");
          } else if (e.code == 'wrong-password') {
            print("wrong password provided for that user");
          } else if (e.code == 'invalid-email') {
            print("Your email is wrong");
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
