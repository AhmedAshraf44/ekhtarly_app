part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
 final  List <ProgramModel> programs;

 const SearchSuccess({required this.programs});
}

final class SearchFaluire extends SearchState {
  final String messsage;

  const SearchFaluire({required this.messsage});
}
