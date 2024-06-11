import 'package:bloc/bloc.dart';
import 'package:ekhtarly_app/core/models/newest_laptops_details_model/laptops.dart';
import 'package:equatable/equatable.dart';

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

  void removeItem(Laptops Laptops) {
    for (int i = 0; i < comparsionItem.length; i++) {
      if (comparsionItem[i].name == Laptops.name) {
        comparsionItem.removeAt(i);
      }
    }
  }

  void addItem(Laptops) {
    if (comparsionItem.length == 2) {
      comparsionItem.clear();
      comparsionItem.add(Laptops);
    } else {
      comparsionItem.add(Laptops);
    }
  }
}
