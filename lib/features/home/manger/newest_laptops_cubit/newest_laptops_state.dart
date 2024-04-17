
abstract class NewestLaptopsState {}

final class NewestLaptopsInitial extends NewestLaptopsState {}

final class NewestLaptopsLoading extends NewestLaptopsState {}

final class NewestLaptopsSuccess extends NewestLaptopsState {}

final class NewestLaptopsFailure extends NewestLaptopsState {
  final String errorMessage;
  NewestLaptopsFailure({required this.errorMessage});
}
