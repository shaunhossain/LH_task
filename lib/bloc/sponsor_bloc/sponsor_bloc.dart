import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:react_conf/bloc/sponsor_bloc/sponsor_request_event.dart';
import 'package:react_conf/bloc/sponsor_bloc/sponsor_request_state.dart';
import 'package:react_conf/core/util/query_list.dart';
import 'package:react_conf/data/exceptions.dart';
import 'package:react_conf/data/repository/repository.dart';

class SponsorBloc
    extends Bloc<SponsorRequestEvent, SponsorRequestState> {
  SponsorBloc({required this.repository})
      : super(InitialSponsorRequest()) {
    on<SendSponsorRequest>(_onSendSponsorRequest);
  }

  final Repository repository;

  void _onSendSponsorRequest(SendSponsorRequest event,
      Emitter<SponsorRequestState> emit) async {
    emit(SendingSponsorRequest());
    try {
      final response =
          await repository.getData(query: sponsorListQuery());
      // if(response.isLoading){
      //   emit(SendingConferenceRequest());
      // }
      final responseString = response.data;
      log("sponsor_data ->${responseString}");
      // try {
      //   final ConferenceDetailData responseData =
      //       ConferenceDetailData.fromJson(responseString!);
      //   emit(GetSponsorListSuccessfully(
      //       conferenceDetailData: responseData));
      // } catch (exception) {
      //   emit(SponsorRequestError(
      //     error: UnknownException(exception.toString()),
      //   ));
      // }
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
