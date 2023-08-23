import 'package:dio/dio.dart';
import 'package:react_conf/core/util/endpoint.dart';

abstract class BaseService {
  Future<dynamic> getData({required String query});
}

class GraphQLService extends BaseService {
  final Dio _client = Dio();

  @override
  Future getData({required String query}) async {
    var response = await _client.post(baseUrl, data: {
      'query':query
    });
    return response;
  }
}
