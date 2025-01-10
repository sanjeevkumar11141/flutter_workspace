part of 'api_bloc.dart';

class ApiState {}

class ApiLoadingState extends ApiState {}

class ApiSuccessState extends ApiState {
  final dynamic data;
  ApiSuccessState(this.data);
}

class ApiErrorState extends ApiState {
  final String message;
  ApiErrorState(this.message);
}



