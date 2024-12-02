part of 'editprofile_cubit.dart';

@immutable
sealed class EditprofileState {}

final class EditprofileInitial extends EditprofileState {}

final class EditprofileLoading extends EditprofileState {}

final class EditprofileSuccess extends EditprofileState {
  final EditProfileEntity editProfileEntity;

  EditprofileSuccess(this.editProfileEntity);
}

final class EditprofileFail extends EditprofileState {
  final Exception exception;
  EditprofileFail(this.exception);
}
