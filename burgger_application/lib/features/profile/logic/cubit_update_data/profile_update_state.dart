import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_update_state.freezed.dart';

@freezed
class ProfileUpdateState<T> with _$ProfileUpdateState<T>  {
  const factory ProfileUpdateState.initial() = _Initial;

  const factory ProfileUpdateState.loading() = Loading;
  const factory ProfileUpdateState.success(T data) = Success<T> ;
  const factory ProfileUpdateState.error({required String error}) = Error;
}
