import 'package:bloc/bloc.dart';

import '../../../../../core/networking/api_result.dart';
import '../../../domain/use_cases/get_toppings_use_case.dart';
import 'toppings_state.dart';

class ToppingsCubit extends Cubit<ToppingsState> {
  final GetToppingsUseCase _getToppingsUseCase;
  ToppingsCubit(this._getToppingsUseCase) : super(ToppingsState.initial());

  void getToppings() async {
    if (isClosed) return;
    emit(const ToppingsState.loading());

    final response = await _getToppingsUseCase();

    if (isClosed) return;
    response.when(
      success: (toppingsEntityList) {
        if (!isClosed) emit(ToppingsState.success(toppingsEntityList));
      },
      failure: (error) {
        if (!isClosed) emit(ToppingsState.error(error));
      },
    );
  }
}
