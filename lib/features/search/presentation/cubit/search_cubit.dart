import 'dart:developer';

import 'package:ekhtarly_app/features/search/data/model/program_model.dart';
import 'package:ekhtarly_app/features/search/data/repo/search_repsitery.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;

  Future<void> getPrograms() async {
    try {
      emit(SearchLoading());
      var result = await searchRepo.getProgram();
      result.fold((failure) {
        emit(
          SearchFaluire(
            messsage: failure.errorMessage,
          ),
        );
      }, (programs) {
        emit(
          SearchSuccess(programs: programs),
        );
      });
    } catch (e) {
      log(e.toString());
    }
  }
}
