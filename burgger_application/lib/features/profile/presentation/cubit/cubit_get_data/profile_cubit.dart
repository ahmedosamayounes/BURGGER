import 'package:bloc/bloc.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../domain/use_cases/get_profile_data_use_case.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileDataUseCase _getProfileDataUseCase;

  ProfileCubit(this._getProfileDataUseCase) : super(ProfileState.initial());

  void getProfileData() async {
    emit(ProfileState.profileLoading());

    final response = await _getProfileDataUseCase();

    if (isClosed) return;
    response.when(
      success: (profileEntity) {
        if (isClosed) return;
        emit(ProfileState.profileSuccess(profileEntity));
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