import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'internet_event.dart';
import 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  StreamSubscription? subscriptions;

  InternetBloc() : super(InitState()) {
    on<OnConnected>(
        (event, emit) => emit(Connected(message: "Connected.....")));
    on<OnNotConnected>(
        (event, emit) => emit(Disconnected(message: "Disconnected.....")));

    subscriptions = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        add(OnConnected());
      } else {
        add(OnNotConnected());
      }
    });
  }

  @override
  Future<void> close() async {
    subscriptions!.cancel();
    return super.close();
  }
}
