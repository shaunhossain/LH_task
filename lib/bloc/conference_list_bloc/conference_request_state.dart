
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:react_conf/data/model/conference_response/conference_response.dart';

@immutable
abstract class ConferenceRequestState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialConferenceRequest extends ConferenceRequestState {}

class SendingConferenceRequest extends ConferenceRequestState {}

class GetConferenceListSuccessfully extends ConferenceRequestState {
  GetConferenceListSuccessfully({required this.listOfConference});
 final List<Conference> listOfConference;

 @override
 List<Object> get props => [listOfConference];
}

class ConferenceRequestError extends ConferenceRequestState {
  ConferenceRequestError({this.error});
  final dynamic error;

  @override
  List<Object> get props => [error];
}