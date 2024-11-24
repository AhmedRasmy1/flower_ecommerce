import '../../../data/models/occasion_response/occasion_response.dart';

sealed class OccasionState {}

class InitialState extends OccasionState {}

class SuccessOccasionState extends OccasionState {
  OccasionResponse? occasionResponse;

  SuccessOccasionState(this.occasionResponse);
}

class LoadingOccasionState extends OccasionState {}

class ErrorOccasionState extends OccasionState {
  Exception? exception;

  ErrorOccasionState(this.exception);
}
