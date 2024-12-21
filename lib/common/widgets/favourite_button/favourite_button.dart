import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/bloc/favourite/favorite_button_cubit.dart';
import 'package:spotify_clone/common/bloc/favourite/favourite_button_state.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';

class Favouritebutton extends StatelessWidget {
  final SongEntity;
  const Favouritebutton({super.key, required this.SongEntity});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => FavouriteButtonCubit(),
        child: BlocBuilder<FavouriteButtonCubit, Favouritebuttonstate>(
          builder: (context, state) {
            if (state is FavouriteButtoninitial) {
              return IconButton(
                  onPressed: () {
                    context
                        .read<FavouriteButtonCubit>()
                        .favouritebutton(SongEntity.songId);
                  },
                  icon: Icon(
                    SongEntity.isFavourite
                        ? Icons.favorite
                        : Icons.favorite_outline_outlined,
                    size: 30,
                    color: AppColors.Darkgray,
                  ));
            }
            if (state is FavouriteButtonUpdated) {
              return IconButton(
                  onPressed: () {
                    context
                        .read<FavouriteButtonCubit>()
                        .favouritebutton(SongEntity.songId);
                  },
                  icon: Icon(
                    state.isFavourite
                        ? Icons.favorite
                        : Icons.favorite_outline_outlined,
                    size: 30,
                    color: AppColors.Darkgray,
                  ));
            }
            return Container();
          },
        ));
  }
}
