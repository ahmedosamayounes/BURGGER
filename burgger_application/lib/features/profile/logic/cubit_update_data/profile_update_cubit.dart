import 'package:bloc/bloc.dart';
import 'package:burgger_application/core/networking/api_result.dart';
import 'package:burgger_application/features/profile/data/models/profile_request_model.dart';
import 'package:burgger_application/features/profile/data/repo/profile_repo.dart';
import 'package:burgger_application/features/profile/logic/cubit_update_data/profile_update_state.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
