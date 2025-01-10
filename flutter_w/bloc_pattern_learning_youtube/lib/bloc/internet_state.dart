
part of 'internet_bloc.dart';

sealed class InternetState extends Equatable {
  const InternetState();
}

final class InternetInitialState extends InternetState {
  @override
  List<Object> get props => [];
}

final class InternetLostState extends InternetState {
  @override
  List<Object> get props => [];
}

final class InternetGainedState extends InternetState {
  @override
  List<Object> get props => [];
}

