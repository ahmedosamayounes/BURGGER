import 'package:bloc/bloc.dart';

import '../../../../../core/networking/api_result.dart';
import '../../../data/repo/toppings_repo.dart';
import 'toppings_state.dart';

class ToppingsCubit extends Cubit<ToppingsState> {
  final ToppingsRepo toppingsRepo;
  ToppingsCubit(this.toppingsRepo) : super(ToppingsState.initial());

  void getToppings() async {
    if (isClosed) return;
    emit(const ToppingsState.loading());

    final response = await toppingsRepo.getToppings();

    if (isClosed) return;
    response.when(
      success: (toppingsModel) {
        if (!isClosed) emit(ToppingsState.success(toppingsModel.data));
      },
      failure: (error) {
        if (!isClosed) emit(ToppingsState.error(error));
      },
    );
  }
}
