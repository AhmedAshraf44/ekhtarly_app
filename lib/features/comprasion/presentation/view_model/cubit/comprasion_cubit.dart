import 'package:ekhtarly_app/core/models/newest_laptops_details_model/laptops.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'comprasion_state.dart';

class ComprasionCubit extends Cubit<ComprasionState> {
  ComprasionCubit() : super(ComprasionInitial());
  List<Laptops> comparsionItem = [];

  void doComprasion() {
    if (comparsionItem.length == 2) {
      emit(ComprasionSuccess(laps: comparsionItem));
    } else {
      emit(ComprasionLoading());
    }
  }

  void removeItem(Laptops laptops) {
    for (int i = 0; i < comparsionItem.length; i++) {
      if (comparsionItem[i].name == laptops.name) {
        comparsionItem.removeAt(i);
      }
    }
  }

  void addItem(laptops) {
    if (comparsionItem.length == 2) {
      comparsionItem.clear();
      comparsionItem.add(laptops);
    } else {
      comparsionItem.add(laptops);
    }
  }
}
