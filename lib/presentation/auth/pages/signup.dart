import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/data/models/auth/createuserreq.dart';
import 'package:spotify_clone/domain/usecases/signupusecase.dart';
import 'package:spotify_clone/presentation/auth/pages/signin.dart';
import 'package:spotify_clone/presentation/Home/pages/home.dart';
import 'package:spotify_clone/service_locator.dart';

class Signup extends StatelessWidget {
  Signup({super.key});
  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();

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
                padding: const EdgeInsets.all(12), child: _textField(context)),
            Padding(
                padding: const EdgeInsets.all(12), child: _emailField(context)),
            Padding(
                padding: const EdgeInsets.all(12),
                child: _passwordField(context)),
            Padding(
                padding: const EdgeInsets.all(12),
                child: BasicAppButton(
                    onpressed: () async {
                      var result = await sl<Signupusecase>().call(
                          params: Createuserreq(
                              fullname: _fullname.text.toString(),
                              email: _email.text.toString(),
                              password: _password.text.toString()));
                      
                      result.fold((l) {
                        var snackbar = SnackBar(content: Text(l));
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      }, (r) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const HomePage()),
                            (route) => false);
                      });
                    },
                    title: "Create Account")),
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

  Widget _textField(BuildContext context) {
    return TextField(
      controller: _fullname,
      style: TextStyle(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black),
      decoration: const InputDecoration(hintText: "FullName")
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _email,
      decoration: const InputDecoration(hintText: "Enter Email")
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _password,
      decoration: const InputDecoration(hintText: "password")
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _signIn(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Do you have an account? ",
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
                        builder: (BuildContext context) => Signin()));
              },
              child: const Text("Sign In"))
        ],
      ),
    );
  }
}
