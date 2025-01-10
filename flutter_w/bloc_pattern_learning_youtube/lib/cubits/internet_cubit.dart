import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? _streamSubscription;

  InternetCubit() : super(InternetInitialState()) {
    _streamSubscription = _connectivity.onConnectivityChanged.listen((result) async {
      final currentResult = await _connectivity.checkConnectivity();

      if (currentResult.contains(ConnectivityResult.mobile) ||
          currentResult.contains(ConnectivityResult.wifi)) {
        emit(InternetGainedState());
      } else {
        emit(InternetLostState());
      }
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
