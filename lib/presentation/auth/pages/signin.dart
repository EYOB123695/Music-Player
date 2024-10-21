import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/presentation/auth/pages/signup.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signIn(context),
      appBar: BasicAppbar(
          title: Image.asset(AppVectors.logo, height: 90, width: 90)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 19),
            _registorText(context),
            const SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.all(12), child: _emailField(context)),
            Padding(
                padding: const EdgeInsets.all(12),
                child: _passwordField(context)),
            Padding(
                padding: const EdgeInsets.all(12),
                child: BasicAppButton(onpressed: () {}, title: "Sign in")),
          ],
        ),
      ),
    );
  }

  Widget _registorText(BuildContext context) {
    return Text(
      "Register",
      style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black),
      textAlign: TextAlign.center,
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(hintText: "Enter Email")
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(hintText: "password")
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _signIn(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Not a memeber ? ",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black)),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>  Signup()));
              },
              child: const Text("Register now"))
        ],
      ),
    );
  }
}
