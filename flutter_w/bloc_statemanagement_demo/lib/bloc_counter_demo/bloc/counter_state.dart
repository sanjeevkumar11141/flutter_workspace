part of 'counter_bloc.dart';

abstract class CounterState {
  final int value;
  CounterState(this.value);
}

class CounterInitial extends CounterState {
  CounterInitial() : super(0);  // Initial state is 0
}

class CounterChanged extends CounterState {
  CounterChanged(int value) : super(value);
}
