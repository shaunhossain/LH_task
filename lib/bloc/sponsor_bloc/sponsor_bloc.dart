import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:react_conf/bloc/sponsor_bloc/sponsor_request_event.dart';
import 'package:react_conf/bloc/sponsor_bloc/sponsor_request_state.dart';
import 'package:react_conf/core/util/query_list.dart';
import 'package:react_conf/data/exceptions.dart';
import 'package:react_conf/data/model/sponsor_response/sponsor_response.dart';
import 'package:react_conf/data/repository/repository.dart';

class SponsorBloc extends Bloc<SponsorRequestEvent, SponsorRequestState> {
  SponsorBloc({required this.repository}) : super(InitialSponsorRequest()) {
    on<SendSponsorRequest>(_onSendSponsorRequest);
  }

  final Repository repository;

  List<Sponsor> listOfGoldSponsors = <Sponsor>[];
  List<Sponsor> listOfSponsors = <Sponsor>[];
  List<Sponsor> listOfBronzeSponsors = <Sponsor>[];

  void _onSendSponsorRequest(
      SendSponsorRequest event, Emitter<SponsorRequestState> emit) async {
    emit(SendingSponsorRequest());
    listOfSponsors.clear();
    listOfBronzeSponsors.clear();
    listOfGoldSponsors.clear();
    try {
      final response = await repository.getData(query: sponsorListQuery());
      final responseString = response.data['data'];
      try {
        final SponsorData responseData = SponsorData.fromJson(responseString!);
        for (var item in responseData.sponsors!) {
          if (item.type!.first == Type.SPONSOR && item.image != null) {
            listOfSponsors.add(item);
          }

          if (item.type!.first == Type.BRONZE_SPONSOR && item.image != null) {
            listOfSponsors.add(item);
          }

          if (item.type!.first == Type.GOLD_SPONSOR && item.image != null) {
            listOfSponsors.add(item);
          }
        }
        emit(GetSponsorListSuccessfully(
            listOfSponsors: listOfSponsors,
            listOfGoldSponsors: listOfGoldSponsors,
            listOfBronzeSponsors: listOfBronzeSponsors));
      } catch (exception) {
        emit(SponsorRequestError(
          error: UnknownException(exception.toString()),
        ));
      }
    } on SocketException {
      emit(SponsorRequestError(
        error: NoInternetException('No Internet'),
      ));
    } on HttpException {
      emit(SponsorRequestError(
        error: NoServiceFoundException('No Service Found'),
      ));
    } on FormatException {
      emit(SponsorRequestError(
        error: InvalidFormatException('Invalid Response format'),
      ));
    } catch (e) {
      emit(SponsorRequestError(
        error: UnknownException(e),
      ));
    }
  }
}
