import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/entities/auth/user.dart';
import 'package:spotify_clone/domain/usecases/get_user.dart';
import 'package:spotify_clone/presentation/profile/bloc/profile_info_state.dart';
import 'package:spotify_clone/service_locator.dart';

class ProfileInfoCubit extends Cubit<ProfileInfoState> {
  ProfileInfoCubit() : super(ProfileInfoLoading());

  Future<void> getUser() async {
    var user = await sl<GetUserusecase>().call();

    user.fold(
      (l) {
         print("❌ Failed to load user: $l");
        emit(ProfileInfoFailure());
        // Handle error (optional)
        // You might want to emit an error state here
      },
      (r) {
        print("✅ Loaded user: ${r.email}, image: ${r.imageUrl}");
        emit(ProfileInfoLoaded(userEntity: r));
      },
    );
  }
}
