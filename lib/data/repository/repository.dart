import 'package:react_conf/data/service/graphql_service.dart';

class Repository {
  final GraphQLService service = GraphQLService();
  Future<dynamic> getData({required String query}) async {
    final results = await service.getData(query: query);
    return results;
  }
}