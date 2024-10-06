import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';
import 'package:spotify_clone/presentation/choosemode/pages/choosemode.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

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
                  image: AssetImage("assets/images/intro_bg.png"))),
        ),
        Container(color: Colors.black.withOpacity(0.15)),
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
                "Enjoy Listening To Music",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 21,
              ),
              Text(
                "Lorem ipsum dolor sdfafkjf fjjfjsj jfjdjfjdj jsdjsjdjjd bgtthy hjuio hugo loris",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  color: AppColors.gray,
                  fontSize: 13,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              BasicAppButton(
                onpressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const ChooseMode()));
                },
                title: "Get Started",
              )
            ],
          ),
        )
      ],
    ));
  }
}
