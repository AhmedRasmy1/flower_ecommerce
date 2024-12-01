import '../../domain/entities/profile_entity.dart';

sealed class ProfileState {}

class InitialState extends ProfileState {}

class SuccessProfileState extends ProfileState {
  ProfileEntity? profileEntity;

  SuccessProfileState(this.profileEntity);
}

class LoadingProfileState extends ProfileState {}

class ErrorProfileState extends ProfileState {
  Exception? exception;

  ErrorProfileState(this.exception);
}
