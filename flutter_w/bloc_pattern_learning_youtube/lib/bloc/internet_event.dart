part of 'internet_bloc.dart';

sealed class InternetEvent extends Equatable {
  const InternetEvent();
}

class InternetLostEvent extends InternetEvent {
  @override
  List<Object?> get props => [];
}

class InternetGainedEvent extends InternetEvent {
  @override
  List<Object?> get props => [];
}
