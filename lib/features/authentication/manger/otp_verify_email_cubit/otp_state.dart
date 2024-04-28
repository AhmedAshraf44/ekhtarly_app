abstract class OtpState {}

final class OtpInitial extends OtpState {}

final class OtplLoading extends OtpState {}

final class OtpSuccess extends OtpState {}

final class OtpFailure extends OtpState {
  final String errorMessage;

  OtpFailure({required this.errorMessage});
}
