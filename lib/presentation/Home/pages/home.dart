import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BasicAppbar(
            hideback: true,
            title: Image.asset(AppVectors.logo, height: 90, width: 90)),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _hometopcard(),
            _tabs(),
          ],
        )));
  }

  Widget _hometopcard() {
    return Center(
        child: SizedBox(
      height: 140,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset("assets/vectors/home_top_card.svg"),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 60),
              child: Image.asset("assets/images/home_artist.png"),
            ),
          )
        ],
      ),
    ));
  }

  Widget _tabs() {
    return TabBar(
        controller: _tabController,
        isScrollable: true,
        labelColor: context.isDarkMode ? Colors.white : Colors.black,
        indicatorColor: AppColors.primary,
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 16),
        tabs: const [
          Text(
            "News",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          Text(
            "Videos",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          Text(
            "Artists",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          Text(
            "Podcast",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          )
        ]);
  }
}
