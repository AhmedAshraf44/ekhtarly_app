part of 'get_laptops_cubit.dart';

sealed class GetLaptopsState extends Equatable {
  const GetLaptopsState();

  @override
  List<Object> get props => [];
}

final class GetLaptopsInitial extends GetLaptopsState {}

final class GetLaptopsLoading extends GetLaptopsState {}

final class GetLaptopsSuccess extends GetLaptopsState {
  final List<Laptops> laptops;

 const GetLaptopsSuccess({required this.laptops});
}

final class GetLaptopsFaluire extends GetLaptopsState {
  final String messsage;

  const GetLaptopsFaluire({required this.messsage});
}
