
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:react_conf/data/model/sponsor_response/sponsor_response.dart';

@immutable
abstract class SponsorRequestState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialSponsorRequest extends SponsorRequestState {}

class SendingSponsorRequest extends SponsorRequestState {}

class GetSponsorListSuccessfully extends SponsorRequestState {
  GetSponsorListSuccessfully({required this.listOfSponsors, required this.listOfGoldSponsors, required this.listOfBronzeSponsors,});
 final List<Sponsor> listOfGoldSponsors;
 final List<Sponsor> listOfSponsors;
 final List<Sponsor> listOfBronzeSponsors;

 @override
 List<Object> get props => [listOfSponsors];
}

class SponsorRequestError extends SponsorRequestState {
  SponsorRequestError({this.error});
  final dynamic error;

  @override
  List<Object> get props => [error];
}