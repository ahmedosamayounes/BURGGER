

import '../../../domain/entities/option_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/networking/api_error_handler.dart';

part 'side_options_state.freezed.dart';
@freezed
class SideOptionsState with _$SideOptionsState {
  const factory SideOptionsState.initial() = _Initial;

  const factory SideOptionsState.loading() = SideOptionsStateLoading;
  const factory SideOptionsState.success(List<OptionEntity> sideOptionsList) = SideOptionsStateSuccess;
  const factory SideOptionsState.error(ErrorHandler error) =SideOptionsStateError;
}
