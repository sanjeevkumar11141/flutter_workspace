part of 'internet_cubit.dart';

@immutable
sealed class InternetState {}

final class InternetInitialState extends InternetState {}

final class InternetLostState extends InternetState {}

final class InternetGainedState extends InternetState {}
