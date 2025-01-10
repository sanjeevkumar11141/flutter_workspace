import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? _streamSubscription;

  InternetBloc() : super(InternetInitialState()) {
    // Listen to connectivity changes
    _streamSubscription = _connectivity.onConnectivityChanged.listen((result) async {
      print('Connectivity Result: $result');  // Debugging

      // Recheck connectivity immediately after receiving the event
      final currentResult = await _connectivity.checkConnectivity();
      print('Rechecked Connectivity Result: $currentResult');

      if (currentResult.contains(ConnectivityResult.mobile)  ||
          currentResult.contains(ConnectivityResult.wifi)) {
        print('Add InternetGainedEvent');
        add(InternetGainedEvent());
      } else {
        print('Add InternetLostEvent');
        add(InternetLostEvent());
      }
    });

    on<InternetGainedEvent>((event, emit) {
      print('Emitting InternetGainedState');
      emit(InternetGainedState());
    });

    on<InternetLostEvent>((event, emit) {
      print('Emitting InternetLostState');
      emit(InternetLostState());
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
