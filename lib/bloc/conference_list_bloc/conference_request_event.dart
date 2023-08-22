import 'package:equatable/equatable.dart';


abstract class ConferenceRequestEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SendConferenceRequest extends ConferenceRequestEvent {}
