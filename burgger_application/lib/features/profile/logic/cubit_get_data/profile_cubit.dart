import 'package:bloc/bloc.dart';
import 'package:burgger_application/core/networking/api_result.dart';
import 'package:burgger_application/features/profile/data/models/profile_response_model.dart';
import 'package:burgger_application/features/profile/data/repo/profile_repo.dart';
import 'package:burgger_application/features/profile/logic/cubit_get_data/profile_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;
  ProfileCubit(this.profileRepo) : super(ProfileState.initial());

  void getProfileData() async {
    emit(ProfileState.profileLoading());

    final response = await profileRepo.getProfileData();
    response.when(
      success: (responseModel) =>
          emit(ProfileState.profileSuccess(responseModel)),
      failure: (error) => emit(
        ProfileState.profileError(error: error.apiErrorModel.message ?? ''),
      ),
    );
  }
}
