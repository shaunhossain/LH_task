import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:react_conf/bloc/conference_list_bloc/conference_request_event.dart';
import 'package:react_conf/bloc/conference_list_bloc/conference_request_state.dart';
import 'package:react_conf/core/util/query_list.dart';
import 'package:react_conf/data/exceptions.dart';
import 'package:react_conf/data/model/conference_response/conference_response.dart';
import 'package:react_conf/data/repository/repository.dart';

class ConferenceListBloc extends Bloc<ConferenceRequestEvent, ConferenceRequestState> {
  ConferenceListBloc({required this.repository})
      : super(InitialConferenceRequest()) {
    on<SendConferenceRequest>(_onSendConferenceRequest);
  }

  final Repository repository;

  void _onSendConferenceRequest(SendConferenceRequest event,
      Emitter<ConferenceRequestState> emit) async {
     emit(SendingConferenceRequest());
    try {
      final response = await repository.getData(query: conferenceListQuery());
      // if(response.isLoading){
      //   emit(SendingConferenceRequest());
      // }
      final responseString = response.data;
      try{
        final ConferenceData responseData = ConferenceData.fromJson(responseString!);
        emit(GetConferenceListSuccessfully(listOfConference: responseData.conferences ?? []));
      }catch(exception){
        emit(ConferenceRequestError(
          error: UnknownException(exception.toString()),
        ));
      }
    } on SocketException {
      emit(ConferenceRequestError(
        error: NoInternetException('No Internet'),
      ));
    } on HttpException {
      emit(ConferenceRequestError(
        error: NoServiceFoundException('No Service Found'),
      ));
    } on FormatException {
      emit(ConferenceRequestError(
        error: InvalidFormatException('Invalid Response format'),
      ));
    } catch (e) {
      emit(ConferenceRequestError(
        error: UnknownException(e),
      ));
    }
  }
}
