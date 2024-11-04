import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';
import 'package:spotify_clone/presentation/Home/widget/newssongs.dart';
import 'package:spotify_clone/presentation/Home/widget/playlist.dart';

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
            SizedBox(
              height: 260,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Newssongs(),
                  Container(),
                  Container(),
                  Container(),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Playlist()
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
        isScrollable: false,
        labelColor: context.isDarkMode ? Colors.white : Colors.black,
        indicatorColor: AppColors.primary,
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 16),
        tabs: const [
          FittedBox(
            child: Text(
              "News",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
          FittedBox(
            child: Text(
              "Videos",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
          FittedBox(
            child: Text(
              "Artists",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
          FittedBox(
            child: Text(
              "Podcast",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          )
        ]);
  }
}
