import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';
import 'package:spotify_clone/presentation/auth/pages/signin.dart';
import 'package:spotify_clone/presentation/auth/pages/signup.dart';

class Signuporsignin extends StatelessWidget {
  const Signuporsignin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [ 
  
        const BasicAppbar(),
        Align(
          alignment: Alignment.topRight,
          child: SvgPicture.asset("assets/vectors/top_pattern.svg"),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: SvgPicture.asset("assets/vectors/bottom_pattern.svg"),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Image.asset("assets/images/auth_bg.png"),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(AppVectors.logo),
                ),
                const SizedBox(
                  height: 55,
                ),
                Text(
                  "Enjoy Listening To Music",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
                const SizedBox(height: 21),
                Text(
                  "Spotify is a proprieatary Swedish audio streaming and media service provider",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: AppColors.gray),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 21),
                Row(
                  children: [
                    Expanded(
                        child: BasicAppButton(
                            onpressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                           Signup()));
                            },
                            title: "Register")),
                    SizedBox(
                      width: 50,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const Signin()));
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: context.isDarkMode
                                  ? Colors.white
                                  : Colors.black),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
