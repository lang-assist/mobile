import 'package:api/api.dart';

import '../../gql_data.dart';
import '../graphql/query.gql.dart';

class UserSubscriptions {
  Stream<Fragment$ConversationUpdate> startConversation(
    String materialId,
  ) async* {
    final res = client.subscribe$StartConversation(
      Options$Subscription$StartConversation(
        variables: Variables$Subscription$StartConversation(
          materialId: materialId,
        ),
      ),
    );

    await for (final e in res) {
      yield e.parsedData!.start_conversation;
    }
  }
}
