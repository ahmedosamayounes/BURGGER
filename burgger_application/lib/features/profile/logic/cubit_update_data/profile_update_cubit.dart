import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/models/profile_request_model.dart';
import '../../data/repo/profile_repo.dart';
import 'profile_update_state.dart';

class ProfileUpdateCubit extends Cubit<ProfileUpdateState> {
  final ProfileRepo profileRepo;
  ProfileUpdateCubit(this.profileRepo) : super(ProfileUpdateState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController visaController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitUpdateProfileStates() async {
    emit(const ProfileUpdateState.loading());

    final response = await profileRepo.updateProfileData(
      ProfileRequestModel(
        name: nameController.text,
        email: emailController.text,
        visa: visaController.text,
        address: addressController.text,
      ),
    );

    response.when(
      success: (responseModel) {
        emit(ProfileUpdateState.success(responseModel));
      },
      failure: (error) {
        emit(
          ProfileUpdateState.error(error: error.apiErrorModel.message ?? ''),
        );
      },
    );
  }
}
