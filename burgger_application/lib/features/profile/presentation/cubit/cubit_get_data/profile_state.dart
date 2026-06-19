import '../../../domain/entities/profile_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.profileLoading() = ProfileLoading;
  const factory ProfileState.profileSuccess(ProfileEntity data) = ProfileSuccess;
  const factory ProfileState.profileError({required String error}) = ProfileError;


}
