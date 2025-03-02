import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/bloc/favourite/favourite_button_state.dart';
import 'package:spotify_clone/domain/usecases/song/addorremove_favourites.dart';
import 'package:spotify_clone/service_locator.dart';

class FavouriteButtonCubit extends Cubit<Favouritebuttonstate> {
  FavouriteButtonCubit() : super(FavouriteButtoninitial());
  void favouritebuttonupdated(String songid) async {
    var result = await sl<Addorremovefavouriteusecase>().call(params: songid);
    result.fold((l) {}, (isFavourite) {
      emit(FavouriteButtonUpdated(isFavourite: isFavourite));
    });
  }
}
