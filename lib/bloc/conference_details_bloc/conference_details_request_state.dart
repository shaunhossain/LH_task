
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:react_conf/data/model/conference_detail_response/conference_detail_response.dart';

@immutable
abstract class ConferenceDetailsRequestState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialConferenceDetailsRequest extends ConferenceDetailsRequestState {}

class SendingConferenceDetailsRequest extends ConferenceDetailsRequestState {}

class GetConferenceDetailsSuccessfully extends ConferenceDetailsRequestState {
  GetConferenceDetailsSuccessfully({required this.conferenceDetailData});
 final ConferenceDetailData conferenceDetailData;

 @override
 List<Object> get props => [conferenceDetailData];
}

class ConferenceDetailsRequestError extends ConferenceDetailsRequestState {
  ConferenceDetailsRequestError({this.error});
  final dynamic error;

  @override
  List<Object> get props => [error];
}