import 'package:equatable/equatable.dart';


abstract class SponsorRequestEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SendSponsorRequest extends SponsorRequestEvent {}
