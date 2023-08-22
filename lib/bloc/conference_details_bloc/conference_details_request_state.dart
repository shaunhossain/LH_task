
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:react_conf/data/model/conference_response/conference_response.dart';

@immutable
abstract class ConferenceDetailsRequestState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialConferenceDetailsRequest extends ConferenceDetailsRequestState {}

class SendingConferenceDetailsRequest extends ConferenceDetailsRequestState {}

class GetConferenceDetailsSuccessfully extends ConferenceDetailsRequestState {
  GetConferenceDetailsSuccessfully({required this.listOfConference});
 final List<Conference> listOfConference;

 @override
 List<Object> get props => [listOfConference];
}

class ConferenceDetailsRequestError extends ConferenceDetailsRequestState {
  ConferenceDetailsRequestError({this.error});
  final dynamic error;

  @override
  List<Object> get props => [error];
}