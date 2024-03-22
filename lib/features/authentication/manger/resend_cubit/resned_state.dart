part of 'resned_cubit.dart';

sealed class ResnedState extends Equatable {
  const ResnedState();

  @override
  List<Object> get props => [];
}

final class ResnedInitial extends ResnedState {}
final class ResnedLoading extends ResnedState {}
final class ResnedSuccess extends ResnedState {
  final String successMessage;

const  ResnedSuccess({required this.successMessage});
}
final class ResnedFailure extends ResnedState {
  final String errorMessage;

const ResnedFailure({required this.errorMessage});

}
