import 'package:bloc/bloc.dart';
import 'package:burgger_application/core/networking/api_result.dart';
import 'package:burgger_application/features/home/data/repo/categories/categories_repo.dart';
import 'package:burgger_application/features/home/logic/cubit/categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepo categoriesRepo;
  CategoriesCubit(this.categoriesRepo) : super(CategoriesState.initial());

  void getCategories() async {
    emit(const CategoriesState.loading());

    final response = await categoriesRepo.getCategories();
    response.when(
      success: (categoriesModel) {
        emit(CategoriesState.success(categoriesModel.data));
      },
      failure: (error) {
        emit(CategoriesState.error(error));
      },
    );
  }
}
