import 'package:bloc/bloc.dart';

import '../../../../../core/networking/api_result.dart';
import '../../../data/repo/side_options_repo.dart';
import 'side_options_state.dart';

class SideOptionsCubit extends Cubit<SideOptionsState> {
  final SideOptionsRepo sideOptionsRepo;
  SideOptionsCubit(this.sideOptionsRepo) : super(SideOptionsState.initial());

  void getSideOptions() async {
    if (isClosed) return;
    emit(const SideOptionsState.loading());

    final response = await sideOptionsRepo.getSideOptions();

    if (isClosed) return;
    response.when(
      success: (sideOptionsModel) {
        if (!isClosed) emit(SideOptionsState.success(sideOptionsModel.data));
      },
      failure: (error) {
        if (!isClosed) emit(SideOptionsState.error(error));
      },
    );
  }
}
