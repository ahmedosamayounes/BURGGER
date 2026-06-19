import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helpers/shared_pref_helper.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../domain/use_cases/get_categories_use_case.dart';
import 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final GetCategoriesUseCase _getCategoriesUseCase;
  CategoriesCubit(this._getCategoriesUseCase) : super(const CategoriesState.initial());
  String? userName;
  Future<void> getUserName() async {
    userName = await SharedPrefHelper.getString('userName');
    debugPrint("Retrieved UserName: $userName");

    emit(const CategoriesState.initial());
  }
  

  void getCategories() async {
    emit(const CategoriesState.loading());
    final response = await _getCategoriesUseCase();
    response.when(
      success: (categoriesEntityList) {
        emit(CategoriesState.success(categoriesEntityList));
      },
      failure: (error) {
        emit(CategoriesState.error(error));
      },
    );
  }
}
