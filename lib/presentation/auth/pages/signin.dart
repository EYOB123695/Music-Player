import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/data/models/auth/signinreq.dart';
import 'package:spotify_clone/domain/usecases/signinusecase.dart';
import 'package:spotify_clone/presentation/auth/pages/signup.dart';
import 'package:spotify_clone/presentation/Home/pages/home.dart';
import 'package:spotify_clone/service_locator.dart';

class Signin extends StatelessWidget {
  Signin({super.key});
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

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
                child: BasicAppButton(
                    onpressed: () async {
                      var result = await sl<Signinusecase>().call(
                          params: Signinreq(
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
                    title: "Sign in")),
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
                        builder: (BuildContext context) => Signup()));
              },
              child: const Text("Register now"))
        ],
      ),
    );
  }
}
