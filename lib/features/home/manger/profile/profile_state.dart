part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final Profile profile;

  const ProfileSuccess({required this.profile});
}

final class ProfileFaluire extends ProfileState {
  final String message;

  const ProfileFaluire({required this.message});
}
