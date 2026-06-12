import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helpers/shared_pref_helper.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../data/repo/categories/categories_repo.dart';
import 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepo categoriesRepo;
  CategoriesCubit(this.categoriesRepo) : super(CategoriesState.initial());
  String? userName;
  Future<void> getUserName() async {
    userName = await SharedPrefHelper.getString('userName');
    debugPrint("Retrieved UserName: $userName");

    emit(CategoriesState.initial());
  }

  void getCategories() async {
    emit(CategoriesState.loading());
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
