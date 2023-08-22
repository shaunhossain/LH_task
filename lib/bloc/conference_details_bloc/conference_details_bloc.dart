import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:react_conf/bloc/conference_details_bloc/conference_details_request_event.dart';
import 'package:react_conf/bloc/conference_details_bloc/conference_details_request_state.dart';
import 'package:react_conf/core/util/query_list.dart';
import 'package:react_conf/data/exceptions.dart';
import 'package:react_conf/data/model/conference_detail_response/conference_detail_response.dart';
import 'package:react_conf/data/repository/repository.dart';

class ConferenceDetailsBloc
    extends Bloc<ConferenceDetailsRequestEvent, ConferenceDetailsRequestState> {
  ConferenceDetailsBloc({required this.repository})
      : super(InitialConferenceDetailsRequest()) {
    on<SendConferenceDetailsRequest>(_onSendConferenceDetailsRequest);
  }

  final Repository repository;

  void _onSendConferenceDetailsRequest(SendConferenceDetailsRequest event,
      Emitter<ConferenceDetailsRequestState> emit) async {
    emit(SendingConferenceDetailsRequest());
    try {
      final response =
          await repository.getData(query: conferenceQuery(id: event.id));
      // if(response.isLoading){
      //   emit(SendingConferenceRequest());
      // }
      final responseString = response.data;
      try {
        final ConferenceDetailData responseData =
            ConferenceDetailData.fromJson(responseString!);
        emit(GetConferenceDetailsSuccessfully(
            conferenceDetailData: responseData));
      } catch (exception) {
        emit(ConferenceDetailsRequestError(
          error: UnknownException(exception.toString()),
        ));
      }
    } on SocketException {
      emit(ConferenceDetailsRequestError(
        error: NoInternetException('No Internet'),
      ));
    } on HttpException {
      emit(ConferenceDetailsRequestError(
        error: NoServiceFoundException('No Service Found'),
      ));
    } on FormatException {
      emit(ConferenceDetailsRequestError(
        error: InvalidFormatException('Invalid Response format'),
      ));
    } catch (e) {
      emit(ConferenceDetailsRequestError(
        error: UnknownException(e),
      ));
    }
  }
}
