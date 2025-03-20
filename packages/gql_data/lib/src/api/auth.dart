import 'package:api/api.dart';
import '../graphql/mutation.gql.dart';
import '../graphql/query.gql.dart';
import '../schema.graphqls.dart';

class AuthApi {
  AuthQuery get query => AuthQuery();
  AuthMutations get mutations => AuthMutations();
}

typedef CheckProviderResult = Query$GetProvider$auth$check_provider;
typedef LoginEmailResult = Mutation$login_email$auth$login_email;
typedef RegisterEmailResult = Mutation$register_email$auth$register_email;
typedef VerifyEmailResult = Mutation$VerifyEmail$auth$verify_email;

class AuthQuery {
  Future<CheckProviderResult> getProvider(String contact) async {
    final res = await client.query$GetProvider(
      Options$Query$GetProvider(
        variables: Variables$Query$GetProvider(contact: contact),
      ),
    );

    return res.parsedData!.auth.check_provider;
  }

  Future<Query$Me$auth$me> me() async {
    final res = await throwIfException(client.query$Me());
    return res.auth.me;
  }
}

class AuthMutations {
  Future<LoginEmailResult> loginEmail(String email, String password) async {
    final res = await client.mutate$login_email(
      Options$Mutation$login_email(
        variables: Variables$Mutation$login_email(
          input: Input$LoginEmailRequest(email: email, password: password),
        ),
      ),
    );

    return res.parsedData!.auth.login_email;
  }

  Future<String> getDeviceId(Input$SetDeviceIdInput input) async {
    final res = await throwIfException(
      client.mutate$SetDevice(
        Options$Mutation$SetDevice(
          variables: Variables$Mutation$SetDevice(input: input),
        ),
      ),
    );
    return res.public.set_device_id;
  }

  Future<RegisterEmailResult> registerEmail(
    Input$RegisterEmailRequest input,
  ) async {
    final res = await throwIfException(
      client.mutate$register_email(
        Options$Mutation$register_email(
          variables: Variables$Mutation$register_email(input: input),
        ),
      ),
    );

    return res.auth.register_email;
  }

  Future<VerifyEmailResult> verifyEmail(Input$VerifyEmailRequest input) async {
    final res = await throwIfException(
      client.mutate$VerifyEmail(
        Options$Mutation$VerifyEmail(
          variables: Variables$Mutation$VerifyEmail(input: input),
        ),
      ),
    );
    return res.auth.verify_email;
  }
}
