
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../data/models/product_option/product_option_model.dart';

part 'toppings_state.freezed.dart';

@freezed
class ToppingsState with _$ToppingsState {
  const factory ToppingsState.initial() = _Initial;

  const factory ToppingsState.loading() = ToppingsStateLoading;
  const factory ToppingsState.success(List<OptionData?>? toppingsList) = ToppingsStateSuccess;
  const factory ToppingsState.error(ErrorHandler error) = ToppingsStateError;
}
