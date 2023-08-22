import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:react_conf/core/util/endpoint.dart';

final HttpLink _httpLink = HttpLink(
  baseUrl,
);

final Link _link = _httpLink;

ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
    cache: GraphQLCache(store: HiveStore()),
    link: _link,
  ),
);