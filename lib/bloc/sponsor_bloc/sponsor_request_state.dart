
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:react_conf/data/model/conference_detail_response/conference_detail_response.dart';

@immutable
abstract class SponsorRequestState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialSponsorRequest extends SponsorRequestState {}

class SendingSponsorRequest extends SponsorRequestState {}

class GetSponsorListSuccessfully extends SponsorRequestState {
  GetSponsorListSuccessfully({required this.conferenceDetailData});
 final ConferenceDetailData conferenceDetailData;

 @override
 List<Object> get props => [conferenceDetailData];
}

class SponsorRequestError extends SponsorRequestState {
  SponsorRequestError({this.error});
  final dynamic error;

  @override
  List<Object> get props => [error];
}