import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/logic/cubit/products/products_state.dart';

class ProductDetailsCubit extends Cubit<ProductsState> {
  List<int> _selectedToppings = [];
  List<int> _selectedSides = [];

  List<int> get selectedToppings => _selectedToppings;
  List<int> get selectedSides => _selectedSides;

  ProductDetailsCubit() : super(const ProductsState.initial());

  void toggleTopping(int toppingId) { 
    final newList = List<int>.from(_selectedToppings);

    if (newList.contains(toppingId)) {
      newList.remove(toppingId);
    } else {
      newList.add(toppingId);
    }

    _selectedToppings = newList;
    if (isClosed) return;


    emit(const ProductsState.selectionChanged()); 
  }

  void sideOptionToggle(int sideOptionId) {
    final newList = List<int>.from(_selectedSides);

    if (newList.contains(sideOptionId)) {
      newList.remove(sideOptionId);
    } else {
      newList.add(sideOptionId);
    }

    _selectedSides = newList;
    if (isClosed) return;

    emit(const ProductsState.selectionChanged());
  }

  void clearSelections() {
    _selectedToppings.clear();
    _selectedSides.clear();
    emit(const ProductsState.initial()); 
  }
}