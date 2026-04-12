import 'package:bloc/bloc.dart';
import 'package:burgger_application/core/networking/api_result.dart';
import 'package:burgger_application/features/product_details/data/repo/side_options_repo.dart';
import 'package:burgger_application/features/product_details/logic/cubit/side_options_state.dart';

class SideOptionsCubit extends Cubit<SideOptionsState> {
  final SideOptionsRepo sideOptionsRepo;
  SideOptionsCubit(this.sideOptionsRepo) : super(SideOptionsState.initial());

  void getSideOptions() async {
    emit(const SideOptionsState.loading());
    final response = await sideOptionsRepo.getSideOptions();
    response.when(
      success: (sideOptionsModel) {
        emit(SideOptionsState.success(sideOptionsModel.data));
      },
      failure: (error) {
        emit(SideOptionsState.error(error));
      },
    );
  }
}
