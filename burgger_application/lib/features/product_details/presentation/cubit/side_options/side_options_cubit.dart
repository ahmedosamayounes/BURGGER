import 'package:bloc/bloc.dart';

import '../../../../../core/networking/api_result.dart';
import '../../../domain/use_cases/get_side_options_use_case.dart';
import 'side_options_state.dart';

class SideOptionsCubit extends Cubit<SideOptionsState> {
  final GetSideOptionsUseCase _getSideOptionsUseCase;
  SideOptionsCubit(this._getSideOptionsUseCase) : super(SideOptionsState.initial());

  void getSideOptions() async { 
    if (isClosed) return;
    emit(const SideOptionsState.loading());

final response = await _getSideOptionsUseCase();
    if (isClosed) return;
    response.when(
      success: (sideOptionsEntityList) {
        if (!isClosed) emit(SideOptionsState.success(sideOptionsEntityList));
      },
      failure: (error) {
        if (!isClosed) emit(SideOptionsState.error(error));
      },
    );
  }
}
