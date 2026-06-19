import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/networking/api_result.dart';
import '../../../domain/entities/profile_request_entity.dart';
import '../../../domain/use_cases/update_profile_data_use_case.dart';
import 'profile_update_state.dart';

class ProfileUpdateCubit extends Cubit<ProfileUpdateState> {
  final UpdateProfileDataUseCase _updateProfileDataUseCase;

  ProfileUpdateCubit(this._updateProfileDataUseCase) : super(ProfileUpdateState.initial());

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final visaController = TextEditingController();
  final addressController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitUpdateProfileStates() async {
    emit(const ProfileUpdateState.loading());

    final response = await _updateProfileDataUseCase(
      ProfileRequestEntity(
        name: nameController.text,
        email: emailController.text,
        visa: visaController.text,
        address: addressController.text,
      ),
    );

    response.when(
      success: (profileEntity) async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('userName', nameController.text);
        emit(ProfileUpdateState.success(profileEntity));
      },
      failure: (error) {
        emit(
          ProfileUpdateState.error(error: error.apiErrorModel.message ?? ''),
        );
      },
    );
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    visaController.dispose();
    addressController.dispose();
    return super.close();
  }
}