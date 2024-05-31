part of 'comprasion_cubit.dart';

sealed class ComprasionState extends Equatable {
  const ComprasionState();

  @override
  List<Object> get props => [];
}

final class ComprasionInitial extends ComprasionState {}

final class ComprasionSuccess extends ComprasionState {
  final List<Laptops> laps;

  ComprasionSuccess({required this.laps});
}

final class ComprasionLoading extends ComprasionState {}
