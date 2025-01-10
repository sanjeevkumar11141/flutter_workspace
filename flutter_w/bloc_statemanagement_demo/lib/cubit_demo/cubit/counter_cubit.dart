import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);  // Increment and emit the new state
  void decrement() => emit(state - 1);  // Decrement and emit the new state
}
