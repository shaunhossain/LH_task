abstract class InternetState {}

class InitState extends InternetState {}

class Connected extends InternetState {
  final String message;

  Connected({required this.message});
}

class Disconnected extends InternetState {
  final String message;

  Disconnected({required this.message});
}
