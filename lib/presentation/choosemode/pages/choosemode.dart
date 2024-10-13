import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';
import 'package:spotify_clone/presentation/auth/pages/signuporsignin.dart';
import 'package:spotify_clone/presentation/choosemode/bloc/theme_cubit.dart';

class ChooseMode extends StatelessWidget {
  const ChooseMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/choose_mode_bg.png"))),
        ),
        Container(color: Colors.black.withOpacity(0.13)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(AppVectors.logo)),
              Spacer(),
              // SizedBox(height: 650),
              Text(
                " Choose Mode",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 21,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context
                              .read<ThemeCubit>()
                              .updateTheme(ThemeMode.dark);
                        },
                        child: ClipOval(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: Color(0xff30393c).withOpacity(0.5),
                                  shape: BoxShape.circle),
                              child: SvgPicture.asset(
                                "assets/vectors/moon.svg",
                                fit: BoxFit.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Text("Dark Mode",
                          style: TextStyle(
                            color: AppColors.gray,
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ))
                    ],
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context
                              .read<ThemeCubit>()
                              .updateTheme(ThemeMode.light);
                        },
                        child: ClipOval(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: Color(0xff30393c).withOpacity(0.5),
                                  shape: BoxShape.circle),
                              child: SvgPicture.asset(
                                "assets/vectors/sun.svg",
                                fit: BoxFit.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Text("Light Mode",
                          style: TextStyle(
                            color: AppColors.gray,
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ))
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              BasicAppButton(
                onpressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const Signuporsignin()));
                },
                title: "Continue",
              )
            ],
          ),
        )
      ],
    ));
  }
}