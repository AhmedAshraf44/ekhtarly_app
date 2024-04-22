
import '../../data/model/newest_laptop/newest_laptop_model.dart';

abstract class NewestLaptopsState {}

final class NewestLaptopsInitial extends NewestLaptopsState {}

final class NewestLaptopsLoading extends NewestLaptopsState {}

final class NewestLaptopsSuccess extends NewestLaptopsState {
  final NewestLaptopModel laptops;

  NewestLaptopsSuccess({required this.laptops});
}

final class NewestLaptopsFailure extends NewestLaptopsState {
  final String errorMessage;
  NewestLaptopsFailure({required this.errorMessage});
}
