

import 'package:burgger_application/core/networking/api_error_handler.dart';
import 'package:burgger_application/features/product_details/data/models/product_option/product_option_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'side_options_state.freezed.dart';
@freezed
class SideOptionsState with _$SideOptionsState {
  const factory SideOptionsState.initial() = _Initial;

  const factory SideOptionsState.loading() = SideOptionsStateLoading;
  const factory SideOptionsState.success(List<OptionData?>? sideOptionsList) = SideOptionsStateSuccess;
  const factory SideOptionsState.error(ErrorHandler error) =SideOptionsStateError;
}
