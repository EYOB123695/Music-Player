import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone/common/widgets/favourite_button/favourite_button.dart';
import 'package:spotify_clone/core/configs/constants/AppUrls.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';
import 'package:spotify_clone/presentation/Home/pages/song_player/pages/bloc/song_player_cubit.dart';
import 'package:spotify_clone/presentation/Home/pages/song_player/pages/bloc/song_player_state.dart';

class Songplayerpage extends StatefulWidget {
  final SongEntity songentity;
  const Songplayerpage({required this.songentity, super.key});

  @override
  State<Songplayerpage> createState() => _SongplayerState();
}

class _SongplayerState extends State<Songplayerpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: Text(
          'Now playing',
          style: TextStyle(fontSize: 18),
        ),
        actions: IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_vert_rounded),
        ),
      ),
      body: BlocProvider(
        create: (_) => SongPlayerCubit()
          ..loadsong(
              '${Appurls.songfirestorage}${widget.songentity.Artist} - ${widget.songentity.Title}.mp3?${Appurls.mediaAlt}'),
        child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Column(
              children: [
                _songCover(context),
                SizedBox(
                  height: 20,
                ),
                _songDetail(context),
                SizedBox(
                  height: 20,
                ),
                _songPlayer(context),
              ],
            )),
      ),
    );
  }

  Widget _songCover(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  '${Appurls.firestorage}${widget.songentity.Artist} - ${widget.songentity.Title}.jpg?${Appurls.mediaAlt}'))),
    );
  }

  Widget _songDetail(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.songentity.Title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: context.isDarkMode ? Colors.white : Colors.grey),
          ),
          Text(
            widget.songentity.Artist,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 11,
                color: context.isDarkMode ? Colors.white : Colors.grey),
          ),
        ],
      ),
      Favouritebutton(SongEntity: SongEntity),
    ]);
  }

  Widget _songPlayer(BuildContext context) {
    return BlocBuilder<SongPlayerCubit, SongPlayerState>(
        builder: (context, state) {
      if (state is SongPlayerLoading) {
        return const CircularProgressIndicator();
      }
      if (state is SongPlayerLoaded) {
        return Column(
          children: [
            Slider(
                value: context
                    .read<SongPlayerCubit>()
                    .songposition
                    .inSeconds
                    .toDouble(),
                min: 0.0,
                max: context
                    .read<SongPlayerCubit>()
                    .songduration
                    .inSeconds
                    .toDouble(),
                onChanged: (value) {}),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    style: TextStyle(
                        color:
                            context.isDarkMode ? Colors.white : Colors.black),
                    formatDuration(
                        context.read<SongPlayerCubit>().songposition)),
                Text(
                    formatDuration(
                        context.read<SongPlayerCubit>().songduration),
                    style: TextStyle(
                        color:
                            context.isDarkMode ? Colors.white : Colors.black)),
              ],
            ),
            GestureDetector(
              onTap: () {
                context.read<SongPlayerCubit>().playorpause();
              },
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.primary),
                child: Icon(context.read<SongPlayerCubit>().audioPlayer.playing
                    ? Icons.pause
                    : Icons.play_arrow),
              ),
            )
          ],
        );
      }
      return Container();
    });
  }

  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return '${minutes.toString().padLeft(2, '0')} : ${seconds.toString().padLeft(2, '0')}';
  }
}
