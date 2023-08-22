import 'package:equatable/equatable.dart';


abstract class ConferenceDetailsRequestEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SendConferenceDetailsRequest extends ConferenceDetailsRequestEvent {
  SendConferenceDetailsRequest({required this.id});
  final String id;
}
