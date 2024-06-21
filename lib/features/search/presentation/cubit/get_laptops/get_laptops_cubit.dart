import 'package:bloc/bloc.dart';
import 'package:ekhtarly_app/core/models/newest_laptops_details_model/laptops.dart';
import 'package:ekhtarly_app/features/search/data/repo/search_repsitery.dart';
import 'package:equatable/equatable.dart';

part 'get_laptops_state.dart';

class GetLaptopsCubit extends Cubit<GetLaptopsState> {
  GetLaptopsCubit(this.searchRepo) : super(GetLaptopsInitial());
 final SearchRepo searchRepo;
  Future<void> recommendedLaptops(List<String> laptops, int budget) async {
    try {
      emit(GetLaptopsLoading());
      var result = await searchRepo.recommendedLaptops(laptops,budget);
      result.fold((failure) {
        emit(
          GetLaptopsFaluire(
            messsage: failure.errorMessage,
          ),
        );
      }, (laptop) {
        emit(
          GetLaptopsSuccess(laptops: laptop),
        );
      });
    } catch (e) {
      print(e);
    }
  }
}
