import 'package:graphql_flutter/graphql_flutter.dart';

class Repository {
  final GraphQLClient client;

  Repository({
    required this.client,
  });

  Future<QueryResult> getData({required String query}) async {
    final results = await client.query(
      QueryOptions(
        document: gql(query),
      ),
    );
    print(results);
    return results;
  }
}