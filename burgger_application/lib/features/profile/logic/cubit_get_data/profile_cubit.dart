import 'package:bloc/bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/repo/profile_repo.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;
  ProfileCubit(this.profileRepo) : super(ProfileState.initial());

  void getProfileData() async {
    emit(ProfileState.profileLoading());

    final response = await profileRepo.getProfileData();

    if (isClosed) return;
    response.when(
      success: (responseModel) {
        if (isClosed) return;
        emit(ProfileState.profileSuccess(responseModel));
      },
      failure: (error) {
        if (isClosed) return;
        emit(
          ProfileState.profileError(error: error.apiErrorModel.message ?? ''),
        );
      },
    );
  }


}
