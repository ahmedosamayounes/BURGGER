import 'package:bloc/bloc.dart';
import 'package:burgger_application/core/networking/api_error_handler.dart';
import 'package:burgger_application/core/networking/api_result.dart';
import 'package:burgger_application/features/product_details/data/repo/toppings_repo.dart';
import 'package:burgger_application/features/product_details/logic/cubit/toppings/toppings_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class ToppingsCubit extends Cubit<ToppingsState> {
  final ToppingsRepo toppingsRepo;  
  ToppingsCubit(this.toppingsRepo) : super(ToppingsState.initial());
    


  void getToppings() async {
    emit(const ToppingsState.loading());

    final response = await toppingsRepo.getToppings();
    response.when(
      success: (toppingsModel) {
        emit(ToppingsState.success(toppingsModel.data));
      },
      failure: (error) {
        emit(ToppingsState.error(error));
      },
    );
  }
}
