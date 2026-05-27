import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/profile_response_model.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.profileLoading() = ProfileLoading;
  const factory ProfileState.profileSuccess(ProfileResponseModel data) = ProfileSuccess;
  const factory ProfileState.profileError({required String error}) = ProfileError;


}
