import '../schema.graphqls.dart';
import 'dart:async';
import 'fragments.gql.dart';
import 'package:api/api.dart';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Query$Me {
  Query$Me({
    required this.auth,
    this.$__typename = 'Query',
  });

  factory Query$Me.fromJson(Map<String, dynamic> json) {
    final l$auth = json['auth'];
    final l$$__typename = json['__typename'];
    return Query$Me(
      auth: Query$Me$auth.fromJson((l$auth as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Me$auth auth;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$auth = auth;
    _resultData['auth'] = l$auth.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$auth = auth;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$auth,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Me || runtimeType != other.runtimeType) {
      return false;
    }
    final l$auth = auth;
    final lOther$auth = other.auth;
    if (l$auth != lOther$auth) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$Me on Query$Me {
  CopyWith$Query$Me<Query$Me> get copyWith => CopyWith$Query$Me(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Me<TRes> {
  factory CopyWith$Query$Me(
    Query$Me instance,
    TRes Function(Query$Me) then,
  ) = _CopyWithImpl$Query$Me;

  factory CopyWith$Query$Me.stub(TRes res) = _CopyWithStubImpl$Query$Me;

  TRes call({
    Query$Me$auth? auth,
    String? $__typename,
  });
  CopyWith$Query$Me$auth<TRes> get auth;
}

class _CopyWithImpl$Query$Me<TRes> implements CopyWith$Query$Me<TRes> {
  _CopyWithImpl$Query$Me(
    this._instance,
    this._then,
  );

  final Query$Me _instance;

  final TRes Function(Query$Me) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? auth = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Me(
        auth: auth == _undefined || auth == null
            ? _instance.auth
            : (auth as Query$Me$auth),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$Me$auth<TRes> get auth {
    final local$auth = _instance.auth;
    return CopyWith$Query$Me$auth(local$auth, (e) => call(auth: e));
  }
}

class _CopyWithStubImpl$Query$Me<TRes> implements CopyWith$Query$Me<TRes> {
  _CopyWithStubImpl$Query$Me(this._res);

  TRes _res;

  call({
    Query$Me$auth? auth,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$Me$auth<TRes> get auth => CopyWith$Query$Me$auth.stub(_res);
}

const documentNodeQueryMe = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'Me'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'auth'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'me'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'user'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FragmentSpreadNode(
                    name: NameNode(value: 'PublicUser'),
                    directives: [],
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: 'admin'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FragmentSpreadNode(
                    name: NameNode(value: 'MeAdmin'),
                    directives: [],
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  fragmentDefinitionPublicUser,
  fragmentDefinitionMeAdmin,
]);
Query$Me _parserFn$Query$Me(Map<String, dynamic> data) =>
    Query$Me.fromJson(data);
typedef OnQueryComplete$Query$Me = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$Me?,
);

class Options$Query$Me extends graphql.QueryOptions<Query$Me> {
  Options$Query$Me({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Me? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$Me? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$Me(data),
                  ),
          onError: onError,
          document: documentNodeQueryMe,
          parserFn: _parserFn$Query$Me,
        );

  final OnQueryComplete$Query$Me? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$Me extends graphql.WatchQueryOptions<Query$Me> {
  WatchOptions$Query$Me({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Me? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryMe,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$Me,
        );
}

class FetchMoreOptions$Query$Me extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Me({required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryMe,
        );
}

extension ClientExtension$Query$Me on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Me>> query$Me(
          [Options$Query$Me? options]) async =>
      await this.query(options ?? Options$Query$Me());
  graphql.ObservableQuery<Query$Me> watchQuery$Me(
          [WatchOptions$Query$Me? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$Me());
  void writeQuery$Me({
    required Query$Me data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(document: documentNodeQueryMe)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$Me? readQuery$Me({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryMe)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$Me.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$Me> useQuery$Me(
        [Options$Query$Me? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$Me());
graphql.ObservableQuery<Query$Me> useWatchQuery$Me(
        [WatchOptions$Query$Me? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$Me());

class Query$Me$Widget extends graphql_flutter.Query<Query$Me> {
  Query$Me$Widget({
    widgets.Key? key,
    Options$Query$Me? options,
    required graphql_flutter.QueryBuilder<Query$Me> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$Me(),
          builder: builder,
        );
}

class Query$Me$auth {
  Query$Me$auth({
    required this.me,
    this.$__typename = 'AuthQuery',
  });

  factory Query$Me$auth.fromJson(Map<String, dynamic> json) {
    final l$me = json['me'];
    final l$$__typename = json['__typename'];
    return Query$Me$auth(
      me: Query$Me$auth$me.fromJson((l$me as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Me$auth$me me;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$me = me;
    _resultData['me'] = l$me.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$me = me;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$me,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Me$auth || runtimeType != other.runtimeType) {
      return false;
    }
    final l$me = me;
    final lOther$me = other.me;
    if (l$me != lOther$me) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$Me$auth on Query$Me$auth {
  CopyWith$Query$Me$auth<Query$Me$auth> get copyWith => CopyWith$Query$Me$auth(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Me$auth<TRes> {
  factory CopyWith$Query$Me$auth(
    Query$Me$auth instance,
    TRes Function(Query$Me$auth) then,
  ) = _CopyWithImpl$Query$Me$auth;

  factory CopyWith$Query$Me$auth.stub(TRes res) =
      _CopyWithStubImpl$Query$Me$auth;

  TRes call({
    Query$Me$auth$me? me,
    String? $__typename,
  });
  CopyWith$Query$Me$auth$me<TRes> get me;
}

class _CopyWithImpl$Query$Me$auth<TRes>
    implements CopyWith$Query$Me$auth<TRes> {
  _CopyWithImpl$Query$Me$auth(
    this._instance,
    this._then,
  );

  final Query$Me$auth _instance;

  final TRes Function(Query$Me$auth) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? me = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Me$auth(
        me: me == _undefined || me == null
            ? _instance.me
            : (me as Query$Me$auth$me),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$Me$auth$me<TRes> get me {
    final local$me = _instance.me;
    return CopyWith$Query$Me$auth$me(local$me, (e) => call(me: e));
  }
}

class _CopyWithStubImpl$Query$Me$auth<TRes>
    implements CopyWith$Query$Me$auth<TRes> {
  _CopyWithStubImpl$Query$Me$auth(this._res);

  TRes _res;

  call({
    Query$Me$auth$me? me,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$Me$auth$me<TRes> get me =>
      CopyWith$Query$Me$auth$me.stub(_res);
}

class Query$Me$auth$me {
  Query$Me$auth$me({
    required this.user,
    this.admin,
    this.$__typename = 'MeResponse',
  });

  factory Query$Me$auth$me.fromJson(Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$admin = json['admin'];
    final l$$__typename = json['__typename'];
    return Query$Me$auth$me(
      user: Fragment$PublicUser.fromJson((l$user as Map<String, dynamic>)),
      admin: l$admin == null
          ? null
          : Fragment$MeAdmin.fromJson((l$admin as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$PublicUser user;

  final Fragment$MeAdmin? admin;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$admin = admin;
    _resultData['admin'] = l$admin?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user = user;
    final l$admin = admin;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user,
      l$admin,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Me$auth$me || runtimeType != other.runtimeType) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
      return false;
    }
    final l$admin = admin;
    final lOther$admin = other.admin;
    if (l$admin != lOther$admin) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$Me$auth$me on Query$Me$auth$me {
  CopyWith$Query$Me$auth$me<Query$Me$auth$me> get copyWith =>
      CopyWith$Query$Me$auth$me(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Me$auth$me<TRes> {
  factory CopyWith$Query$Me$auth$me(
    Query$Me$auth$me instance,
    TRes Function(Query$Me$auth$me) then,
  ) = _CopyWithImpl$Query$Me$auth$me;

  factory CopyWith$Query$Me$auth$me.stub(TRes res) =
      _CopyWithStubImpl$Query$Me$auth$me;

  TRes call({
    Fragment$PublicUser? user,
    Fragment$MeAdmin? admin,
    String? $__typename,
  });
  CopyWith$Fragment$PublicUser<TRes> get user;
  CopyWith$Fragment$MeAdmin<TRes> get admin;
}

class _CopyWithImpl$Query$Me$auth$me<TRes>
    implements CopyWith$Query$Me$auth$me<TRes> {
  _CopyWithImpl$Query$Me$auth$me(
    this._instance,
    this._then,
  );

  final Query$Me$auth$me _instance;

  final TRes Function(Query$Me$auth$me) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user = _undefined,
    Object? admin = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Me$auth$me(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Fragment$PublicUser),
        admin: admin == _undefined
            ? _instance.admin
            : (admin as Fragment$MeAdmin?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$PublicUser<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Fragment$PublicUser(local$user, (e) => call(user: e));
  }

  CopyWith$Fragment$MeAdmin<TRes> get admin {
    final local$admin = _instance.admin;
    return local$admin == null
        ? CopyWith$Fragment$MeAdmin.stub(_then(_instance))
        : CopyWith$Fragment$MeAdmin(local$admin, (e) => call(admin: e));
  }
}

class _CopyWithStubImpl$Query$Me$auth$me<TRes>
    implements CopyWith$Query$Me$auth$me<TRes> {
  _CopyWithStubImpl$Query$Me$auth$me(this._res);

  TRes _res;

  call({
    Fragment$PublicUser? user,
    Fragment$MeAdmin? admin,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$PublicUser<TRes> get user =>
      CopyWith$Fragment$PublicUser.stub(_res);

  CopyWith$Fragment$MeAdmin<TRes> get admin =>
      CopyWith$Fragment$MeAdmin.stub(_res);
}

class Variables$Query$GetProvider {
  factory Variables$Query$GetProvider({required String contact}) =>
      Variables$Query$GetProvider._({
        r'contact': contact,
      });

  Variables$Query$GetProvider._(this._$data);

  factory Variables$Query$GetProvider.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$contact = data['contact'];
    result$data['contact'] = (l$contact as String);
    return Variables$Query$GetProvider._(result$data);
  }

  Map<String, dynamic> _$data;

  String get contact => (_$data['contact'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$contact = contact;
    result$data['contact'] = l$contact;
    return result$data;
  }

  CopyWith$Variables$Query$GetProvider<Variables$Query$GetProvider>
      get copyWith => CopyWith$Variables$Query$GetProvider(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetProvider ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$contact = contact;
    final lOther$contact = other.contact;
    if (l$contact != lOther$contact) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$contact = contact;
    return Object.hashAll([l$contact]);
  }
}

abstract class CopyWith$Variables$Query$GetProvider<TRes> {
  factory CopyWith$Variables$Query$GetProvider(
    Variables$Query$GetProvider instance,
    TRes Function(Variables$Query$GetProvider) then,
  ) = _CopyWithImpl$Variables$Query$GetProvider;

  factory CopyWith$Variables$Query$GetProvider.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetProvider;

  TRes call({String? contact});
}

class _CopyWithImpl$Variables$Query$GetProvider<TRes>
    implements CopyWith$Variables$Query$GetProvider<TRes> {
  _CopyWithImpl$Variables$Query$GetProvider(
    this._instance,
    this._then,
  );

  final Variables$Query$GetProvider _instance;

  final TRes Function(Variables$Query$GetProvider) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? contact = _undefined}) =>
      _then(Variables$Query$GetProvider._({
        ..._instance._$data,
        if (contact != _undefined && contact != null)
          'contact': (contact as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetProvider<TRes>
    implements CopyWith$Variables$Query$GetProvider<TRes> {
  _CopyWithStubImpl$Variables$Query$GetProvider(this._res);

  TRes _res;

  call({String? contact}) => _res;
}

class Query$GetProvider {
  Query$GetProvider({
    required this.auth,
    this.$__typename = 'Query',
  });

  factory Query$GetProvider.fromJson(Map<String, dynamic> json) {
    final l$auth = json['auth'];
    final l$$__typename = json['__typename'];
    return Query$GetProvider(
      auth: Query$GetProvider$auth.fromJson((l$auth as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetProvider$auth auth;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$auth = auth;
    _resultData['auth'] = l$auth.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$auth = auth;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$auth,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetProvider || runtimeType != other.runtimeType) {
      return false;
    }
    final l$auth = auth;
    final lOther$auth = other.auth;
    if (l$auth != lOther$auth) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetProvider on Query$GetProvider {
  CopyWith$Query$GetProvider<Query$GetProvider> get copyWith =>
      CopyWith$Query$GetProvider(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetProvider<TRes> {
  factory CopyWith$Query$GetProvider(
    Query$GetProvider instance,
    TRes Function(Query$GetProvider) then,
  ) = _CopyWithImpl$Query$GetProvider;

  factory CopyWith$Query$GetProvider.stub(TRes res) =
      _CopyWithStubImpl$Query$GetProvider;

  TRes call({
    Query$GetProvider$auth? auth,
    String? $__typename,
  });
  CopyWith$Query$GetProvider$auth<TRes> get auth;
}

class _CopyWithImpl$Query$GetProvider<TRes>
    implements CopyWith$Query$GetProvider<TRes> {
  _CopyWithImpl$Query$GetProvider(
    this._instance,
    this._then,
  );

  final Query$GetProvider _instance;

  final TRes Function(Query$GetProvider) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? auth = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetProvider(
        auth: auth == _undefined || auth == null
            ? _instance.auth
            : (auth as Query$GetProvider$auth),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetProvider$auth<TRes> get auth {
    final local$auth = _instance.auth;
    return CopyWith$Query$GetProvider$auth(local$auth, (e) => call(auth: e));
  }
}

class _CopyWithStubImpl$Query$GetProvider<TRes>
    implements CopyWith$Query$GetProvider<TRes> {
  _CopyWithStubImpl$Query$GetProvider(this._res);

  TRes _res;

  call({
    Query$GetProvider$auth? auth,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetProvider$auth<TRes> get auth =>
      CopyWith$Query$GetProvider$auth.stub(_res);
}

const documentNodeQueryGetProvider = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetProvider'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'contact')),
        type: NamedTypeNode(
          name: NameNode(value: 'Contact'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'auth'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'check_provider'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'contact'),
                value: VariableNode(name: NameNode(value: 'contact')),
              )
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'user'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FragmentSpreadNode(
                    name: NameNode(value: 'PublicUser'),
                    directives: [],
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: 'providers'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  fragmentDefinitionPublicUser,
]);
Query$GetProvider _parserFn$Query$GetProvider(Map<String, dynamic> data) =>
    Query$GetProvider.fromJson(data);
typedef OnQueryComplete$Query$GetProvider = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetProvider?,
);

class Options$Query$GetProvider
    extends graphql.QueryOptions<Query$GetProvider> {
  Options$Query$GetProvider({
    String? operationName,
    required Variables$Query$GetProvider variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetProvider? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetProvider? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$GetProvider(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetProvider,
          parserFn: _parserFn$Query$GetProvider,
        );

  final OnQueryComplete$Query$GetProvider? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetProvider
    extends graphql.WatchQueryOptions<Query$GetProvider> {
  WatchOptions$Query$GetProvider({
    String? operationName,
    required Variables$Query$GetProvider variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetProvider? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryGetProvider,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetProvider,
        );
}

class FetchMoreOptions$Query$GetProvider extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetProvider({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetProvider variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetProvider,
        );
}

extension ClientExtension$Query$GetProvider on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetProvider>> query$GetProvider(
          Options$Query$GetProvider options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$GetProvider> watchQuery$GetProvider(
          WatchOptions$Query$GetProvider options) =>
      this.watchQuery(options);
  void writeQuery$GetProvider({
    required Query$GetProvider data,
    required Variables$Query$GetProvider variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryGetProvider),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetProvider? readQuery$GetProvider({
    required Variables$Query$GetProvider variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetProvider),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetProvider.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetProvider> useQuery$GetProvider(
        Options$Query$GetProvider options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetProvider> useWatchQuery$GetProvider(
        WatchOptions$Query$GetProvider options) =>
    graphql_flutter.useWatchQuery(options);

class Query$GetProvider$Widget
    extends graphql_flutter.Query<Query$GetProvider> {
  Query$GetProvider$Widget({
    widgets.Key? key,
    required Options$Query$GetProvider options,
    required graphql_flutter.QueryBuilder<Query$GetProvider> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$GetProvider$auth {
  Query$GetProvider$auth({
    required this.check_provider,
    this.$__typename = 'AuthQuery',
  });

  factory Query$GetProvider$auth.fromJson(Map<String, dynamic> json) {
    final l$check_provider = json['check_provider'];
    final l$$__typename = json['__typename'];
    return Query$GetProvider$auth(
      check_provider: Query$GetProvider$auth$check_provider.fromJson(
          (l$check_provider as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetProvider$auth$check_provider check_provider;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$check_provider = check_provider;
    _resultData['check_provider'] = l$check_provider.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$check_provider = check_provider;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$check_provider,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetProvider$auth || runtimeType != other.runtimeType) {
      return false;
    }
    final l$check_provider = check_provider;
    final lOther$check_provider = other.check_provider;
    if (l$check_provider != lOther$check_provider) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetProvider$auth on Query$GetProvider$auth {
  CopyWith$Query$GetProvider$auth<Query$GetProvider$auth> get copyWith =>
      CopyWith$Query$GetProvider$auth(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetProvider$auth<TRes> {
  factory CopyWith$Query$GetProvider$auth(
    Query$GetProvider$auth instance,
    TRes Function(Query$GetProvider$auth) then,
  ) = _CopyWithImpl$Query$GetProvider$auth;

  factory CopyWith$Query$GetProvider$auth.stub(TRes res) =
      _CopyWithStubImpl$Query$GetProvider$auth;

  TRes call({
    Query$GetProvider$auth$check_provider? check_provider,
    String? $__typename,
  });
  CopyWith$Query$GetProvider$auth$check_provider<TRes> get check_provider;
}

class _CopyWithImpl$Query$GetProvider$auth<TRes>
    implements CopyWith$Query$GetProvider$auth<TRes> {
  _CopyWithImpl$Query$GetProvider$auth(
    this._instance,
    this._then,
  );

  final Query$GetProvider$auth _instance;

  final TRes Function(Query$GetProvider$auth) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? check_provider = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetProvider$auth(
        check_provider: check_provider == _undefined || check_provider == null
            ? _instance.check_provider
            : (check_provider as Query$GetProvider$auth$check_provider),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetProvider$auth$check_provider<TRes> get check_provider {
    final local$check_provider = _instance.check_provider;
    return CopyWith$Query$GetProvider$auth$check_provider(
        local$check_provider, (e) => call(check_provider: e));
  }
}

class _CopyWithStubImpl$Query$GetProvider$auth<TRes>
    implements CopyWith$Query$GetProvider$auth<TRes> {
  _CopyWithStubImpl$Query$GetProvider$auth(this._res);

  TRes _res;

  call({
    Query$GetProvider$auth$check_provider? check_provider,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetProvider$auth$check_provider<TRes> get check_provider =>
      CopyWith$Query$GetProvider$auth$check_provider.stub(_res);
}

class Query$GetProvider$auth$check_provider {
  Query$GetProvider$auth$check_provider({
    this.user,
    required this.providers,
    this.$__typename = 'ProviderResponse',
  });

  factory Query$GetProvider$auth$check_provider.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$providers = json['providers'];
    final l$$__typename = json['__typename'];
    return Query$GetProvider$auth$check_provider(
      user: l$user == null
          ? null
          : Fragment$PublicUser.fromJson((l$user as Map<String, dynamic>)),
      providers: (l$providers as List<dynamic>)
          .map((e) => fromJson$Enum$Providers((e as String)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$PublicUser? user;

  final List<Enum$Providers> providers;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user = user;
    _resultData['user'] = l$user?.toJson();
    final l$providers = providers;
    _resultData['providers'] =
        l$providers.map((e) => toJson$Enum$Providers(e)).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user = user;
    final l$providers = providers;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user,
      Object.hashAll(l$providers.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetProvider$auth$check_provider ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
      return false;
    }
    final l$providers = providers;
    final lOther$providers = other.providers;
    if (l$providers.length != lOther$providers.length) {
      return false;
    }
    for (int i = 0; i < l$providers.length; i++) {
      final l$providers$entry = l$providers[i];
      final lOther$providers$entry = lOther$providers[i];
      if (l$providers$entry != lOther$providers$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetProvider$auth$check_provider
    on Query$GetProvider$auth$check_provider {
  CopyWith$Query$GetProvider$auth$check_provider<
          Query$GetProvider$auth$check_provider>
      get copyWith => CopyWith$Query$GetProvider$auth$check_provider(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetProvider$auth$check_provider<TRes> {
  factory CopyWith$Query$GetProvider$auth$check_provider(
    Query$GetProvider$auth$check_provider instance,
    TRes Function(Query$GetProvider$auth$check_provider) then,
  ) = _CopyWithImpl$Query$GetProvider$auth$check_provider;

  factory CopyWith$Query$GetProvider$auth$check_provider.stub(TRes res) =
      _CopyWithStubImpl$Query$GetProvider$auth$check_provider;

  TRes call({
    Fragment$PublicUser? user,
    List<Enum$Providers>? providers,
    String? $__typename,
  });
  CopyWith$Fragment$PublicUser<TRes> get user;
}

class _CopyWithImpl$Query$GetProvider$auth$check_provider<TRes>
    implements CopyWith$Query$GetProvider$auth$check_provider<TRes> {
  _CopyWithImpl$Query$GetProvider$auth$check_provider(
    this._instance,
    this._then,
  );

  final Query$GetProvider$auth$check_provider _instance;

  final TRes Function(Query$GetProvider$auth$check_provider) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user = _undefined,
    Object? providers = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetProvider$auth$check_provider(
        user: user == _undefined
            ? _instance.user
            : (user as Fragment$PublicUser?),
        providers: providers == _undefined || providers == null
            ? _instance.providers
            : (providers as List<Enum$Providers>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$PublicUser<TRes> get user {
    final local$user = _instance.user;
    return local$user == null
        ? CopyWith$Fragment$PublicUser.stub(_then(_instance))
        : CopyWith$Fragment$PublicUser(local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$GetProvider$auth$check_provider<TRes>
    implements CopyWith$Query$GetProvider$auth$check_provider<TRes> {
  _CopyWithStubImpl$Query$GetProvider$auth$check_provider(this._res);

  TRes _res;

  call({
    Fragment$PublicUser? user,
    List<Enum$Providers>? providers,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$PublicUser<TRes> get user =>
      CopyWith$Fragment$PublicUser.stub(_res);
}

class Query$GetMyJourneys {
  Query$GetMyJourneys({
    required this.user,
    this.$__typename = 'Query',
  });

  factory Query$GetMyJourneys.fromJson(Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$GetMyJourneys(
      user: Query$GetMyJourneys$user.fromJson((l$user as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetMyJourneys$user user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetMyJourneys || runtimeType != other.runtimeType) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetMyJourneys on Query$GetMyJourneys {
  CopyWith$Query$GetMyJourneys<Query$GetMyJourneys> get copyWith =>
      CopyWith$Query$GetMyJourneys(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetMyJourneys<TRes> {
  factory CopyWith$Query$GetMyJourneys(
    Query$GetMyJourneys instance,
    TRes Function(Query$GetMyJourneys) then,
  ) = _CopyWithImpl$Query$GetMyJourneys;

  factory CopyWith$Query$GetMyJourneys.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMyJourneys;

  TRes call({
    Query$GetMyJourneys$user? user,
    String? $__typename,
  });
  CopyWith$Query$GetMyJourneys$user<TRes> get user;
}

class _CopyWithImpl$Query$GetMyJourneys<TRes>
    implements CopyWith$Query$GetMyJourneys<TRes> {
  _CopyWithImpl$Query$GetMyJourneys(
    this._instance,
    this._then,
  );

  final Query$GetMyJourneys _instance;

  final TRes Function(Query$GetMyJourneys) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetMyJourneys(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Query$GetMyJourneys$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetMyJourneys$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$GetMyJourneys$user(local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$GetMyJourneys<TRes>
    implements CopyWith$Query$GetMyJourneys<TRes> {
  _CopyWithStubImpl$Query$GetMyJourneys(this._res);

  TRes _res;

  call({
    Query$GetMyJourneys$user? user,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetMyJourneys$user<TRes> get user =>
      CopyWith$Query$GetMyJourneys$user.stub(_res);
}

const documentNodeQueryGetMyJourneys = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetMyJourneys'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'user'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'my_journeys'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'items'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FragmentSpreadNode(
                    name: NameNode(value: 'Journey'),
                    directives: [],
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  fragmentDefinitionJourney,
]);
Query$GetMyJourneys _parserFn$Query$GetMyJourneys(Map<String, dynamic> data) =>
    Query$GetMyJourneys.fromJson(data);
typedef OnQueryComplete$Query$GetMyJourneys = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetMyJourneys?,
);

class Options$Query$GetMyJourneys
    extends graphql.QueryOptions<Query$GetMyJourneys> {
  Options$Query$GetMyJourneys({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMyJourneys? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetMyJourneys? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$GetMyJourneys(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetMyJourneys,
          parserFn: _parserFn$Query$GetMyJourneys,
        );

  final OnQueryComplete$Query$GetMyJourneys? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetMyJourneys
    extends graphql.WatchQueryOptions<Query$GetMyJourneys> {
  WatchOptions$Query$GetMyJourneys({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMyJourneys? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryGetMyJourneys,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetMyJourneys,
        );
}

class FetchMoreOptions$Query$GetMyJourneys extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetMyJourneys(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryGetMyJourneys,
        );
}

extension ClientExtension$Query$GetMyJourneys on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetMyJourneys>> query$GetMyJourneys(
          [Options$Query$GetMyJourneys? options]) async =>
      await this.query(options ?? Options$Query$GetMyJourneys());
  graphql.ObservableQuery<Query$GetMyJourneys> watchQuery$GetMyJourneys(
          [WatchOptions$Query$GetMyJourneys? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$GetMyJourneys());
  void writeQuery$GetMyJourneys({
    required Query$GetMyJourneys data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation:
                graphql.Operation(document: documentNodeQueryGetMyJourneys)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetMyJourneys? readQuery$GetMyJourneys({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryGetMyJourneys)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetMyJourneys.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetMyJourneys> useQuery$GetMyJourneys(
        [Options$Query$GetMyJourneys? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$GetMyJourneys());
graphql.ObservableQuery<Query$GetMyJourneys> useWatchQuery$GetMyJourneys(
        [WatchOptions$Query$GetMyJourneys? options]) =>
    graphql_flutter
        .useWatchQuery(options ?? WatchOptions$Query$GetMyJourneys());

class Query$GetMyJourneys$Widget
    extends graphql_flutter.Query<Query$GetMyJourneys> {
  Query$GetMyJourneys$Widget({
    widgets.Key? key,
    Options$Query$GetMyJourneys? options,
    required graphql_flutter.QueryBuilder<Query$GetMyJourneys> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$GetMyJourneys(),
          builder: builder,
        );
}

class Query$GetMyJourneys$user {
  Query$GetMyJourneys$user({
    required this.my_journeys,
    this.$__typename = 'UserQuery',
  });

  factory Query$GetMyJourneys$user.fromJson(Map<String, dynamic> json) {
    final l$my_journeys = json['my_journeys'];
    final l$$__typename = json['__typename'];
    return Query$GetMyJourneys$user(
      my_journeys: Query$GetMyJourneys$user$my_journeys.fromJson(
          (l$my_journeys as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetMyJourneys$user$my_journeys my_journeys;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$my_journeys = my_journeys;
    _resultData['my_journeys'] = l$my_journeys.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$my_journeys = my_journeys;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$my_journeys,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetMyJourneys$user ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$my_journeys = my_journeys;
    final lOther$my_journeys = other.my_journeys;
    if (l$my_journeys != lOther$my_journeys) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetMyJourneys$user
    on Query$GetMyJourneys$user {
  CopyWith$Query$GetMyJourneys$user<Query$GetMyJourneys$user> get copyWith =>
      CopyWith$Query$GetMyJourneys$user(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetMyJourneys$user<TRes> {
  factory CopyWith$Query$GetMyJourneys$user(
    Query$GetMyJourneys$user instance,
    TRes Function(Query$GetMyJourneys$user) then,
  ) = _CopyWithImpl$Query$GetMyJourneys$user;

  factory CopyWith$Query$GetMyJourneys$user.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMyJourneys$user;

  TRes call({
    Query$GetMyJourneys$user$my_journeys? my_journeys,
    String? $__typename,
  });
  CopyWith$Query$GetMyJourneys$user$my_journeys<TRes> get my_journeys;
}

class _CopyWithImpl$Query$GetMyJourneys$user<TRes>
    implements CopyWith$Query$GetMyJourneys$user<TRes> {
  _CopyWithImpl$Query$GetMyJourneys$user(
    this._instance,
    this._then,
  );

  final Query$GetMyJourneys$user _instance;

  final TRes Function(Query$GetMyJourneys$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? my_journeys = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetMyJourneys$user(
        my_journeys: my_journeys == _undefined || my_journeys == null
            ? _instance.my_journeys
            : (my_journeys as Query$GetMyJourneys$user$my_journeys),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetMyJourneys$user$my_journeys<TRes> get my_journeys {
    final local$my_journeys = _instance.my_journeys;
    return CopyWith$Query$GetMyJourneys$user$my_journeys(
        local$my_journeys, (e) => call(my_journeys: e));
  }
}

class _CopyWithStubImpl$Query$GetMyJourneys$user<TRes>
    implements CopyWith$Query$GetMyJourneys$user<TRes> {
  _CopyWithStubImpl$Query$GetMyJourneys$user(this._res);

  TRes _res;

  call({
    Query$GetMyJourneys$user$my_journeys? my_journeys,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetMyJourneys$user$my_journeys<TRes> get my_journeys =>
      CopyWith$Query$GetMyJourneys$user$my_journeys.stub(_res);
}

class Query$GetMyJourneys$user$my_journeys {
  Query$GetMyJourneys$user$my_journeys({
    required this.items,
    this.$__typename = 'JourneyConnection',
  });

  factory Query$GetMyJourneys$user$my_journeys.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$GetMyJourneys$user$my_journeys(
      items: (l$items as List<dynamic>)
          .map((e) => Fragment$Journey.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$Journey> items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$items = items;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$items.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetMyJourneys$user$my_journeys ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items.length != lOther$items.length) {
      return false;
    }
    for (int i = 0; i < l$items.length; i++) {
      final l$items$entry = l$items[i];
      final lOther$items$entry = lOther$items[i];
      if (l$items$entry != lOther$items$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetMyJourneys$user$my_journeys
    on Query$GetMyJourneys$user$my_journeys {
  CopyWith$Query$GetMyJourneys$user$my_journeys<
          Query$GetMyJourneys$user$my_journeys>
      get copyWith => CopyWith$Query$GetMyJourneys$user$my_journeys(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetMyJourneys$user$my_journeys<TRes> {
  factory CopyWith$Query$GetMyJourneys$user$my_journeys(
    Query$GetMyJourneys$user$my_journeys instance,
    TRes Function(Query$GetMyJourneys$user$my_journeys) then,
  ) = _CopyWithImpl$Query$GetMyJourneys$user$my_journeys;

  factory CopyWith$Query$GetMyJourneys$user$my_journeys.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMyJourneys$user$my_journeys;

  TRes call({
    List<Fragment$Journey>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$Journey> Function(
              Iterable<CopyWith$Fragment$Journey<Fragment$Journey>>)
          _fn);
}

class _CopyWithImpl$Query$GetMyJourneys$user$my_journeys<TRes>
    implements CopyWith$Query$GetMyJourneys$user$my_journeys<TRes> {
  _CopyWithImpl$Query$GetMyJourneys$user$my_journeys(
    this._instance,
    this._then,
  );

  final Query$GetMyJourneys$user$my_journeys _instance;

  final TRes Function(Query$GetMyJourneys$user$my_journeys) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetMyJourneys$user$my_journeys(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$Journey>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes items(
          Iterable<Fragment$Journey> Function(
                  Iterable<CopyWith$Fragment$Journey<Fragment$Journey>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) => CopyWith$Fragment$Journey(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$GetMyJourneys$user$my_journeys<TRes>
    implements CopyWith$Query$GetMyJourneys$user$my_journeys<TRes> {
  _CopyWithStubImpl$Query$GetMyJourneys$user$my_journeys(this._res);

  TRes _res;

  call({
    List<Fragment$Journey>? items,
    String? $__typename,
  }) =>
      _res;

  items(_fn) => _res;
}

class Variables$Query$GetJourney {
  factory Variables$Query$GetJourney({required String id}) =>
      Variables$Query$GetJourney._({
        r'id': id,
      });

  Variables$Query$GetJourney._(this._$data);

  factory Variables$Query$GetJourney.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$GetJourney._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$GetJourney<Variables$Query$GetJourney>
      get copyWith => CopyWith$Variables$Query$GetJourney(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetJourney ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Query$GetJourney<TRes> {
  factory CopyWith$Variables$Query$GetJourney(
    Variables$Query$GetJourney instance,
    TRes Function(Variables$Query$GetJourney) then,
  ) = _CopyWithImpl$Variables$Query$GetJourney;

  factory CopyWith$Variables$Query$GetJourney.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetJourney;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$GetJourney<TRes>
    implements CopyWith$Variables$Query$GetJourney<TRes> {
  _CopyWithImpl$Variables$Query$GetJourney(
    this._instance,
    this._then,
  );

  final Variables$Query$GetJourney _instance;

  final TRes Function(Variables$Query$GetJourney) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(Variables$Query$GetJourney._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetJourney<TRes>
    implements CopyWith$Variables$Query$GetJourney<TRes> {
  _CopyWithStubImpl$Variables$Query$GetJourney(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$GetJourney {
  Query$GetJourney({
    required this.user,
    this.$__typename = 'Query',
  });

  factory Query$GetJourney.fromJson(Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$GetJourney(
      user: Query$GetJourney$user.fromJson((l$user as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetJourney$user user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetJourney || runtimeType != other.runtimeType) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetJourney on Query$GetJourney {
  CopyWith$Query$GetJourney<Query$GetJourney> get copyWith =>
      CopyWith$Query$GetJourney(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetJourney<TRes> {
  factory CopyWith$Query$GetJourney(
    Query$GetJourney instance,
    TRes Function(Query$GetJourney) then,
  ) = _CopyWithImpl$Query$GetJourney;

  factory CopyWith$Query$GetJourney.stub(TRes res) =
      _CopyWithStubImpl$Query$GetJourney;

  TRes call({
    Query$GetJourney$user? user,
    String? $__typename,
  });
  CopyWith$Query$GetJourney$user<TRes> get user;
}

class _CopyWithImpl$Query$GetJourney<TRes>
    implements CopyWith$Query$GetJourney<TRes> {
  _CopyWithImpl$Query$GetJourney(
    this._instance,
    this._then,
  );

  final Query$GetJourney _instance;

  final TRes Function(Query$GetJourney) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetJourney(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Query$GetJourney$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetJourney$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$GetJourney$user(local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$GetJourney<TRes>
    implements CopyWith$Query$GetJourney<TRes> {
  _CopyWithStubImpl$Query$GetJourney(this._res);

  TRes _res;

  call({
    Query$GetJourney$user? user,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetJourney$user<TRes> get user =>
      CopyWith$Query$GetJourney$user.stub(_res);
}

const documentNodeQueryGetJourney = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetJourney'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'user'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'journey'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              )
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'Journey'),
                directives: [],
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  fragmentDefinitionJourney,
]);
Query$GetJourney _parserFn$Query$GetJourney(Map<String, dynamic> data) =>
    Query$GetJourney.fromJson(data);
typedef OnQueryComplete$Query$GetJourney = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetJourney?,
);

class Options$Query$GetJourney extends graphql.QueryOptions<Query$GetJourney> {
  Options$Query$GetJourney({
    String? operationName,
    required Variables$Query$GetJourney variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetJourney? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetJourney? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$GetJourney(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetJourney,
          parserFn: _parserFn$Query$GetJourney,
        );

  final OnQueryComplete$Query$GetJourney? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetJourney
    extends graphql.WatchQueryOptions<Query$GetJourney> {
  WatchOptions$Query$GetJourney({
    String? operationName,
    required Variables$Query$GetJourney variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetJourney? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryGetJourney,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetJourney,
        );
}

class FetchMoreOptions$Query$GetJourney extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetJourney({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetJourney variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetJourney,
        );
}

extension ClientExtension$Query$GetJourney on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetJourney>> query$GetJourney(
          Options$Query$GetJourney options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$GetJourney> watchQuery$GetJourney(
          WatchOptions$Query$GetJourney options) =>
      this.watchQuery(options);
  void writeQuery$GetJourney({
    required Query$GetJourney data,
    required Variables$Query$GetJourney variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryGetJourney),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetJourney? readQuery$GetJourney({
    required Variables$Query$GetJourney variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetJourney),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetJourney.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetJourney> useQuery$GetJourney(
        Options$Query$GetJourney options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetJourney> useWatchQuery$GetJourney(
        WatchOptions$Query$GetJourney options) =>
    graphql_flutter.useWatchQuery(options);

class Query$GetJourney$Widget extends graphql_flutter.Query<Query$GetJourney> {
  Query$GetJourney$Widget({
    widgets.Key? key,
    required Options$Query$GetJourney options,
    required graphql_flutter.QueryBuilder<Query$GetJourney> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$GetJourney$user {
  Query$GetJourney$user({
    this.journey,
    this.$__typename = 'UserQuery',
  });

  factory Query$GetJourney$user.fromJson(Map<String, dynamic> json) {
    final l$journey = json['journey'];
    final l$$__typename = json['__typename'];
    return Query$GetJourney$user(
      journey: l$journey == null
          ? null
          : Fragment$Journey.fromJson((l$journey as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$Journey? journey;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$journey = journey;
    _resultData['journey'] = l$journey?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$journey = journey;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$journey,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetJourney$user || runtimeType != other.runtimeType) {
      return false;
    }
    final l$journey = journey;
    final lOther$journey = other.journey;
    if (l$journey != lOther$journey) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetJourney$user on Query$GetJourney$user {
  CopyWith$Query$GetJourney$user<Query$GetJourney$user> get copyWith =>
      CopyWith$Query$GetJourney$user(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetJourney$user<TRes> {
  factory CopyWith$Query$GetJourney$user(
    Query$GetJourney$user instance,
    TRes Function(Query$GetJourney$user) then,
  ) = _CopyWithImpl$Query$GetJourney$user;

  factory CopyWith$Query$GetJourney$user.stub(TRes res) =
      _CopyWithStubImpl$Query$GetJourney$user;

  TRes call({
    Fragment$Journey? journey,
    String? $__typename,
  });
  CopyWith$Fragment$Journey<TRes> get journey;
}

class _CopyWithImpl$Query$GetJourney$user<TRes>
    implements CopyWith$Query$GetJourney$user<TRes> {
  _CopyWithImpl$Query$GetJourney$user(
    this._instance,
    this._then,
  );

  final Query$GetJourney$user _instance;

  final TRes Function(Query$GetJourney$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? journey = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetJourney$user(
        journey: journey == _undefined
            ? _instance.journey
            : (journey as Fragment$Journey?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$Journey<TRes> get journey {
    final local$journey = _instance.journey;
    return local$journey == null
        ? CopyWith$Fragment$Journey.stub(_then(_instance))
        : CopyWith$Fragment$Journey(local$journey, (e) => call(journey: e));
  }
}

class _CopyWithStubImpl$Query$GetJourney$user<TRes>
    implements CopyWith$Query$GetJourney$user<TRes> {
  _CopyWithStubImpl$Query$GetJourney$user(this._res);

  TRes _res;

  call({
    Fragment$Journey? journey,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$Journey<TRes> get journey =>
      CopyWith$Fragment$Journey.stub(_res);
}

class Variables$Query$GetStages {
  factory Variables$Query$GetStages({
    required String journeyId,
    Input$PaginationInput? pagination,
  }) =>
      Variables$Query$GetStages._({
        r'journeyId': journeyId,
        if (pagination != null) r'pagination': pagination,
      });

  Variables$Query$GetStages._(this._$data);

  factory Variables$Query$GetStages.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$journeyId = data['journeyId'];
    result$data['journeyId'] = (l$journeyId as String);
    if (data.containsKey('pagination')) {
      final l$pagination = data['pagination'];
      result$data['pagination'] = l$pagination == null
          ? null
          : Input$PaginationInput.fromJson(
              (l$pagination as Map<String, dynamic>));
    }
    return Variables$Query$GetStages._(result$data);
  }

  Map<String, dynamic> _$data;

  String get journeyId => (_$data['journeyId'] as String);

  Input$PaginationInput? get pagination =>
      (_$data['pagination'] as Input$PaginationInput?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$journeyId = journeyId;
    result$data['journeyId'] = l$journeyId;
    if (_$data.containsKey('pagination')) {
      final l$pagination = pagination;
      result$data['pagination'] = l$pagination?.toJson();
    }
    return result$data;
  }

  CopyWith$Variables$Query$GetStages<Variables$Query$GetStages> get copyWith =>
      CopyWith$Variables$Query$GetStages(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetStages ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$journeyId = journeyId;
    final lOther$journeyId = other.journeyId;
    if (l$journeyId != lOther$journeyId) {
      return false;
    }
    final l$pagination = pagination;
    final lOther$pagination = other.pagination;
    if (_$data.containsKey('pagination') !=
        other._$data.containsKey('pagination')) {
      return false;
    }
    if (l$pagination != lOther$pagination) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$journeyId = journeyId;
    final l$pagination = pagination;
    return Object.hashAll([
      l$journeyId,
      _$data.containsKey('pagination') ? l$pagination : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$GetStages<TRes> {
  factory CopyWith$Variables$Query$GetStages(
    Variables$Query$GetStages instance,
    TRes Function(Variables$Query$GetStages) then,
  ) = _CopyWithImpl$Variables$Query$GetStages;

  factory CopyWith$Variables$Query$GetStages.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetStages;

  TRes call({
    String? journeyId,
    Input$PaginationInput? pagination,
  });
}

class _CopyWithImpl$Variables$Query$GetStages<TRes>
    implements CopyWith$Variables$Query$GetStages<TRes> {
  _CopyWithImpl$Variables$Query$GetStages(
    this._instance,
    this._then,
  );

  final Variables$Query$GetStages _instance;

  final TRes Function(Variables$Query$GetStages) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? journeyId = _undefined,
    Object? pagination = _undefined,
  }) =>
      _then(Variables$Query$GetStages._({
        ..._instance._$data,
        if (journeyId != _undefined && journeyId != null)
          'journeyId': (journeyId as String),
        if (pagination != _undefined)
          'pagination': (pagination as Input$PaginationInput?),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetStages<TRes>
    implements CopyWith$Variables$Query$GetStages<TRes> {
  _CopyWithStubImpl$Variables$Query$GetStages(this._res);

  TRes _res;

  call({
    String? journeyId,
    Input$PaginationInput? pagination,
  }) =>
      _res;
}

class Query$GetStages {
  Query$GetStages({
    required this.user,
    this.$__typename = 'Query',
  });

  factory Query$GetStages.fromJson(Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$GetStages(
      user: Query$GetStages$user.fromJson((l$user as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetStages$user user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetStages || runtimeType != other.runtimeType) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetStages on Query$GetStages {
  CopyWith$Query$GetStages<Query$GetStages> get copyWith =>
      CopyWith$Query$GetStages(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetStages<TRes> {
  factory CopyWith$Query$GetStages(
    Query$GetStages instance,
    TRes Function(Query$GetStages) then,
  ) = _CopyWithImpl$Query$GetStages;

  factory CopyWith$Query$GetStages.stub(TRes res) =
      _CopyWithStubImpl$Query$GetStages;

  TRes call({
    Query$GetStages$user? user,
    String? $__typename,
  });
  CopyWith$Query$GetStages$user<TRes> get user;
}

class _CopyWithImpl$Query$GetStages<TRes>
    implements CopyWith$Query$GetStages<TRes> {
  _CopyWithImpl$Query$GetStages(
    this._instance,
    this._then,
  );

  final Query$GetStages _instance;

  final TRes Function(Query$GetStages) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetStages(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Query$GetStages$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetStages$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$GetStages$user(local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$GetStages<TRes>
    implements CopyWith$Query$GetStages<TRes> {
  _CopyWithStubImpl$Query$GetStages(this._res);

  TRes _res;

  call({
    Query$GetStages$user? user,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetStages$user<TRes> get user =>
      CopyWith$Query$GetStages$user.stub(_res);
}

const documentNodeQueryGetStages = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetStages'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'journeyId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'pagination')),
        type: NamedTypeNode(
          name: NameNode(value: 'PaginationInput'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'user'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'journey'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'journeyId')),
              )
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'stages'),
                alias: null,
                arguments: [
                  ArgumentNode(
                    name: NameNode(value: 'pagination'),
                    value: VariableNode(name: NameNode(value: 'pagination')),
                  )
                ],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'items'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FragmentSpreadNode(
                        name: NameNode(value: 'Stage'),
                        directives: [],
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ]),
                  ),
                  FieldNode(
                    name: NameNode(value: 'pageInfo'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FragmentSpreadNode(
                        name: NameNode(value: 'PageInfo'),
                        directives: [],
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ]),
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  fragmentDefinitionStage,
  fragmentDefinitionLevels,
  fragmentDefinitionPageInfo,
]);
Query$GetStages _parserFn$Query$GetStages(Map<String, dynamic> data) =>
    Query$GetStages.fromJson(data);
typedef OnQueryComplete$Query$GetStages = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetStages?,
);

class Options$Query$GetStages extends graphql.QueryOptions<Query$GetStages> {
  Options$Query$GetStages({
    String? operationName,
    required Variables$Query$GetStages variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetStages? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetStages? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$GetStages(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetStages,
          parserFn: _parserFn$Query$GetStages,
        );

  final OnQueryComplete$Query$GetStages? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetStages
    extends graphql.WatchQueryOptions<Query$GetStages> {
  WatchOptions$Query$GetStages({
    String? operationName,
    required Variables$Query$GetStages variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetStages? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryGetStages,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetStages,
        );
}

class FetchMoreOptions$Query$GetStages extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetStages({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetStages variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetStages,
        );
}

extension ClientExtension$Query$GetStages on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetStages>> query$GetStages(
          Options$Query$GetStages options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$GetStages> watchQuery$GetStages(
          WatchOptions$Query$GetStages options) =>
      this.watchQuery(options);
  void writeQuery$GetStages({
    required Query$GetStages data,
    required Variables$Query$GetStages variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryGetStages),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetStages? readQuery$GetStages({
    required Variables$Query$GetStages variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetStages),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetStages.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetStages> useQuery$GetStages(
        Options$Query$GetStages options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetStages> useWatchQuery$GetStages(
        WatchOptions$Query$GetStages options) =>
    graphql_flutter.useWatchQuery(options);

class Query$GetStages$Widget extends graphql_flutter.Query<Query$GetStages> {
  Query$GetStages$Widget({
    widgets.Key? key,
    required Options$Query$GetStages options,
    required graphql_flutter.QueryBuilder<Query$GetStages> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$GetStages$user {
  Query$GetStages$user({
    this.journey,
    this.$__typename = 'UserQuery',
  });

  factory Query$GetStages$user.fromJson(Map<String, dynamic> json) {
    final l$journey = json['journey'];
    final l$$__typename = json['__typename'];
    return Query$GetStages$user(
      journey: l$journey == null
          ? null
          : Query$GetStages$user$journey.fromJson(
              (l$journey as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetStages$user$journey? journey;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$journey = journey;
    _resultData['journey'] = l$journey?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$journey = journey;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$journey,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetStages$user || runtimeType != other.runtimeType) {
      return false;
    }
    final l$journey = journey;
    final lOther$journey = other.journey;
    if (l$journey != lOther$journey) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetStages$user on Query$GetStages$user {
  CopyWith$Query$GetStages$user<Query$GetStages$user> get copyWith =>
      CopyWith$Query$GetStages$user(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetStages$user<TRes> {
  factory CopyWith$Query$GetStages$user(
    Query$GetStages$user instance,
    TRes Function(Query$GetStages$user) then,
  ) = _CopyWithImpl$Query$GetStages$user;

  factory CopyWith$Query$GetStages$user.stub(TRes res) =
      _CopyWithStubImpl$Query$GetStages$user;

  TRes call({
    Query$GetStages$user$journey? journey,
    String? $__typename,
  });
  CopyWith$Query$GetStages$user$journey<TRes> get journey;
}

class _CopyWithImpl$Query$GetStages$user<TRes>
    implements CopyWith$Query$GetStages$user<TRes> {
  _CopyWithImpl$Query$GetStages$user(
    this._instance,
    this._then,
  );

  final Query$GetStages$user _instance;

  final TRes Function(Query$GetStages$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? journey = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetStages$user(
        journey: journey == _undefined
            ? _instance.journey
            : (journey as Query$GetStages$user$journey?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetStages$user$journey<TRes> get journey {
    final local$journey = _instance.journey;
    return local$journey == null
        ? CopyWith$Query$GetStages$user$journey.stub(_then(_instance))
        : CopyWith$Query$GetStages$user$journey(
            local$journey, (e) => call(journey: e));
  }
}

class _CopyWithStubImpl$Query$GetStages$user<TRes>
    implements CopyWith$Query$GetStages$user<TRes> {
  _CopyWithStubImpl$Query$GetStages$user(this._res);

  TRes _res;

  call({
    Query$GetStages$user$journey? journey,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetStages$user$journey<TRes> get journey =>
      CopyWith$Query$GetStages$user$journey.stub(_res);
}

class Query$GetStages$user$journey {
  Query$GetStages$user$journey({
    required this.stages,
    this.$__typename = 'Journey',
  });

  factory Query$GetStages$user$journey.fromJson(Map<String, dynamic> json) {
    final l$stages = json['stages'];
    final l$$__typename = json['__typename'];
    return Query$GetStages$user$journey(
      stages: Query$GetStages$user$journey$stages.fromJson(
          (l$stages as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetStages$user$journey$stages stages;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$stages = stages;
    _resultData['stages'] = l$stages.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$stages = stages;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$stages,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetStages$user$journey ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$stages = stages;
    final lOther$stages = other.stages;
    if (l$stages != lOther$stages) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetStages$user$journey
    on Query$GetStages$user$journey {
  CopyWith$Query$GetStages$user$journey<Query$GetStages$user$journey>
      get copyWith => CopyWith$Query$GetStages$user$journey(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetStages$user$journey<TRes> {
  factory CopyWith$Query$GetStages$user$journey(
    Query$GetStages$user$journey instance,
    TRes Function(Query$GetStages$user$journey) then,
  ) = _CopyWithImpl$Query$GetStages$user$journey;

  factory CopyWith$Query$GetStages$user$journey.stub(TRes res) =
      _CopyWithStubImpl$Query$GetStages$user$journey;

  TRes call({
    Query$GetStages$user$journey$stages? stages,
    String? $__typename,
  });
  CopyWith$Query$GetStages$user$journey$stages<TRes> get stages;
}

class _CopyWithImpl$Query$GetStages$user$journey<TRes>
    implements CopyWith$Query$GetStages$user$journey<TRes> {
  _CopyWithImpl$Query$GetStages$user$journey(
    this._instance,
    this._then,
  );

  final Query$GetStages$user$journey _instance;

  final TRes Function(Query$GetStages$user$journey) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? stages = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetStages$user$journey(
        stages: stages == _undefined || stages == null
            ? _instance.stages
            : (stages as Query$GetStages$user$journey$stages),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetStages$user$journey$stages<TRes> get stages {
    final local$stages = _instance.stages;
    return CopyWith$Query$GetStages$user$journey$stages(
        local$stages, (e) => call(stages: e));
  }
}

class _CopyWithStubImpl$Query$GetStages$user$journey<TRes>
    implements CopyWith$Query$GetStages$user$journey<TRes> {
  _CopyWithStubImpl$Query$GetStages$user$journey(this._res);

  TRes _res;

  call({
    Query$GetStages$user$journey$stages? stages,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetStages$user$journey$stages<TRes> get stages =>
      CopyWith$Query$GetStages$user$journey$stages.stub(_res);
}

class Query$GetStages$user$journey$stages {
  Query$GetStages$user$journey$stages({
    required this.items,
    required this.pageInfo,
    this.$__typename = 'StageConnection',
  });

  factory Query$GetStages$user$journey$stages.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$GetStages$user$journey$stages(
      items: (l$items as List<dynamic>)
          .map((e) => Fragment$Stage.fromJson((e as Map<String, dynamic>)))
          .toList(),
      pageInfo:
          Fragment$PageInfo.fromJson((l$pageInfo as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$Stage> items;

  final Fragment$PageInfo pageInfo;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$pageInfo = pageInfo;
    _resultData['pageInfo'] = l$pageInfo.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$items = items;
    final l$pageInfo = pageInfo;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$items.map((v) => v)),
      l$pageInfo,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetStages$user$journey$stages ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items.length != lOther$items.length) {
      return false;
    }
    for (int i = 0; i < l$items.length; i++) {
      final l$items$entry = l$items[i];
      final lOther$items$entry = lOther$items[i];
      if (l$items$entry != lOther$items$entry) {
        return false;
      }
    }
    final l$pageInfo = pageInfo;
    final lOther$pageInfo = other.pageInfo;
    if (l$pageInfo != lOther$pageInfo) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetStages$user$journey$stages
    on Query$GetStages$user$journey$stages {
  CopyWith$Query$GetStages$user$journey$stages<
          Query$GetStages$user$journey$stages>
      get copyWith => CopyWith$Query$GetStages$user$journey$stages(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetStages$user$journey$stages<TRes> {
  factory CopyWith$Query$GetStages$user$journey$stages(
    Query$GetStages$user$journey$stages instance,
    TRes Function(Query$GetStages$user$journey$stages) then,
  ) = _CopyWithImpl$Query$GetStages$user$journey$stages;

  factory CopyWith$Query$GetStages$user$journey$stages.stub(TRes res) =
      _CopyWithStubImpl$Query$GetStages$user$journey$stages;

  TRes call({
    List<Fragment$Stage>? items,
    Fragment$PageInfo? pageInfo,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$Stage> Function(
              Iterable<CopyWith$Fragment$Stage<Fragment$Stage>>)
          _fn);
  CopyWith$Fragment$PageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$GetStages$user$journey$stages<TRes>
    implements CopyWith$Query$GetStages$user$journey$stages<TRes> {
  _CopyWithImpl$Query$GetStages$user$journey$stages(
    this._instance,
    this._then,
  );

  final Query$GetStages$user$journey$stages _instance;

  final TRes Function(Query$GetStages$user$journey$stages) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? items = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetStages$user$journey$stages(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$Stage>),
        pageInfo: pageInfo == _undefined || pageInfo == null
            ? _instance.pageInfo
            : (pageInfo as Fragment$PageInfo),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes items(
          Iterable<Fragment$Stage> Function(
                  Iterable<CopyWith$Fragment$Stage<Fragment$Stage>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) => CopyWith$Fragment$Stage(
                e,
                (i) => i,
              ))).toList());

  CopyWith$Fragment$PageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Fragment$PageInfo(local$pageInfo, (e) => call(pageInfo: e));
  }
}

class _CopyWithStubImpl$Query$GetStages$user$journey$stages<TRes>
    implements CopyWith$Query$GetStages$user$journey$stages<TRes> {
  _CopyWithStubImpl$Query$GetStages$user$journey$stages(this._res);

  TRes _res;

  call({
    List<Fragment$Stage>? items,
    Fragment$PageInfo? pageInfo,
    String? $__typename,
  }) =>
      _res;

  items(_fn) => _res;

  CopyWith$Fragment$PageInfo<TRes> get pageInfo =>
      CopyWith$Fragment$PageInfo.stub(_res);
}

class Variables$Query$GetStageDetailed {
  factory Variables$Query$GetStageDetailed({
    required String journeyId,
    required String stageId,
  }) =>
      Variables$Query$GetStageDetailed._({
        r'journeyId': journeyId,
        r'stageId': stageId,
      });

  Variables$Query$GetStageDetailed._(this._$data);

  factory Variables$Query$GetStageDetailed.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$journeyId = data['journeyId'];
    result$data['journeyId'] = (l$journeyId as String);
    final l$stageId = data['stageId'];
    result$data['stageId'] = (l$stageId as String);
    return Variables$Query$GetStageDetailed._(result$data);
  }

  Map<String, dynamic> _$data;

  String get journeyId => (_$data['journeyId'] as String);

  String get stageId => (_$data['stageId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$journeyId = journeyId;
    result$data['journeyId'] = l$journeyId;
    final l$stageId = stageId;
    result$data['stageId'] = l$stageId;
    return result$data;
  }

  CopyWith$Variables$Query$GetStageDetailed<Variables$Query$GetStageDetailed>
      get copyWith => CopyWith$Variables$Query$GetStageDetailed(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetStageDetailed ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$journeyId = journeyId;
    final lOther$journeyId = other.journeyId;
    if (l$journeyId != lOther$journeyId) {
      return false;
    }
    final l$stageId = stageId;
    final lOther$stageId = other.stageId;
    if (l$stageId != lOther$stageId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$journeyId = journeyId;
    final l$stageId = stageId;
    return Object.hashAll([
      l$journeyId,
      l$stageId,
    ]);
  }
}

abstract class CopyWith$Variables$Query$GetStageDetailed<TRes> {
  factory CopyWith$Variables$Query$GetStageDetailed(
    Variables$Query$GetStageDetailed instance,
    TRes Function(Variables$Query$GetStageDetailed) then,
  ) = _CopyWithImpl$Variables$Query$GetStageDetailed;

  factory CopyWith$Variables$Query$GetStageDetailed.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetStageDetailed;

  TRes call({
    String? journeyId,
    String? stageId,
  });
}

class _CopyWithImpl$Variables$Query$GetStageDetailed<TRes>
    implements CopyWith$Variables$Query$GetStageDetailed<TRes> {
  _CopyWithImpl$Variables$Query$GetStageDetailed(
    this._instance,
    this._then,
  );

  final Variables$Query$GetStageDetailed _instance;

  final TRes Function(Variables$Query$GetStageDetailed) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? journeyId = _undefined,
    Object? stageId = _undefined,
  }) =>
      _then(Variables$Query$GetStageDetailed._({
        ..._instance._$data,
        if (journeyId != _undefined && journeyId != null)
          'journeyId': (journeyId as String),
        if (stageId != _undefined && stageId != null)
          'stageId': (stageId as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetStageDetailed<TRes>
    implements CopyWith$Variables$Query$GetStageDetailed<TRes> {
  _CopyWithStubImpl$Variables$Query$GetStageDetailed(this._res);

  TRes _res;

  call({
    String? journeyId,
    String? stageId,
  }) =>
      _res;
}

class Query$GetStageDetailed {
  Query$GetStageDetailed({
    required this.user,
    this.$__typename = 'Query',
  });

  factory Query$GetStageDetailed.fromJson(Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$GetStageDetailed(
      user: Query$GetStageDetailed$user.fromJson(
          (l$user as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetStageDetailed$user user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetStageDetailed || runtimeType != other.runtimeType) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetStageDetailed on Query$GetStageDetailed {
  CopyWith$Query$GetStageDetailed<Query$GetStageDetailed> get copyWith =>
      CopyWith$Query$GetStageDetailed(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetStageDetailed<TRes> {
  factory CopyWith$Query$GetStageDetailed(
    Query$GetStageDetailed instance,
    TRes Function(Query$GetStageDetailed) then,
  ) = _CopyWithImpl$Query$GetStageDetailed;

  factory CopyWith$Query$GetStageDetailed.stub(TRes res) =
      _CopyWithStubImpl$Query$GetStageDetailed;

  TRes call({
    Query$GetStageDetailed$user? user,
    String? $__typename,
  });
  CopyWith$Query$GetStageDetailed$user<TRes> get user;
}

class _CopyWithImpl$Query$GetStageDetailed<TRes>
    implements CopyWith$Query$GetStageDetailed<TRes> {
  _CopyWithImpl$Query$GetStageDetailed(
    this._instance,
    this._then,
  );

  final Query$GetStageDetailed _instance;

  final TRes Function(Query$GetStageDetailed) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetStageDetailed(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Query$GetStageDetailed$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetStageDetailed$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$GetStageDetailed$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$GetStageDetailed<TRes>
    implements CopyWith$Query$GetStageDetailed<TRes> {
  _CopyWithStubImpl$Query$GetStageDetailed(this._res);

  TRes _res;

  call({
    Query$GetStageDetailed$user? user,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetStageDetailed$user<TRes> get user =>
      CopyWith$Query$GetStageDetailed$user.stub(_res);
}

const documentNodeQueryGetStageDetailed = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetStageDetailed'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'journeyId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'stageId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'user'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'stage'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'journeyId'),
                value: VariableNode(name: NameNode(value: 'journeyId')),
              ),
              ArgumentNode(
                name: NameNode(value: 'stageId'),
                value: VariableNode(name: NameNode(value: 'stageId')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'DetailedStage'),
                directives: [],
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  fragmentDefinitionDetailedStage,
  fragmentDefinitionStage,
  fragmentDefinitionLevels,
  fragmentDefinitionStagePart,
  fragmentDefinitionStagePartMaterial,
  fragmentDefinitionStagePartDocumentation,
  fragmentDefinitionStageSentence,
  fragmentDefinitionStageWord,
  fragmentDefinitionStageGrapheme,
]);
Query$GetStageDetailed _parserFn$Query$GetStageDetailed(
        Map<String, dynamic> data) =>
    Query$GetStageDetailed.fromJson(data);
typedef OnQueryComplete$Query$GetStageDetailed = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetStageDetailed?,
);

class Options$Query$GetStageDetailed
    extends graphql.QueryOptions<Query$GetStageDetailed> {
  Options$Query$GetStageDetailed({
    String? operationName,
    required Variables$Query$GetStageDetailed variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetStageDetailed? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetStageDetailed? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null
                        ? null
                        : _parserFn$Query$GetStageDetailed(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetStageDetailed,
          parserFn: _parserFn$Query$GetStageDetailed,
        );

  final OnQueryComplete$Query$GetStageDetailed? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetStageDetailed
    extends graphql.WatchQueryOptions<Query$GetStageDetailed> {
  WatchOptions$Query$GetStageDetailed({
    String? operationName,
    required Variables$Query$GetStageDetailed variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetStageDetailed? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryGetStageDetailed,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetStageDetailed,
        );
}

class FetchMoreOptions$Query$GetStageDetailed extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetStageDetailed({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetStageDetailed variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetStageDetailed,
        );
}

extension ClientExtension$Query$GetStageDetailed on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetStageDetailed>> query$GetStageDetailed(
          Options$Query$GetStageDetailed options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$GetStageDetailed> watchQuery$GetStageDetailed(
          WatchOptions$Query$GetStageDetailed options) =>
      this.watchQuery(options);
  void writeQuery$GetStageDetailed({
    required Query$GetStageDetailed data,
    required Variables$Query$GetStageDetailed variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryGetStageDetailed),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetStageDetailed? readQuery$GetStageDetailed({
    required Variables$Query$GetStageDetailed variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryGetStageDetailed),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetStageDetailed.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetStageDetailed>
    useQuery$GetStageDetailed(Options$Query$GetStageDetailed options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetStageDetailed> useWatchQuery$GetStageDetailed(
        WatchOptions$Query$GetStageDetailed options) =>
    graphql_flutter.useWatchQuery(options);

class Query$GetStageDetailed$Widget
    extends graphql_flutter.Query<Query$GetStageDetailed> {
  Query$GetStageDetailed$Widget({
    widgets.Key? key,
    required Options$Query$GetStageDetailed options,
    required graphql_flutter.QueryBuilder<Query$GetStageDetailed> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$GetStageDetailed$user {
  Query$GetStageDetailed$user({
    this.stage,
    this.$__typename = 'UserQuery',
  });

  factory Query$GetStageDetailed$user.fromJson(Map<String, dynamic> json) {
    final l$stage = json['stage'];
    final l$$__typename = json['__typename'];
    return Query$GetStageDetailed$user(
      stage: l$stage == null
          ? null
          : Fragment$DetailedStage.fromJson((l$stage as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$DetailedStage? stage;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$stage = stage;
    _resultData['stage'] = l$stage?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$stage = stage;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$stage,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetStageDetailed$user ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$stage = stage;
    final lOther$stage = other.stage;
    if (l$stage != lOther$stage) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetStageDetailed$user
    on Query$GetStageDetailed$user {
  CopyWith$Query$GetStageDetailed$user<Query$GetStageDetailed$user>
      get copyWith => CopyWith$Query$GetStageDetailed$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetStageDetailed$user<TRes> {
  factory CopyWith$Query$GetStageDetailed$user(
    Query$GetStageDetailed$user instance,
    TRes Function(Query$GetStageDetailed$user) then,
  ) = _CopyWithImpl$Query$GetStageDetailed$user;

  factory CopyWith$Query$GetStageDetailed$user.stub(TRes res) =
      _CopyWithStubImpl$Query$GetStageDetailed$user;

  TRes call({
    Fragment$DetailedStage? stage,
    String? $__typename,
  });
  CopyWith$Fragment$DetailedStage<TRes> get stage;
}

class _CopyWithImpl$Query$GetStageDetailed$user<TRes>
    implements CopyWith$Query$GetStageDetailed$user<TRes> {
  _CopyWithImpl$Query$GetStageDetailed$user(
    this._instance,
    this._then,
  );

  final Query$GetStageDetailed$user _instance;

  final TRes Function(Query$GetStageDetailed$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? stage = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetStageDetailed$user(
        stage: stage == _undefined
            ? _instance.stage
            : (stage as Fragment$DetailedStage?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$DetailedStage<TRes> get stage {
    final local$stage = _instance.stage;
    return local$stage == null
        ? CopyWith$Fragment$DetailedStage.stub(_then(_instance))
        : CopyWith$Fragment$DetailedStage(local$stage, (e) => call(stage: e));
  }
}

class _CopyWithStubImpl$Query$GetStageDetailed$user<TRes>
    implements CopyWith$Query$GetStageDetailed$user<TRes> {
  _CopyWithStubImpl$Query$GetStageDetailed$user(this._res);

  TRes _res;

  call({
    Fragment$DetailedStage? stage,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$DetailedStage<TRes> get stage =>
      CopyWith$Fragment$DetailedStage.stub(_res);
}

class Variables$Query$GetMaterial {
  factory Variables$Query$GetMaterial({required String id}) =>
      Variables$Query$GetMaterial._({
        r'id': id,
      });

  Variables$Query$GetMaterial._(this._$data);

  factory Variables$Query$GetMaterial.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$GetMaterial._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$GetMaterial<Variables$Query$GetMaterial>
      get copyWith => CopyWith$Variables$Query$GetMaterial(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetMaterial ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Query$GetMaterial<TRes> {
  factory CopyWith$Variables$Query$GetMaterial(
    Variables$Query$GetMaterial instance,
    TRes Function(Variables$Query$GetMaterial) then,
  ) = _CopyWithImpl$Variables$Query$GetMaterial;

  factory CopyWith$Variables$Query$GetMaterial.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetMaterial;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$GetMaterial<TRes>
    implements CopyWith$Variables$Query$GetMaterial<TRes> {
  _CopyWithImpl$Variables$Query$GetMaterial(
    this._instance,
    this._then,
  );

  final Variables$Query$GetMaterial _instance;

  final TRes Function(Variables$Query$GetMaterial) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(Variables$Query$GetMaterial._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetMaterial<TRes>
    implements CopyWith$Variables$Query$GetMaterial<TRes> {
  _CopyWithStubImpl$Variables$Query$GetMaterial(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$GetMaterial {
  Query$GetMaterial({
    required this.user,
    this.$__typename = 'Query',
  });

  factory Query$GetMaterial.fromJson(Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$GetMaterial(
      user: Query$GetMaterial$user.fromJson((l$user as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetMaterial$user user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetMaterial || runtimeType != other.runtimeType) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetMaterial on Query$GetMaterial {
  CopyWith$Query$GetMaterial<Query$GetMaterial> get copyWith =>
      CopyWith$Query$GetMaterial(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetMaterial<TRes> {
  factory CopyWith$Query$GetMaterial(
    Query$GetMaterial instance,
    TRes Function(Query$GetMaterial) then,
  ) = _CopyWithImpl$Query$GetMaterial;

  factory CopyWith$Query$GetMaterial.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMaterial;

  TRes call({
    Query$GetMaterial$user? user,
    String? $__typename,
  });
  CopyWith$Query$GetMaterial$user<TRes> get user;
}

class _CopyWithImpl$Query$GetMaterial<TRes>
    implements CopyWith$Query$GetMaterial<TRes> {
  _CopyWithImpl$Query$GetMaterial(
    this._instance,
    this._then,
  );

  final Query$GetMaterial _instance;

  final TRes Function(Query$GetMaterial) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetMaterial(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Query$GetMaterial$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetMaterial$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$GetMaterial$user(local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$GetMaterial<TRes>
    implements CopyWith$Query$GetMaterial<TRes> {
  _CopyWithStubImpl$Query$GetMaterial(this._res);

  TRes _res;

  call({
    Query$GetMaterial$user? user,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetMaterial$user<TRes> get user =>
      CopyWith$Query$GetMaterial$user.stub(_res);
}

const documentNodeQueryGetMaterial = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetMaterial'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'user'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'material'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              )
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'Material'),
                directives: [],
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  fragmentDefinitionMaterial,
  fragmentDefinitionMiniDetails,
]);
Query$GetMaterial _parserFn$Query$GetMaterial(Map<String, dynamic> data) =>
    Query$GetMaterial.fromJson(data);
typedef OnQueryComplete$Query$GetMaterial = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetMaterial?,
);

class Options$Query$GetMaterial
    extends graphql.QueryOptions<Query$GetMaterial> {
  Options$Query$GetMaterial({
    String? operationName,
    required Variables$Query$GetMaterial variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMaterial? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetMaterial? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$GetMaterial(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetMaterial,
          parserFn: _parserFn$Query$GetMaterial,
        );

  final OnQueryComplete$Query$GetMaterial? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetMaterial
    extends graphql.WatchQueryOptions<Query$GetMaterial> {
  WatchOptions$Query$GetMaterial({
    String? operationName,
    required Variables$Query$GetMaterial variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMaterial? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryGetMaterial,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetMaterial,
        );
}

class FetchMoreOptions$Query$GetMaterial extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetMaterial({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetMaterial variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetMaterial,
        );
}

extension ClientExtension$Query$GetMaterial on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetMaterial>> query$GetMaterial(
          Options$Query$GetMaterial options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$GetMaterial> watchQuery$GetMaterial(
          WatchOptions$Query$GetMaterial options) =>
      this.watchQuery(options);
  void writeQuery$GetMaterial({
    required Query$GetMaterial data,
    required Variables$Query$GetMaterial variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryGetMaterial),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetMaterial? readQuery$GetMaterial({
    required Variables$Query$GetMaterial variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetMaterial),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetMaterial.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetMaterial> useQuery$GetMaterial(
        Options$Query$GetMaterial options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetMaterial> useWatchQuery$GetMaterial(
        WatchOptions$Query$GetMaterial options) =>
    graphql_flutter.useWatchQuery(options);

class Query$GetMaterial$Widget
    extends graphql_flutter.Query<Query$GetMaterial> {
  Query$GetMaterial$Widget({
    widgets.Key? key,
    required Options$Query$GetMaterial options,
    required graphql_flutter.QueryBuilder<Query$GetMaterial> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$GetMaterial$user {
  Query$GetMaterial$user({
    this.material,
    this.$__typename = 'UserQuery',
  });

  factory Query$GetMaterial$user.fromJson(Map<String, dynamic> json) {
    final l$material = json['material'];
    final l$$__typename = json['__typename'];
    return Query$GetMaterial$user(
      material: l$material == null
          ? null
          : Fragment$Material.fromJson((l$material as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$Material? material;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$material = material;
    _resultData['material'] = l$material?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$material = material;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$material,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetMaterial$user || runtimeType != other.runtimeType) {
      return false;
    }
    final l$material = material;
    final lOther$material = other.material;
    if (l$material != lOther$material) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetMaterial$user on Query$GetMaterial$user {
  CopyWith$Query$GetMaterial$user<Query$GetMaterial$user> get copyWith =>
      CopyWith$Query$GetMaterial$user(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetMaterial$user<TRes> {
  factory CopyWith$Query$GetMaterial$user(
    Query$GetMaterial$user instance,
    TRes Function(Query$GetMaterial$user) then,
  ) = _CopyWithImpl$Query$GetMaterial$user;

  factory CopyWith$Query$GetMaterial$user.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMaterial$user;

  TRes call({
    Fragment$Material? material,
    String? $__typename,
  });
  CopyWith$Fragment$Material<TRes> get material;
}

class _CopyWithImpl$Query$GetMaterial$user<TRes>
    implements CopyWith$Query$GetMaterial$user<TRes> {
  _CopyWithImpl$Query$GetMaterial$user(
    this._instance,
    this._then,
  );

  final Query$GetMaterial$user _instance;

  final TRes Function(Query$GetMaterial$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? material = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetMaterial$user(
        material: material == _undefined
            ? _instance.material
            : (material as Fragment$Material?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$Material<TRes> get material {
    final local$material = _instance.material;
    return local$material == null
        ? CopyWith$Fragment$Material.stub(_then(_instance))
        : CopyWith$Fragment$Material(local$material, (e) => call(material: e));
  }
}

class _CopyWithStubImpl$Query$GetMaterial$user<TRes>
    implements CopyWith$Query$GetMaterial$user<TRes> {
  _CopyWithStubImpl$Query$GetMaterial$user(this._res);

  TRes _res;

  call({
    Fragment$Material? material,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$Material<TRes> get material =>
      CopyWith$Fragment$Material.stub(_res);
}

class Variables$Query$GetMaterialDetails {
  factory Variables$Query$GetMaterialDetails({required String id}) =>
      Variables$Query$GetMaterialDetails._({
        r'id': id,
      });

  Variables$Query$GetMaterialDetails._(this._$data);

  factory Variables$Query$GetMaterialDetails.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$GetMaterialDetails._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$GetMaterialDetails<
          Variables$Query$GetMaterialDetails>
      get copyWith => CopyWith$Variables$Query$GetMaterialDetails(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetMaterialDetails ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Query$GetMaterialDetails<TRes> {
  factory CopyWith$Variables$Query$GetMaterialDetails(
    Variables$Query$GetMaterialDetails instance,
    TRes Function(Variables$Query$GetMaterialDetails) then,
  ) = _CopyWithImpl$Variables$Query$GetMaterialDetails;

  factory CopyWith$Variables$Query$GetMaterialDetails.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetMaterialDetails;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$GetMaterialDetails<TRes>
    implements CopyWith$Variables$Query$GetMaterialDetails<TRes> {
  _CopyWithImpl$Variables$Query$GetMaterialDetails(
    this._instance,
    this._then,
  );

  final Variables$Query$GetMaterialDetails _instance;

  final TRes Function(Variables$Query$GetMaterialDetails) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$GetMaterialDetails._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetMaterialDetails<TRes>
    implements CopyWith$Variables$Query$GetMaterialDetails<TRes> {
  _CopyWithStubImpl$Variables$Query$GetMaterialDetails(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$GetMaterialDetails {
  Query$GetMaterialDetails({
    required this.user,
    this.$__typename = 'Query',
  });

  factory Query$GetMaterialDetails.fromJson(Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$GetMaterialDetails(
      user: Query$GetMaterialDetails$user.fromJson(
          (l$user as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetMaterialDetails$user user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetMaterialDetails ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetMaterialDetails
    on Query$GetMaterialDetails {
  CopyWith$Query$GetMaterialDetails<Query$GetMaterialDetails> get copyWith =>
      CopyWith$Query$GetMaterialDetails(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetMaterialDetails<TRes> {
  factory CopyWith$Query$GetMaterialDetails(
    Query$GetMaterialDetails instance,
    TRes Function(Query$GetMaterialDetails) then,
  ) = _CopyWithImpl$Query$GetMaterialDetails;

  factory CopyWith$Query$GetMaterialDetails.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMaterialDetails;

  TRes call({
    Query$GetMaterialDetails$user? user,
    String? $__typename,
  });
  CopyWith$Query$GetMaterialDetails$user<TRes> get user;
}

class _CopyWithImpl$Query$GetMaterialDetails<TRes>
    implements CopyWith$Query$GetMaterialDetails<TRes> {
  _CopyWithImpl$Query$GetMaterialDetails(
    this._instance,
    this._then,
  );

  final Query$GetMaterialDetails _instance;

  final TRes Function(Query$GetMaterialDetails) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetMaterialDetails(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Query$GetMaterialDetails$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetMaterialDetails$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$GetMaterialDetails$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$GetMaterialDetails<TRes>
    implements CopyWith$Query$GetMaterialDetails<TRes> {
  _CopyWithStubImpl$Query$GetMaterialDetails(this._res);

  TRes _res;

  call({
    Query$GetMaterialDetails$user? user,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetMaterialDetails$user<TRes> get user =>
      CopyWith$Query$GetMaterialDetails$user.stub(_res);
}

const documentNodeQueryGetMaterialDetails = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetMaterialDetails'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'user'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'material'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              )
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'DetailedMaterial'),
                directives: [],
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  fragmentDefinitionDetailedMaterial,
  fragmentDefinitionMaterial,
  fragmentDefinitionMiniDetails,
  fragmentDefinitionMaterialDetails,
  fragmentDefinitionStoryDetails,
  fragmentDefinitionStoryPart,
  fragmentDefinitionQuizQuestion,
  fragmentDefinitionQuestionItem,
  fragmentDefinitionQuizDetails,
  fragmentDefinitionQuizPrelude,
  fragmentDefinitionQuizPreludeItem,
  fragmentDefinitionConversationDetails,
  fragmentDefinitionConversationCharacter,
  fragmentDefinitionUserAnswer,
  fragmentDefinitionAIFeedback,
  fragmentDefinitionAIFeedbackInterface,
  fragmentDefinitionAIFeedbackPart,
  fragmentDefinitionConversationTurn,
]);
Query$GetMaterialDetails _parserFn$Query$GetMaterialDetails(
        Map<String, dynamic> data) =>
    Query$GetMaterialDetails.fromJson(data);
typedef OnQueryComplete$Query$GetMaterialDetails = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetMaterialDetails?,
);

class Options$Query$GetMaterialDetails
    extends graphql.QueryOptions<Query$GetMaterialDetails> {
  Options$Query$GetMaterialDetails({
    String? operationName,
    required Variables$Query$GetMaterialDetails variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMaterialDetails? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetMaterialDetails? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null
                        ? null
                        : _parserFn$Query$GetMaterialDetails(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetMaterialDetails,
          parserFn: _parserFn$Query$GetMaterialDetails,
        );

  final OnQueryComplete$Query$GetMaterialDetails? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetMaterialDetails
    extends graphql.WatchQueryOptions<Query$GetMaterialDetails> {
  WatchOptions$Query$GetMaterialDetails({
    String? operationName,
    required Variables$Query$GetMaterialDetails variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMaterialDetails? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryGetMaterialDetails,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetMaterialDetails,
        );
}

class FetchMoreOptions$Query$GetMaterialDetails
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetMaterialDetails({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetMaterialDetails variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetMaterialDetails,
        );
}

extension ClientExtension$Query$GetMaterialDetails on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetMaterialDetails>>
      query$GetMaterialDetails(
              Options$Query$GetMaterialDetails options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$GetMaterialDetails>
      watchQuery$GetMaterialDetails(
              WatchOptions$Query$GetMaterialDetails options) =>
          this.watchQuery(options);
  void writeQuery$GetMaterialDetails({
    required Query$GetMaterialDetails data,
    required Variables$Query$GetMaterialDetails variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryGetMaterialDetails),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetMaterialDetails? readQuery$GetMaterialDetails({
    required Variables$Query$GetMaterialDetails variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryGetMaterialDetails),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetMaterialDetails.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetMaterialDetails>
    useQuery$GetMaterialDetails(Options$Query$GetMaterialDetails options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetMaterialDetails>
    useWatchQuery$GetMaterialDetails(
            WatchOptions$Query$GetMaterialDetails options) =>
        graphql_flutter.useWatchQuery(options);

class Query$GetMaterialDetails$Widget
    extends graphql_flutter.Query<Query$GetMaterialDetails> {
  Query$GetMaterialDetails$Widget({
    widgets.Key? key,
    required Options$Query$GetMaterialDetails options,
    required graphql_flutter.QueryBuilder<Query$GetMaterialDetails> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$GetMaterialDetails$user {
  Query$GetMaterialDetails$user({
    this.material,
    this.$__typename = 'UserQuery',
  });

  factory Query$GetMaterialDetails$user.fromJson(Map<String, dynamic> json) {
    final l$material = json['material'];
    final l$$__typename = json['__typename'];
    return Query$GetMaterialDetails$user(
      material: l$material == null
          ? null
          : Fragment$DetailedMaterial.fromJson(
              (l$material as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$DetailedMaterial? material;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$material = material;
    _resultData['material'] = l$material?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$material = material;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$material,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetMaterialDetails$user ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$material = material;
    final lOther$material = other.material;
    if (l$material != lOther$material) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetMaterialDetails$user
    on Query$GetMaterialDetails$user {
  CopyWith$Query$GetMaterialDetails$user<Query$GetMaterialDetails$user>
      get copyWith => CopyWith$Query$GetMaterialDetails$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetMaterialDetails$user<TRes> {
  factory CopyWith$Query$GetMaterialDetails$user(
    Query$GetMaterialDetails$user instance,
    TRes Function(Query$GetMaterialDetails$user) then,
  ) = _CopyWithImpl$Query$GetMaterialDetails$user;

  factory CopyWith$Query$GetMaterialDetails$user.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMaterialDetails$user;

  TRes call({
    Fragment$DetailedMaterial? material,
    String? $__typename,
  });
  CopyWith$Fragment$DetailedMaterial<TRes> get material;
}

class _CopyWithImpl$Query$GetMaterialDetails$user<TRes>
    implements CopyWith$Query$GetMaterialDetails$user<TRes> {
  _CopyWithImpl$Query$GetMaterialDetails$user(
    this._instance,
    this._then,
  );

  final Query$GetMaterialDetails$user _instance;

  final TRes Function(Query$GetMaterialDetails$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? material = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetMaterialDetails$user(
        material: material == _undefined
            ? _instance.material
            : (material as Fragment$DetailedMaterial?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$DetailedMaterial<TRes> get material {
    final local$material = _instance.material;
    return local$material == null
        ? CopyWith$Fragment$DetailedMaterial.stub(_then(_instance))
        : CopyWith$Fragment$DetailedMaterial(
            local$material, (e) => call(material: e));
  }
}

class _CopyWithStubImpl$Query$GetMaterialDetails$user<TRes>
    implements CopyWith$Query$GetMaterialDetails$user<TRes> {
  _CopyWithStubImpl$Query$GetMaterialDetails$user(this._res);

  TRes _res;

  call({
    Fragment$DetailedMaterial? material,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$DetailedMaterial<TRes> get material =>
      CopyWith$Fragment$DetailedMaterial.stub(_res);
}

class Variables$Subscription$StartConversation {
  factory Variables$Subscription$StartConversation(
          {required String materialId}) =>
      Variables$Subscription$StartConversation._({
        r'materialId': materialId,
      });

  Variables$Subscription$StartConversation._(this._$data);

  factory Variables$Subscription$StartConversation.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$materialId = data['materialId'];
    result$data['materialId'] = (l$materialId as String);
    return Variables$Subscription$StartConversation._(result$data);
  }

  Map<String, dynamic> _$data;

  String get materialId => (_$data['materialId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$materialId = materialId;
    result$data['materialId'] = l$materialId;
    return result$data;
  }

  CopyWith$Variables$Subscription$StartConversation<
          Variables$Subscription$StartConversation>
      get copyWith => CopyWith$Variables$Subscription$StartConversation(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Subscription$StartConversation ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$materialId = materialId;
    final lOther$materialId = other.materialId;
    if (l$materialId != lOther$materialId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$materialId = materialId;
    return Object.hashAll([l$materialId]);
  }
}

abstract class CopyWith$Variables$Subscription$StartConversation<TRes> {
  factory CopyWith$Variables$Subscription$StartConversation(
    Variables$Subscription$StartConversation instance,
    TRes Function(Variables$Subscription$StartConversation) then,
  ) = _CopyWithImpl$Variables$Subscription$StartConversation;

  factory CopyWith$Variables$Subscription$StartConversation.stub(TRes res) =
      _CopyWithStubImpl$Variables$Subscription$StartConversation;

  TRes call({String? materialId});
}

class _CopyWithImpl$Variables$Subscription$StartConversation<TRes>
    implements CopyWith$Variables$Subscription$StartConversation<TRes> {
  _CopyWithImpl$Variables$Subscription$StartConversation(
    this._instance,
    this._then,
  );

  final Variables$Subscription$StartConversation _instance;

  final TRes Function(Variables$Subscription$StartConversation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? materialId = _undefined}) =>
      _then(Variables$Subscription$StartConversation._({
        ..._instance._$data,
        if (materialId != _undefined && materialId != null)
          'materialId': (materialId as String),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$StartConversation<TRes>
    implements CopyWith$Variables$Subscription$StartConversation<TRes> {
  _CopyWithStubImpl$Variables$Subscription$StartConversation(this._res);

  TRes _res;

  call({String? materialId}) => _res;
}

class Subscription$StartConversation {
  Subscription$StartConversation({required this.start_conversation});

  factory Subscription$StartConversation.fromJson(Map<String, dynamic> json) {
    final l$start_conversation = json['start_conversation'];
    return Subscription$StartConversation(
        start_conversation: Fragment$ConversationUpdate.fromJson(
            (l$start_conversation as Map<String, dynamic>)));
  }

  final Fragment$ConversationUpdate start_conversation;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$start_conversation = start_conversation;
    _resultData['start_conversation'] = l$start_conversation.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$start_conversation = start_conversation;
    return Object.hashAll([l$start_conversation]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Subscription$StartConversation ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$start_conversation = start_conversation;
    final lOther$start_conversation = other.start_conversation;
    if (l$start_conversation != lOther$start_conversation) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$StartConversation
    on Subscription$StartConversation {
  CopyWith$Subscription$StartConversation<Subscription$StartConversation>
      get copyWith => CopyWith$Subscription$StartConversation(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$StartConversation<TRes> {
  factory CopyWith$Subscription$StartConversation(
    Subscription$StartConversation instance,
    TRes Function(Subscription$StartConversation) then,
  ) = _CopyWithImpl$Subscription$StartConversation;

  factory CopyWith$Subscription$StartConversation.stub(TRes res) =
      _CopyWithStubImpl$Subscription$StartConversation;

  TRes call({Fragment$ConversationUpdate? start_conversation});
  CopyWith$Fragment$ConversationUpdate<TRes> get start_conversation;
}

class _CopyWithImpl$Subscription$StartConversation<TRes>
    implements CopyWith$Subscription$StartConversation<TRes> {
  _CopyWithImpl$Subscription$StartConversation(
    this._instance,
    this._then,
  );

  final Subscription$StartConversation _instance;

  final TRes Function(Subscription$StartConversation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? start_conversation = _undefined}) =>
      _then(Subscription$StartConversation(
          start_conversation:
              start_conversation == _undefined || start_conversation == null
                  ? _instance.start_conversation
                  : (start_conversation as Fragment$ConversationUpdate)));

  CopyWith$Fragment$ConversationUpdate<TRes> get start_conversation {
    final local$start_conversation = _instance.start_conversation;
    return CopyWith$Fragment$ConversationUpdate(
        local$start_conversation, (e) => call(start_conversation: e));
  }
}

class _CopyWithStubImpl$Subscription$StartConversation<TRes>
    implements CopyWith$Subscription$StartConversation<TRes> {
  _CopyWithStubImpl$Subscription$StartConversation(this._res);

  TRes _res;

  call({Fragment$ConversationUpdate? start_conversation}) => _res;

  CopyWith$Fragment$ConversationUpdate<TRes> get start_conversation =>
      CopyWith$Fragment$ConversationUpdate.stub(_res);
}

const documentNodeSubscriptionStartConversation = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'StartConversation'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'materialId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'start_conversation'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'materialId'),
            value: VariableNode(name: NameNode(value: 'materialId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'ConversationUpdate'),
            directives: [],
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  ),
  fragmentDefinitionConversationUpdate,
  fragmentDefinitionConversationTurn,
]);
Subscription$StartConversation _parserFn$Subscription$StartConversation(
        Map<String, dynamic> data) =>
    Subscription$StartConversation.fromJson(data);

class Options$Subscription$StartConversation
    extends graphql.SubscriptionOptions<Subscription$StartConversation> {
  Options$Subscription$StartConversation({
    String? operationName,
    required Variables$Subscription$StartConversation variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$StartConversation? typedOptimisticResult,
    graphql.Context? context,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeSubscriptionStartConversation,
          parserFn: _parserFn$Subscription$StartConversation,
        );
}

class WatchOptions$Subscription$StartConversation
    extends graphql.WatchQueryOptions<Subscription$StartConversation> {
  WatchOptions$Subscription$StartConversation({
    String? operationName,
    required Variables$Subscription$StartConversation variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$StartConversation? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeSubscriptionStartConversation,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$StartConversation,
        );
}

class FetchMoreOptions$Subscription$StartConversation
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$StartConversation({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$StartConversation variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionStartConversation,
        );
}

extension ClientExtension$Subscription$StartConversation
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$StartConversation>>
      subscribe$StartConversation(
              Options$Subscription$StartConversation options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$StartConversation>
      watchSubscription$StartConversation(
              WatchOptions$Subscription$StartConversation options) =>
          this.watchQuery(options);
}

graphql.QueryResult<Subscription$StartConversation>
    useSubscription$StartConversation(
            Options$Subscription$StartConversation options) =>
        graphql_flutter.useSubscription(options);

class Subscription$StartConversation$Widget
    extends graphql_flutter.Subscription<Subscription$StartConversation> {
  Subscription$StartConversation$Widget({
    widgets.Key? key,
    required Options$Subscription$StartConversation options,
    required graphql_flutter.SubscriptionBuilder<Subscription$StartConversation>
        builder,
    graphql_flutter.OnSubscriptionResult<Subscription$StartConversation>?
        onSubscriptionResult,
  }) : super(
          key: key,
          options: options,
          builder: builder,
          onSubscriptionResult: onSubscriptionResult,
        );
}

class Variables$Query$GetConversationTurns {
  factory Variables$Query$GetConversationTurns({required String materialId}) =>
      Variables$Query$GetConversationTurns._({
        r'materialId': materialId,
      });

  Variables$Query$GetConversationTurns._(this._$data);

  factory Variables$Query$GetConversationTurns.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$materialId = data['materialId'];
    result$data['materialId'] = (l$materialId as String);
    return Variables$Query$GetConversationTurns._(result$data);
  }

  Map<String, dynamic> _$data;

  String get materialId => (_$data['materialId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$materialId = materialId;
    result$data['materialId'] = l$materialId;
    return result$data;
  }

  CopyWith$Variables$Query$GetConversationTurns<
          Variables$Query$GetConversationTurns>
      get copyWith => CopyWith$Variables$Query$GetConversationTurns(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetConversationTurns ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$materialId = materialId;
    final lOther$materialId = other.materialId;
    if (l$materialId != lOther$materialId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$materialId = materialId;
    return Object.hashAll([l$materialId]);
  }
}

abstract class CopyWith$Variables$Query$GetConversationTurns<TRes> {
  factory CopyWith$Variables$Query$GetConversationTurns(
    Variables$Query$GetConversationTurns instance,
    TRes Function(Variables$Query$GetConversationTurns) then,
  ) = _CopyWithImpl$Variables$Query$GetConversationTurns;

  factory CopyWith$Variables$Query$GetConversationTurns.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetConversationTurns;

  TRes call({String? materialId});
}

class _CopyWithImpl$Variables$Query$GetConversationTurns<TRes>
    implements CopyWith$Variables$Query$GetConversationTurns<TRes> {
  _CopyWithImpl$Variables$Query$GetConversationTurns(
    this._instance,
    this._then,
  );

  final Variables$Query$GetConversationTurns _instance;

  final TRes Function(Variables$Query$GetConversationTurns) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? materialId = _undefined}) =>
      _then(Variables$Query$GetConversationTurns._({
        ..._instance._$data,
        if (materialId != _undefined && materialId != null)
          'materialId': (materialId as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetConversationTurns<TRes>
    implements CopyWith$Variables$Query$GetConversationTurns<TRes> {
  _CopyWithStubImpl$Variables$Query$GetConversationTurns(this._res);

  TRes _res;

  call({String? materialId}) => _res;
}

class Query$GetConversationTurns {
  Query$GetConversationTurns({
    required this.user,
    this.$__typename = 'Query',
  });

  factory Query$GetConversationTurns.fromJson(Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$GetConversationTurns(
      user: Query$GetConversationTurns$user.fromJson(
          (l$user as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetConversationTurns$user user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetConversationTurns ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetConversationTurns
    on Query$GetConversationTurns {
  CopyWith$Query$GetConversationTurns<Query$GetConversationTurns>
      get copyWith => CopyWith$Query$GetConversationTurns(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetConversationTurns<TRes> {
  factory CopyWith$Query$GetConversationTurns(
    Query$GetConversationTurns instance,
    TRes Function(Query$GetConversationTurns) then,
  ) = _CopyWithImpl$Query$GetConversationTurns;

  factory CopyWith$Query$GetConversationTurns.stub(TRes res) =
      _CopyWithStubImpl$Query$GetConversationTurns;

  TRes call({
    Query$GetConversationTurns$user? user,
    String? $__typename,
  });
  CopyWith$Query$GetConversationTurns$user<TRes> get user;
}

class _CopyWithImpl$Query$GetConversationTurns<TRes>
    implements CopyWith$Query$GetConversationTurns<TRes> {
  _CopyWithImpl$Query$GetConversationTurns(
    this._instance,
    this._then,
  );

  final Query$GetConversationTurns _instance;

  final TRes Function(Query$GetConversationTurns) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetConversationTurns(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Query$GetConversationTurns$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetConversationTurns$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$GetConversationTurns$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$GetConversationTurns<TRes>
    implements CopyWith$Query$GetConversationTurns<TRes> {
  _CopyWithStubImpl$Query$GetConversationTurns(this._res);

  TRes _res;

  call({
    Query$GetConversationTurns$user? user,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetConversationTurns$user<TRes> get user =>
      CopyWith$Query$GetConversationTurns$user.stub(_res);
}

const documentNodeQueryGetConversationTurns = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetConversationTurns'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'materialId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'user'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'conversation_turns'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'materialId'),
                value: VariableNode(name: NameNode(value: 'materialId')),
              )
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'ConversationTurn'),
                directives: [],
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  fragmentDefinitionConversationTurn,
]);
Query$GetConversationTurns _parserFn$Query$GetConversationTurns(
        Map<String, dynamic> data) =>
    Query$GetConversationTurns.fromJson(data);
typedef OnQueryComplete$Query$GetConversationTurns = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetConversationTurns?,
);

class Options$Query$GetConversationTurns
    extends graphql.QueryOptions<Query$GetConversationTurns> {
  Options$Query$GetConversationTurns({
    String? operationName,
    required Variables$Query$GetConversationTurns variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetConversationTurns? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetConversationTurns? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null
                        ? null
                        : _parserFn$Query$GetConversationTurns(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetConversationTurns,
          parserFn: _parserFn$Query$GetConversationTurns,
        );

  final OnQueryComplete$Query$GetConversationTurns? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetConversationTurns
    extends graphql.WatchQueryOptions<Query$GetConversationTurns> {
  WatchOptions$Query$GetConversationTurns({
    String? operationName,
    required Variables$Query$GetConversationTurns variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetConversationTurns? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryGetConversationTurns,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetConversationTurns,
        );
}

class FetchMoreOptions$Query$GetConversationTurns
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetConversationTurns({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetConversationTurns variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetConversationTurns,
        );
}

extension ClientExtension$Query$GetConversationTurns on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetConversationTurns>>
      query$GetConversationTurns(
              Options$Query$GetConversationTurns options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$GetConversationTurns>
      watchQuery$GetConversationTurns(
              WatchOptions$Query$GetConversationTurns options) =>
          this.watchQuery(options);
  void writeQuery$GetConversationTurns({
    required Query$GetConversationTurns data,
    required Variables$Query$GetConversationTurns variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryGetConversationTurns),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetConversationTurns? readQuery$GetConversationTurns({
    required Variables$Query$GetConversationTurns variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryGetConversationTurns),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetConversationTurns.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetConversationTurns>
    useQuery$GetConversationTurns(Options$Query$GetConversationTurns options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetConversationTurns>
    useWatchQuery$GetConversationTurns(
            WatchOptions$Query$GetConversationTurns options) =>
        graphql_flutter.useWatchQuery(options);

class Query$GetConversationTurns$Widget
    extends graphql_flutter.Query<Query$GetConversationTurns> {
  Query$GetConversationTurns$Widget({
    widgets.Key? key,
    required Options$Query$GetConversationTurns options,
    required graphql_flutter.QueryBuilder<Query$GetConversationTurns> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$GetConversationTurns$user {
  Query$GetConversationTurns$user({
    required this.conversation_turns,
    this.$__typename = 'UserQuery',
  });

  factory Query$GetConversationTurns$user.fromJson(Map<String, dynamic> json) {
    final l$conversation_turns = json['conversation_turns'];
    final l$$__typename = json['__typename'];
    return Query$GetConversationTurns$user(
      conversation_turns: (l$conversation_turns as List<dynamic>)
          .map((e) =>
              Fragment$ConversationTurn.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$ConversationTurn> conversation_turns;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$conversation_turns = conversation_turns;
    _resultData['conversation_turns'] =
        l$conversation_turns.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$conversation_turns = conversation_turns;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$conversation_turns.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetConversationTurns$user ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$conversation_turns = conversation_turns;
    final lOther$conversation_turns = other.conversation_turns;
    if (l$conversation_turns.length != lOther$conversation_turns.length) {
      return false;
    }
    for (int i = 0; i < l$conversation_turns.length; i++) {
      final l$conversation_turns$entry = l$conversation_turns[i];
      final lOther$conversation_turns$entry = lOther$conversation_turns[i];
      if (l$conversation_turns$entry != lOther$conversation_turns$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetConversationTurns$user
    on Query$GetConversationTurns$user {
  CopyWith$Query$GetConversationTurns$user<Query$GetConversationTurns$user>
      get copyWith => CopyWith$Query$GetConversationTurns$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetConversationTurns$user<TRes> {
  factory CopyWith$Query$GetConversationTurns$user(
    Query$GetConversationTurns$user instance,
    TRes Function(Query$GetConversationTurns$user) then,
  ) = _CopyWithImpl$Query$GetConversationTurns$user;

  factory CopyWith$Query$GetConversationTurns$user.stub(TRes res) =
      _CopyWithStubImpl$Query$GetConversationTurns$user;

  TRes call({
    List<Fragment$ConversationTurn>? conversation_turns,
    String? $__typename,
  });
  TRes conversation_turns(
      Iterable<Fragment$ConversationTurn> Function(
              Iterable<
                  CopyWith$Fragment$ConversationTurn<
                      Fragment$ConversationTurn>>)
          _fn);
}

class _CopyWithImpl$Query$GetConversationTurns$user<TRes>
    implements CopyWith$Query$GetConversationTurns$user<TRes> {
  _CopyWithImpl$Query$GetConversationTurns$user(
    this._instance,
    this._then,
  );

  final Query$GetConversationTurns$user _instance;

  final TRes Function(Query$GetConversationTurns$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? conversation_turns = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetConversationTurns$user(
        conversation_turns:
            conversation_turns == _undefined || conversation_turns == null
                ? _instance.conversation_turns
                : (conversation_turns as List<Fragment$ConversationTurn>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes conversation_turns(
          Iterable<Fragment$ConversationTurn> Function(
                  Iterable<
                      CopyWith$Fragment$ConversationTurn<
                          Fragment$ConversationTurn>>)
              _fn) =>
      call(
          conversation_turns: _fn(_instance.conversation_turns
              .map((e) => CopyWith$Fragment$ConversationTurn(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$GetConversationTurns$user<TRes>
    implements CopyWith$Query$GetConversationTurns$user<TRes> {
  _CopyWithStubImpl$Query$GetConversationTurns$user(this._res);

  TRes _res;

  call({
    List<Fragment$ConversationTurn>? conversation_turns,
    String? $__typename,
  }) =>
      _res;

  conversation_turns(_fn) => _res;
}

class Variables$Query$ParsedUnits {
  factory Variables$Query$ParsedUnits({
    required String text,
    required String journeyId,
  }) =>
      Variables$Query$ParsedUnits._({
        r'text': text,
        r'journeyId': journeyId,
      });

  Variables$Query$ParsedUnits._(this._$data);

  factory Variables$Query$ParsedUnits.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$text = data['text'];
    result$data['text'] = (l$text as String);
    final l$journeyId = data['journeyId'];
    result$data['journeyId'] = (l$journeyId as String);
    return Variables$Query$ParsedUnits._(result$data);
  }

  Map<String, dynamic> _$data;

  String get text => (_$data['text'] as String);

  String get journeyId => (_$data['journeyId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$text = text;
    result$data['text'] = l$text;
    final l$journeyId = journeyId;
    result$data['journeyId'] = l$journeyId;
    return result$data;
  }

  CopyWith$Variables$Query$ParsedUnits<Variables$Query$ParsedUnits>
      get copyWith => CopyWith$Variables$Query$ParsedUnits(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$ParsedUnits ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$text = text;
    final lOther$text = other.text;
    if (l$text != lOther$text) {
      return false;
    }
    final l$journeyId = journeyId;
    final lOther$journeyId = other.journeyId;
    if (l$journeyId != lOther$journeyId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$text = text;
    final l$journeyId = journeyId;
    return Object.hashAll([
      l$text,
      l$journeyId,
    ]);
  }
}

abstract class CopyWith$Variables$Query$ParsedUnits<TRes> {
  factory CopyWith$Variables$Query$ParsedUnits(
    Variables$Query$ParsedUnits instance,
    TRes Function(Variables$Query$ParsedUnits) then,
  ) = _CopyWithImpl$Variables$Query$ParsedUnits;

  factory CopyWith$Variables$Query$ParsedUnits.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$ParsedUnits;

  TRes call({
    String? text,
    String? journeyId,
  });
}

class _CopyWithImpl$Variables$Query$ParsedUnits<TRes>
    implements CopyWith$Variables$Query$ParsedUnits<TRes> {
  _CopyWithImpl$Variables$Query$ParsedUnits(
    this._instance,
    this._then,
  );

  final Variables$Query$ParsedUnits _instance;

  final TRes Function(Variables$Query$ParsedUnits) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? text = _undefined,
    Object? journeyId = _undefined,
  }) =>
      _then(Variables$Query$ParsedUnits._({
        ..._instance._$data,
        if (text != _undefined && text != null) 'text': (text as String),
        if (journeyId != _undefined && journeyId != null)
          'journeyId': (journeyId as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$ParsedUnits<TRes>
    implements CopyWith$Variables$Query$ParsedUnits<TRes> {
  _CopyWithStubImpl$Variables$Query$ParsedUnits(this._res);

  TRes _res;

  call({
    String? text,
    String? journeyId,
  }) =>
      _res;
}

class Query$ParsedUnits {
  Query$ParsedUnits({
    required this.user,
    this.$__typename = 'Query',
  });

  factory Query$ParsedUnits.fromJson(Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$ParsedUnits(
      user: Query$ParsedUnits$user.fromJson((l$user as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$ParsedUnits$user user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$ParsedUnits || runtimeType != other.runtimeType) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$ParsedUnits on Query$ParsedUnits {
  CopyWith$Query$ParsedUnits<Query$ParsedUnits> get copyWith =>
      CopyWith$Query$ParsedUnits(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$ParsedUnits<TRes> {
  factory CopyWith$Query$ParsedUnits(
    Query$ParsedUnits instance,
    TRes Function(Query$ParsedUnits) then,
  ) = _CopyWithImpl$Query$ParsedUnits;

  factory CopyWith$Query$ParsedUnits.stub(TRes res) =
      _CopyWithStubImpl$Query$ParsedUnits;

  TRes call({
    Query$ParsedUnits$user? user,
    String? $__typename,
  });
  CopyWith$Query$ParsedUnits$user<TRes> get user;
}

class _CopyWithImpl$Query$ParsedUnits<TRes>
    implements CopyWith$Query$ParsedUnits<TRes> {
  _CopyWithImpl$Query$ParsedUnits(
    this._instance,
    this._then,
  );

  final Query$ParsedUnits _instance;

  final TRes Function(Query$ParsedUnits) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ParsedUnits(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Query$ParsedUnits$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$ParsedUnits$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$ParsedUnits$user(local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$ParsedUnits<TRes>
    implements CopyWith$Query$ParsedUnits<TRes> {
  _CopyWithStubImpl$Query$ParsedUnits(this._res);

  TRes _res;

  call({
    Query$ParsedUnits$user? user,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$ParsedUnits$user<TRes> get user =>
      CopyWith$Query$ParsedUnits$user.stub(_res);
}

const documentNodeQueryParsedUnits = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'ParsedUnits'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'text')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'journeyId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'user'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'parsed_units'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'text'),
                value: VariableNode(name: NameNode(value: 'text')),
              ),
              ArgumentNode(
                name: NameNode(value: 'journeyId'),
                value: VariableNode(name: NameNode(value: 'journeyId')),
              ),
            ],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$ParsedUnits _parserFn$Query$ParsedUnits(Map<String, dynamic> data) =>
    Query$ParsedUnits.fromJson(data);
typedef OnQueryComplete$Query$ParsedUnits = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$ParsedUnits?,
);

class Options$Query$ParsedUnits
    extends graphql.QueryOptions<Query$ParsedUnits> {
  Options$Query$ParsedUnits({
    String? operationName,
    required Variables$Query$ParsedUnits variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$ParsedUnits? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$ParsedUnits? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$ParsedUnits(data),
                  ),
          onError: onError,
          document: documentNodeQueryParsedUnits,
          parserFn: _parserFn$Query$ParsedUnits,
        );

  final OnQueryComplete$Query$ParsedUnits? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$ParsedUnits
    extends graphql.WatchQueryOptions<Query$ParsedUnits> {
  WatchOptions$Query$ParsedUnits({
    String? operationName,
    required Variables$Query$ParsedUnits variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$ParsedUnits? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryParsedUnits,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$ParsedUnits,
        );
}

class FetchMoreOptions$Query$ParsedUnits extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$ParsedUnits({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$ParsedUnits variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryParsedUnits,
        );
}

extension ClientExtension$Query$ParsedUnits on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$ParsedUnits>> query$ParsedUnits(
          Options$Query$ParsedUnits options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$ParsedUnits> watchQuery$ParsedUnits(
          WatchOptions$Query$ParsedUnits options) =>
      this.watchQuery(options);
  void writeQuery$ParsedUnits({
    required Query$ParsedUnits data,
    required Variables$Query$ParsedUnits variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryParsedUnits),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$ParsedUnits? readQuery$ParsedUnits({
    required Variables$Query$ParsedUnits variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryParsedUnits),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$ParsedUnits.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$ParsedUnits> useQuery$ParsedUnits(
        Options$Query$ParsedUnits options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$ParsedUnits> useWatchQuery$ParsedUnits(
        WatchOptions$Query$ParsedUnits options) =>
    graphql_flutter.useWatchQuery(options);

class Query$ParsedUnits$Widget
    extends graphql_flutter.Query<Query$ParsedUnits> {
  Query$ParsedUnits$Widget({
    widgets.Key? key,
    required Options$Query$ParsedUnits options,
    required graphql_flutter.QueryBuilder<Query$ParsedUnits> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$ParsedUnits$user {
  Query$ParsedUnits$user({
    required this.parsed_units,
    this.$__typename = 'UserQuery',
  });

  factory Query$ParsedUnits$user.fromJson(Map<String, dynamic> json) {
    final l$parsed_units = json['parsed_units'];
    final l$$__typename = json['__typename'];
    return Query$ParsedUnits$user(
      parsed_units: linguisticUnitSetFromJson(l$parsed_units),
      $__typename: (l$$__typename as String),
    );
  }

  final LinguisticUnitSet parsed_units;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$parsed_units = parsed_units;
    _resultData['parsed_units'] = linguisticUnitSetToJson(l$parsed_units);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$parsed_units = parsed_units;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$parsed_units,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$ParsedUnits$user || runtimeType != other.runtimeType) {
      return false;
    }
    final l$parsed_units = parsed_units;
    final lOther$parsed_units = other.parsed_units;
    if (l$parsed_units != lOther$parsed_units) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$ParsedUnits$user on Query$ParsedUnits$user {
  CopyWith$Query$ParsedUnits$user<Query$ParsedUnits$user> get copyWith =>
      CopyWith$Query$ParsedUnits$user(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$ParsedUnits$user<TRes> {
  factory CopyWith$Query$ParsedUnits$user(
    Query$ParsedUnits$user instance,
    TRes Function(Query$ParsedUnits$user) then,
  ) = _CopyWithImpl$Query$ParsedUnits$user;

  factory CopyWith$Query$ParsedUnits$user.stub(TRes res) =
      _CopyWithStubImpl$Query$ParsedUnits$user;

  TRes call({
    LinguisticUnitSet? parsed_units,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$ParsedUnits$user<TRes>
    implements CopyWith$Query$ParsedUnits$user<TRes> {
  _CopyWithImpl$Query$ParsedUnits$user(
    this._instance,
    this._then,
  );

  final Query$ParsedUnits$user _instance;

  final TRes Function(Query$ParsedUnits$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? parsed_units = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ParsedUnits$user(
        parsed_units: parsed_units == _undefined || parsed_units == null
            ? _instance.parsed_units
            : (parsed_units as LinguisticUnitSet),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$ParsedUnits$user<TRes>
    implements CopyWith$Query$ParsedUnits$user<TRes> {
  _CopyWithStubImpl$Query$ParsedUnits$user(this._res);

  TRes _res;

  call({
    LinguisticUnitSet? parsed_units,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$GetDocumentation {
  factory Variables$Query$GetDocumentation(
          {required Input$DocumentationInput input}) =>
      Variables$Query$GetDocumentation._({
        r'input': input,
      });

  Variables$Query$GetDocumentation._(this._$data);

  factory Variables$Query$GetDocumentation.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] =
        Input$DocumentationInput.fromJson((l$input as Map<String, dynamic>));
    return Variables$Query$GetDocumentation._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$DocumentationInput get input =>
      (_$data['input'] as Input$DocumentationInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Query$GetDocumentation<Variables$Query$GetDocumentation>
      get copyWith => CopyWith$Variables$Query$GetDocumentation(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetDocumentation ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$input = input;
    return Object.hashAll([l$input]);
  }
}

abstract class CopyWith$Variables$Query$GetDocumentation<TRes> {
  factory CopyWith$Variables$Query$GetDocumentation(
    Variables$Query$GetDocumentation instance,
    TRes Function(Variables$Query$GetDocumentation) then,
  ) = _CopyWithImpl$Variables$Query$GetDocumentation;

  factory CopyWith$Variables$Query$GetDocumentation.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetDocumentation;

  TRes call({Input$DocumentationInput? input});
}

class _CopyWithImpl$Variables$Query$GetDocumentation<TRes>
    implements CopyWith$Variables$Query$GetDocumentation<TRes> {
  _CopyWithImpl$Variables$Query$GetDocumentation(
    this._instance,
    this._then,
  );

  final Variables$Query$GetDocumentation _instance;

  final TRes Function(Variables$Query$GetDocumentation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) =>
      _then(Variables$Query$GetDocumentation._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$DocumentationInput),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetDocumentation<TRes>
    implements CopyWith$Variables$Query$GetDocumentation<TRes> {
  _CopyWithStubImpl$Variables$Query$GetDocumentation(this._res);

  TRes _res;

  call({Input$DocumentationInput? input}) => _res;
}

class Query$GetDocumentation {
  Query$GetDocumentation({
    required this.user,
    this.$__typename = 'Query',
  });

  factory Query$GetDocumentation.fromJson(Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$GetDocumentation(
      user: Query$GetDocumentation$user.fromJson(
          (l$user as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetDocumentation$user user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetDocumentation || runtimeType != other.runtimeType) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetDocumentation on Query$GetDocumentation {
  CopyWith$Query$GetDocumentation<Query$GetDocumentation> get copyWith =>
      CopyWith$Query$GetDocumentation(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetDocumentation<TRes> {
  factory CopyWith$Query$GetDocumentation(
    Query$GetDocumentation instance,
    TRes Function(Query$GetDocumentation) then,
  ) = _CopyWithImpl$Query$GetDocumentation;

  factory CopyWith$Query$GetDocumentation.stub(TRes res) =
      _CopyWithStubImpl$Query$GetDocumentation;

  TRes call({
    Query$GetDocumentation$user? user,
    String? $__typename,
  });
  CopyWith$Query$GetDocumentation$user<TRes> get user;
}

class _CopyWithImpl$Query$GetDocumentation<TRes>
    implements CopyWith$Query$GetDocumentation<TRes> {
  _CopyWithImpl$Query$GetDocumentation(
    this._instance,
    this._then,
  );

  final Query$GetDocumentation _instance;

  final TRes Function(Query$GetDocumentation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetDocumentation(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Query$GetDocumentation$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetDocumentation$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$GetDocumentation$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$GetDocumentation<TRes>
    implements CopyWith$Query$GetDocumentation<TRes> {
  _CopyWithStubImpl$Query$GetDocumentation(this._res);

  TRes _res;

  call({
    Query$GetDocumentation$user? user,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetDocumentation$user<TRes> get user =>
      CopyWith$Query$GetDocumentation$user.stub(_res);
}

const documentNodeQueryGetDocumentation = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetDocumentation'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'DocumentationInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'user'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'documentation'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'input'),
                value: VariableNode(name: NameNode(value: 'input')),
              )
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'UserDoc'),
                directives: [],
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  fragmentDefinitionUserDoc,
  fragmentDefinitionUserDocTemplate,
  fragmentDefinitionUserDocExplanation,
]);
Query$GetDocumentation _parserFn$Query$GetDocumentation(
        Map<String, dynamic> data) =>
    Query$GetDocumentation.fromJson(data);
typedef OnQueryComplete$Query$GetDocumentation = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetDocumentation?,
);

class Options$Query$GetDocumentation
    extends graphql.QueryOptions<Query$GetDocumentation> {
  Options$Query$GetDocumentation({
    String? operationName,
    required Variables$Query$GetDocumentation variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetDocumentation? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetDocumentation? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null
                        ? null
                        : _parserFn$Query$GetDocumentation(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetDocumentation,
          parserFn: _parserFn$Query$GetDocumentation,
        );

  final OnQueryComplete$Query$GetDocumentation? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetDocumentation
    extends graphql.WatchQueryOptions<Query$GetDocumentation> {
  WatchOptions$Query$GetDocumentation({
    String? operationName,
    required Variables$Query$GetDocumentation variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetDocumentation? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryGetDocumentation,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetDocumentation,
        );
}

class FetchMoreOptions$Query$GetDocumentation extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetDocumentation({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetDocumentation variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetDocumentation,
        );
}

extension ClientExtension$Query$GetDocumentation on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetDocumentation>> query$GetDocumentation(
          Options$Query$GetDocumentation options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$GetDocumentation> watchQuery$GetDocumentation(
          WatchOptions$Query$GetDocumentation options) =>
      this.watchQuery(options);
  void writeQuery$GetDocumentation({
    required Query$GetDocumentation data,
    required Variables$Query$GetDocumentation variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryGetDocumentation),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetDocumentation? readQuery$GetDocumentation({
    required Variables$Query$GetDocumentation variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryGetDocumentation),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetDocumentation.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetDocumentation>
    useQuery$GetDocumentation(Options$Query$GetDocumentation options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetDocumentation> useWatchQuery$GetDocumentation(
        WatchOptions$Query$GetDocumentation options) =>
    graphql_flutter.useWatchQuery(options);

class Query$GetDocumentation$Widget
    extends graphql_flutter.Query<Query$GetDocumentation> {
  Query$GetDocumentation$Widget({
    widgets.Key? key,
    required Options$Query$GetDocumentation options,
    required graphql_flutter.QueryBuilder<Query$GetDocumentation> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$GetDocumentation$user {
  Query$GetDocumentation$user({
    required this.documentation,
    this.$__typename = 'UserQuery',
  });

  factory Query$GetDocumentation$user.fromJson(Map<String, dynamic> json) {
    final l$documentation = json['documentation'];
    final l$$__typename = json['__typename'];
    return Query$GetDocumentation$user(
      documentation:
          Fragment$UserDoc.fromJson((l$documentation as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$UserDoc documentation;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$documentation = documentation;
    _resultData['documentation'] = l$documentation.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$documentation = documentation;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$documentation,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetDocumentation$user ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$documentation = documentation;
    final lOther$documentation = other.documentation;
    if (l$documentation != lOther$documentation) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetDocumentation$user
    on Query$GetDocumentation$user {
  CopyWith$Query$GetDocumentation$user<Query$GetDocumentation$user>
      get copyWith => CopyWith$Query$GetDocumentation$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetDocumentation$user<TRes> {
  factory CopyWith$Query$GetDocumentation$user(
    Query$GetDocumentation$user instance,
    TRes Function(Query$GetDocumentation$user) then,
  ) = _CopyWithImpl$Query$GetDocumentation$user;

  factory CopyWith$Query$GetDocumentation$user.stub(TRes res) =
      _CopyWithStubImpl$Query$GetDocumentation$user;

  TRes call({
    Fragment$UserDoc? documentation,
    String? $__typename,
  });
  CopyWith$Fragment$UserDoc<TRes> get documentation;
}

class _CopyWithImpl$Query$GetDocumentation$user<TRes>
    implements CopyWith$Query$GetDocumentation$user<TRes> {
  _CopyWithImpl$Query$GetDocumentation$user(
    this._instance,
    this._then,
  );

  final Query$GetDocumentation$user _instance;

  final TRes Function(Query$GetDocumentation$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? documentation = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetDocumentation$user(
        documentation: documentation == _undefined || documentation == null
            ? _instance.documentation
            : (documentation as Fragment$UserDoc),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$UserDoc<TRes> get documentation {
    final local$documentation = _instance.documentation;
    return CopyWith$Fragment$UserDoc(
        local$documentation, (e) => call(documentation: e));
  }
}

class _CopyWithStubImpl$Query$GetDocumentation$user<TRes>
    implements CopyWith$Query$GetDocumentation$user<TRes> {
  _CopyWithStubImpl$Query$GetDocumentation$user(this._res);

  TRes _res;

  call({
    Fragment$UserDoc? documentation,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$UserDoc<TRes> get documentation =>
      CopyWith$Fragment$UserDoc.stub(_res);
}

class Variables$Query$GetJourneyDocs {
  factory Variables$Query$GetJourneyDocs({
    required String journeyId,
    Input$PaginationInput? pagination,
  }) =>
      Variables$Query$GetJourneyDocs._({
        r'journeyId': journeyId,
        if (pagination != null) r'pagination': pagination,
      });

  Variables$Query$GetJourneyDocs._(this._$data);

  factory Variables$Query$GetJourneyDocs.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$journeyId = data['journeyId'];
    result$data['journeyId'] = (l$journeyId as String);
    if (data.containsKey('pagination')) {
      final l$pagination = data['pagination'];
      result$data['pagination'] = l$pagination == null
          ? null
          : Input$PaginationInput.fromJson(
              (l$pagination as Map<String, dynamic>));
    }
    return Variables$Query$GetJourneyDocs._(result$data);
  }

  Map<String, dynamic> _$data;

  String get journeyId => (_$data['journeyId'] as String);

  Input$PaginationInput? get pagination =>
      (_$data['pagination'] as Input$PaginationInput?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$journeyId = journeyId;
    result$data['journeyId'] = l$journeyId;
    if (_$data.containsKey('pagination')) {
      final l$pagination = pagination;
      result$data['pagination'] = l$pagination?.toJson();
    }
    return result$data;
  }

  CopyWith$Variables$Query$GetJourneyDocs<Variables$Query$GetJourneyDocs>
      get copyWith => CopyWith$Variables$Query$GetJourneyDocs(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetJourneyDocs ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$journeyId = journeyId;
    final lOther$journeyId = other.journeyId;
    if (l$journeyId != lOther$journeyId) {
      return false;
    }
    final l$pagination = pagination;
    final lOther$pagination = other.pagination;
    if (_$data.containsKey('pagination') !=
        other._$data.containsKey('pagination')) {
      return false;
    }
    if (l$pagination != lOther$pagination) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$journeyId = journeyId;
    final l$pagination = pagination;
    return Object.hashAll([
      l$journeyId,
      _$data.containsKey('pagination') ? l$pagination : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$GetJourneyDocs<TRes> {
  factory CopyWith$Variables$Query$GetJourneyDocs(
    Variables$Query$GetJourneyDocs instance,
    TRes Function(Variables$Query$GetJourneyDocs) then,
  ) = _CopyWithImpl$Variables$Query$GetJourneyDocs;

  factory CopyWith$Variables$Query$GetJourneyDocs.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetJourneyDocs;

  TRes call({
    String? journeyId,
    Input$PaginationInput? pagination,
  });
}

class _CopyWithImpl$Variables$Query$GetJourneyDocs<TRes>
    implements CopyWith$Variables$Query$GetJourneyDocs<TRes> {
  _CopyWithImpl$Variables$Query$GetJourneyDocs(
    this._instance,
    this._then,
  );

  final Variables$Query$GetJourneyDocs _instance;

  final TRes Function(Variables$Query$GetJourneyDocs) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? journeyId = _undefined,
    Object? pagination = _undefined,
  }) =>
      _then(Variables$Query$GetJourneyDocs._({
        ..._instance._$data,
        if (journeyId != _undefined && journeyId != null)
          'journeyId': (journeyId as String),
        if (pagination != _undefined)
          'pagination': (pagination as Input$PaginationInput?),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetJourneyDocs<TRes>
    implements CopyWith$Variables$Query$GetJourneyDocs<TRes> {
  _CopyWithStubImpl$Variables$Query$GetJourneyDocs(this._res);

  TRes _res;

  call({
    String? journeyId,
    Input$PaginationInput? pagination,
  }) =>
      _res;
}

class Query$GetJourneyDocs {
  Query$GetJourneyDocs({
    required this.user,
    this.$__typename = 'Query',
  });

  factory Query$GetJourneyDocs.fromJson(Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$GetJourneyDocs(
      user:
          Query$GetJourneyDocs$user.fromJson((l$user as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetJourneyDocs$user user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetJourneyDocs || runtimeType != other.runtimeType) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetJourneyDocs on Query$GetJourneyDocs {
  CopyWith$Query$GetJourneyDocs<Query$GetJourneyDocs> get copyWith =>
      CopyWith$Query$GetJourneyDocs(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetJourneyDocs<TRes> {
  factory CopyWith$Query$GetJourneyDocs(
    Query$GetJourneyDocs instance,
    TRes Function(Query$GetJourneyDocs) then,
  ) = _CopyWithImpl$Query$GetJourneyDocs;

  factory CopyWith$Query$GetJourneyDocs.stub(TRes res) =
      _CopyWithStubImpl$Query$GetJourneyDocs;

  TRes call({
    Query$GetJourneyDocs$user? user,
    String? $__typename,
  });
  CopyWith$Query$GetJourneyDocs$user<TRes> get user;
}

class _CopyWithImpl$Query$GetJourneyDocs<TRes>
    implements CopyWith$Query$GetJourneyDocs<TRes> {
  _CopyWithImpl$Query$GetJourneyDocs(
    this._instance,
    this._then,
  );

  final Query$GetJourneyDocs _instance;

  final TRes Function(Query$GetJourneyDocs) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetJourneyDocs(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Query$GetJourneyDocs$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetJourneyDocs$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$GetJourneyDocs$user(local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$GetJourneyDocs<TRes>
    implements CopyWith$Query$GetJourneyDocs<TRes> {
  _CopyWithStubImpl$Query$GetJourneyDocs(this._res);

  TRes _res;

  call({
    Query$GetJourneyDocs$user? user,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetJourneyDocs$user<TRes> get user =>
      CopyWith$Query$GetJourneyDocs$user.stub(_res);
}

const documentNodeQueryGetJourneyDocs = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetJourneyDocs'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'journeyId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'pagination')),
        type: NamedTypeNode(
          name: NameNode(value: 'PaginationInput'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'user'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'journey_docs'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'journeyId'),
                value: VariableNode(name: NameNode(value: 'journeyId')),
              ),
              ArgumentNode(
                name: NameNode(value: 'pagination'),
                value: VariableNode(name: NameNode(value: 'pagination')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'items'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FragmentSpreadNode(
                    name: NameNode(value: 'UserDoc'),
                    directives: [],
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  fragmentDefinitionUserDoc,
  fragmentDefinitionUserDocTemplate,
  fragmentDefinitionUserDocExplanation,
]);
Query$GetJourneyDocs _parserFn$Query$GetJourneyDocs(
        Map<String, dynamic> data) =>
    Query$GetJourneyDocs.fromJson(data);
typedef OnQueryComplete$Query$GetJourneyDocs = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetJourneyDocs?,
);

class Options$Query$GetJourneyDocs
    extends graphql.QueryOptions<Query$GetJourneyDocs> {
  Options$Query$GetJourneyDocs({
    String? operationName,
    required Variables$Query$GetJourneyDocs variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetJourneyDocs? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetJourneyDocs? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$GetJourneyDocs(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetJourneyDocs,
          parserFn: _parserFn$Query$GetJourneyDocs,
        );

  final OnQueryComplete$Query$GetJourneyDocs? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetJourneyDocs
    extends graphql.WatchQueryOptions<Query$GetJourneyDocs> {
  WatchOptions$Query$GetJourneyDocs({
    String? operationName,
    required Variables$Query$GetJourneyDocs variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetJourneyDocs? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryGetJourneyDocs,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetJourneyDocs,
        );
}

class FetchMoreOptions$Query$GetJourneyDocs extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetJourneyDocs({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetJourneyDocs variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetJourneyDocs,
        );
}

extension ClientExtension$Query$GetJourneyDocs on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetJourneyDocs>> query$GetJourneyDocs(
          Options$Query$GetJourneyDocs options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$GetJourneyDocs> watchQuery$GetJourneyDocs(
          WatchOptions$Query$GetJourneyDocs options) =>
      this.watchQuery(options);
  void writeQuery$GetJourneyDocs({
    required Query$GetJourneyDocs data,
    required Variables$Query$GetJourneyDocs variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryGetJourneyDocs),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetJourneyDocs? readQuery$GetJourneyDocs({
    required Variables$Query$GetJourneyDocs variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetJourneyDocs),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetJourneyDocs.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetJourneyDocs> useQuery$GetJourneyDocs(
        Options$Query$GetJourneyDocs options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetJourneyDocs> useWatchQuery$GetJourneyDocs(
        WatchOptions$Query$GetJourneyDocs options) =>
    graphql_flutter.useWatchQuery(options);

class Query$GetJourneyDocs$Widget
    extends graphql_flutter.Query<Query$GetJourneyDocs> {
  Query$GetJourneyDocs$Widget({
    widgets.Key? key,
    required Options$Query$GetJourneyDocs options,
    required graphql_flutter.QueryBuilder<Query$GetJourneyDocs> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$GetJourneyDocs$user {
  Query$GetJourneyDocs$user({
    required this.journey_docs,
    this.$__typename = 'UserQuery',
  });

  factory Query$GetJourneyDocs$user.fromJson(Map<String, dynamic> json) {
    final l$journey_docs = json['journey_docs'];
    final l$$__typename = json['__typename'];
    return Query$GetJourneyDocs$user(
      journey_docs: Query$GetJourneyDocs$user$journey_docs.fromJson(
          (l$journey_docs as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetJourneyDocs$user$journey_docs journey_docs;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$journey_docs = journey_docs;
    _resultData['journey_docs'] = l$journey_docs.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$journey_docs = journey_docs;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$journey_docs,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetJourneyDocs$user ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$journey_docs = journey_docs;
    final lOther$journey_docs = other.journey_docs;
    if (l$journey_docs != lOther$journey_docs) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetJourneyDocs$user
    on Query$GetJourneyDocs$user {
  CopyWith$Query$GetJourneyDocs$user<Query$GetJourneyDocs$user> get copyWith =>
      CopyWith$Query$GetJourneyDocs$user(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetJourneyDocs$user<TRes> {
  factory CopyWith$Query$GetJourneyDocs$user(
    Query$GetJourneyDocs$user instance,
    TRes Function(Query$GetJourneyDocs$user) then,
  ) = _CopyWithImpl$Query$GetJourneyDocs$user;

  factory CopyWith$Query$GetJourneyDocs$user.stub(TRes res) =
      _CopyWithStubImpl$Query$GetJourneyDocs$user;

  TRes call({
    Query$GetJourneyDocs$user$journey_docs? journey_docs,
    String? $__typename,
  });
  CopyWith$Query$GetJourneyDocs$user$journey_docs<TRes> get journey_docs;
}

class _CopyWithImpl$Query$GetJourneyDocs$user<TRes>
    implements CopyWith$Query$GetJourneyDocs$user<TRes> {
  _CopyWithImpl$Query$GetJourneyDocs$user(
    this._instance,
    this._then,
  );

  final Query$GetJourneyDocs$user _instance;

  final TRes Function(Query$GetJourneyDocs$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? journey_docs = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetJourneyDocs$user(
        journey_docs: journey_docs == _undefined || journey_docs == null
            ? _instance.journey_docs
            : (journey_docs as Query$GetJourneyDocs$user$journey_docs),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetJourneyDocs$user$journey_docs<TRes> get journey_docs {
    final local$journey_docs = _instance.journey_docs;
    return CopyWith$Query$GetJourneyDocs$user$journey_docs(
        local$journey_docs, (e) => call(journey_docs: e));
  }
}

class _CopyWithStubImpl$Query$GetJourneyDocs$user<TRes>
    implements CopyWith$Query$GetJourneyDocs$user<TRes> {
  _CopyWithStubImpl$Query$GetJourneyDocs$user(this._res);

  TRes _res;

  call({
    Query$GetJourneyDocs$user$journey_docs? journey_docs,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetJourneyDocs$user$journey_docs<TRes> get journey_docs =>
      CopyWith$Query$GetJourneyDocs$user$journey_docs.stub(_res);
}

class Query$GetJourneyDocs$user$journey_docs {
  Query$GetJourneyDocs$user$journey_docs({
    required this.items,
    this.$__typename = 'UserDocConnection',
  });

  factory Query$GetJourneyDocs$user$journey_docs.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$GetJourneyDocs$user$journey_docs(
      items: (l$items as List<dynamic>)
          .map((e) => Fragment$UserDoc.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$UserDoc> items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$items = items;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$items.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetJourneyDocs$user$journey_docs ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items.length != lOther$items.length) {
      return false;
    }
    for (int i = 0; i < l$items.length; i++) {
      final l$items$entry = l$items[i];
      final lOther$items$entry = lOther$items[i];
      if (l$items$entry != lOther$items$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetJourneyDocs$user$journey_docs
    on Query$GetJourneyDocs$user$journey_docs {
  CopyWith$Query$GetJourneyDocs$user$journey_docs<
          Query$GetJourneyDocs$user$journey_docs>
      get copyWith => CopyWith$Query$GetJourneyDocs$user$journey_docs(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetJourneyDocs$user$journey_docs<TRes> {
  factory CopyWith$Query$GetJourneyDocs$user$journey_docs(
    Query$GetJourneyDocs$user$journey_docs instance,
    TRes Function(Query$GetJourneyDocs$user$journey_docs) then,
  ) = _CopyWithImpl$Query$GetJourneyDocs$user$journey_docs;

  factory CopyWith$Query$GetJourneyDocs$user$journey_docs.stub(TRes res) =
      _CopyWithStubImpl$Query$GetJourneyDocs$user$journey_docs;

  TRes call({
    List<Fragment$UserDoc>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$UserDoc> Function(
              Iterable<CopyWith$Fragment$UserDoc<Fragment$UserDoc>>)
          _fn);
}

class _CopyWithImpl$Query$GetJourneyDocs$user$journey_docs<TRes>
    implements CopyWith$Query$GetJourneyDocs$user$journey_docs<TRes> {
  _CopyWithImpl$Query$GetJourneyDocs$user$journey_docs(
    this._instance,
    this._then,
  );

  final Query$GetJourneyDocs$user$journey_docs _instance;

  final TRes Function(Query$GetJourneyDocs$user$journey_docs) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetJourneyDocs$user$journey_docs(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$UserDoc>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes items(
          Iterable<Fragment$UserDoc> Function(
                  Iterable<CopyWith$Fragment$UserDoc<Fragment$UserDoc>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) => CopyWith$Fragment$UserDoc(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$GetJourneyDocs$user$journey_docs<TRes>
    implements CopyWith$Query$GetJourneyDocs$user$journey_docs<TRes> {
  _CopyWithStubImpl$Query$GetJourneyDocs$user$journey_docs(this._res);

  TRes _res;

  call({
    List<Fragment$UserDoc>? items,
    String? $__typename,
  }) =>
      _res;

  items(_fn) => _res;
}

class Variables$Query$GetUserDoc {
  factory Variables$Query$GetUserDoc({required String id}) =>
      Variables$Query$GetUserDoc._({
        r'id': id,
      });

  Variables$Query$GetUserDoc._(this._$data);

  factory Variables$Query$GetUserDoc.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$GetUserDoc._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$GetUserDoc<Variables$Query$GetUserDoc>
      get copyWith => CopyWith$Variables$Query$GetUserDoc(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetUserDoc ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Query$GetUserDoc<TRes> {
  factory CopyWith$Variables$Query$GetUserDoc(
    Variables$Query$GetUserDoc instance,
    TRes Function(Variables$Query$GetUserDoc) then,
  ) = _CopyWithImpl$Variables$Query$GetUserDoc;

  factory CopyWith$Variables$Query$GetUserDoc.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetUserDoc;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$GetUserDoc<TRes>
    implements CopyWith$Variables$Query$GetUserDoc<TRes> {
  _CopyWithImpl$Variables$Query$GetUserDoc(
    this._instance,
    this._then,
  );

  final Variables$Query$GetUserDoc _instance;

  final TRes Function(Variables$Query$GetUserDoc) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(Variables$Query$GetUserDoc._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetUserDoc<TRes>
    implements CopyWith$Variables$Query$GetUserDoc<TRes> {
  _CopyWithStubImpl$Variables$Query$GetUserDoc(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$GetUserDoc {
  Query$GetUserDoc({
    required this.user,
    this.$__typename = 'Query',
  });

  factory Query$GetUserDoc.fromJson(Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$GetUserDoc(
      user: Query$GetUserDoc$user.fromJson((l$user as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetUserDoc$user user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetUserDoc || runtimeType != other.runtimeType) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetUserDoc on Query$GetUserDoc {
  CopyWith$Query$GetUserDoc<Query$GetUserDoc> get copyWith =>
      CopyWith$Query$GetUserDoc(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetUserDoc<TRes> {
  factory CopyWith$Query$GetUserDoc(
    Query$GetUserDoc instance,
    TRes Function(Query$GetUserDoc) then,
  ) = _CopyWithImpl$Query$GetUserDoc;

  factory CopyWith$Query$GetUserDoc.stub(TRes res) =
      _CopyWithStubImpl$Query$GetUserDoc;

  TRes call({
    Query$GetUserDoc$user? user,
    String? $__typename,
  });
  CopyWith$Query$GetUserDoc$user<TRes> get user;
}

class _CopyWithImpl$Query$GetUserDoc<TRes>
    implements CopyWith$Query$GetUserDoc<TRes> {
  _CopyWithImpl$Query$GetUserDoc(
    this._instance,
    this._then,
  );

  final Query$GetUserDoc _instance;

  final TRes Function(Query$GetUserDoc) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetUserDoc(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Query$GetUserDoc$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetUserDoc$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$GetUserDoc$user(local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$GetUserDoc<TRes>
    implements CopyWith$Query$GetUserDoc<TRes> {
  _CopyWithStubImpl$Query$GetUserDoc(this._res);

  TRes _res;

  call({
    Query$GetUserDoc$user? user,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetUserDoc$user<TRes> get user =>
      CopyWith$Query$GetUserDoc$user.stub(_res);
}

const documentNodeQueryGetUserDoc = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetUserDoc'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'user'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'user_doc'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              )
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'UserDoc'),
                directives: [],
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  fragmentDefinitionUserDoc,
  fragmentDefinitionUserDocTemplate,
  fragmentDefinitionUserDocExplanation,
]);
Query$GetUserDoc _parserFn$Query$GetUserDoc(Map<String, dynamic> data) =>
    Query$GetUserDoc.fromJson(data);
typedef OnQueryComplete$Query$GetUserDoc = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetUserDoc?,
);

class Options$Query$GetUserDoc extends graphql.QueryOptions<Query$GetUserDoc> {
  Options$Query$GetUserDoc({
    String? operationName,
    required Variables$Query$GetUserDoc variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetUserDoc? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetUserDoc? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$GetUserDoc(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetUserDoc,
          parserFn: _parserFn$Query$GetUserDoc,
        );

  final OnQueryComplete$Query$GetUserDoc? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetUserDoc
    extends graphql.WatchQueryOptions<Query$GetUserDoc> {
  WatchOptions$Query$GetUserDoc({
    String? operationName,
    required Variables$Query$GetUserDoc variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetUserDoc? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryGetUserDoc,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetUserDoc,
        );
}

class FetchMoreOptions$Query$GetUserDoc extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetUserDoc({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetUserDoc variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetUserDoc,
        );
}

extension ClientExtension$Query$GetUserDoc on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetUserDoc>> query$GetUserDoc(
          Options$Query$GetUserDoc options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$GetUserDoc> watchQuery$GetUserDoc(
          WatchOptions$Query$GetUserDoc options) =>
      this.watchQuery(options);
  void writeQuery$GetUserDoc({
    required Query$GetUserDoc data,
    required Variables$Query$GetUserDoc variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryGetUserDoc),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetUserDoc? readQuery$GetUserDoc({
    required Variables$Query$GetUserDoc variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetUserDoc),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetUserDoc.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetUserDoc> useQuery$GetUserDoc(
        Options$Query$GetUserDoc options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetUserDoc> useWatchQuery$GetUserDoc(
        WatchOptions$Query$GetUserDoc options) =>
    graphql_flutter.useWatchQuery(options);

class Query$GetUserDoc$Widget extends graphql_flutter.Query<Query$GetUserDoc> {
  Query$GetUserDoc$Widget({
    widgets.Key? key,
    required Options$Query$GetUserDoc options,
    required graphql_flutter.QueryBuilder<Query$GetUserDoc> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$GetUserDoc$user {
  Query$GetUserDoc$user({
    required this.user_doc,
    this.$__typename = 'UserQuery',
  });

  factory Query$GetUserDoc$user.fromJson(Map<String, dynamic> json) {
    final l$user_doc = json['user_doc'];
    final l$$__typename = json['__typename'];
    return Query$GetUserDoc$user(
      user_doc: Fragment$UserDoc.fromJson((l$user_doc as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$UserDoc user_doc;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user_doc = user_doc;
    _resultData['user_doc'] = l$user_doc.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user_doc = user_doc;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user_doc,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetUserDoc$user || runtimeType != other.runtimeType) {
      return false;
    }
    final l$user_doc = user_doc;
    final lOther$user_doc = other.user_doc;
    if (l$user_doc != lOther$user_doc) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetUserDoc$user on Query$GetUserDoc$user {
  CopyWith$Query$GetUserDoc$user<Query$GetUserDoc$user> get copyWith =>
      CopyWith$Query$GetUserDoc$user(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetUserDoc$user<TRes> {
  factory CopyWith$Query$GetUserDoc$user(
    Query$GetUserDoc$user instance,
    TRes Function(Query$GetUserDoc$user) then,
  ) = _CopyWithImpl$Query$GetUserDoc$user;

  factory CopyWith$Query$GetUserDoc$user.stub(TRes res) =
      _CopyWithStubImpl$Query$GetUserDoc$user;

  TRes call({
    Fragment$UserDoc? user_doc,
    String? $__typename,
  });
  CopyWith$Fragment$UserDoc<TRes> get user_doc;
}

class _CopyWithImpl$Query$GetUserDoc$user<TRes>
    implements CopyWith$Query$GetUserDoc$user<TRes> {
  _CopyWithImpl$Query$GetUserDoc$user(
    this._instance,
    this._then,
  );

  final Query$GetUserDoc$user _instance;

  final TRes Function(Query$GetUserDoc$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user_doc = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetUserDoc$user(
        user_doc: user_doc == _undefined || user_doc == null
            ? _instance.user_doc
            : (user_doc as Fragment$UserDoc),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$UserDoc<TRes> get user_doc {
    final local$user_doc = _instance.user_doc;
    return CopyWith$Fragment$UserDoc(local$user_doc, (e) => call(user_doc: e));
  }
}

class _CopyWithStubImpl$Query$GetUserDoc$user<TRes>
    implements CopyWith$Query$GetUserDoc$user<TRes> {
  _CopyWithStubImpl$Query$GetUserDoc$user(this._res);

  TRes _res;

  call({
    Fragment$UserDoc? user_doc,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$UserDoc<TRes> get user_doc =>
      CopyWith$Fragment$UserDoc.stub(_res);
}

class Variables$Query$GetMaterialFeedbacks {
  factory Variables$Query$GetMaterialFeedbacks({required String materialId}) =>
      Variables$Query$GetMaterialFeedbacks._({
        r'materialId': materialId,
      });

  Variables$Query$GetMaterialFeedbacks._(this._$data);

  factory Variables$Query$GetMaterialFeedbacks.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$materialId = data['materialId'];
    result$data['materialId'] = (l$materialId as String);
    return Variables$Query$GetMaterialFeedbacks._(result$data);
  }

  Map<String, dynamic> _$data;

  String get materialId => (_$data['materialId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$materialId = materialId;
    result$data['materialId'] = l$materialId;
    return result$data;
  }

  CopyWith$Variables$Query$GetMaterialFeedbacks<
          Variables$Query$GetMaterialFeedbacks>
      get copyWith => CopyWith$Variables$Query$GetMaterialFeedbacks(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetMaterialFeedbacks ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$materialId = materialId;
    final lOther$materialId = other.materialId;
    if (l$materialId != lOther$materialId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$materialId = materialId;
    return Object.hashAll([l$materialId]);
  }
}

abstract class CopyWith$Variables$Query$GetMaterialFeedbacks<TRes> {
  factory CopyWith$Variables$Query$GetMaterialFeedbacks(
    Variables$Query$GetMaterialFeedbacks instance,
    TRes Function(Variables$Query$GetMaterialFeedbacks) then,
  ) = _CopyWithImpl$Variables$Query$GetMaterialFeedbacks;

  factory CopyWith$Variables$Query$GetMaterialFeedbacks.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetMaterialFeedbacks;

  TRes call({String? materialId});
}

class _CopyWithImpl$Variables$Query$GetMaterialFeedbacks<TRes>
    implements CopyWith$Variables$Query$GetMaterialFeedbacks<TRes> {
  _CopyWithImpl$Variables$Query$GetMaterialFeedbacks(
    this._instance,
    this._then,
  );

  final Variables$Query$GetMaterialFeedbacks _instance;

  final TRes Function(Variables$Query$GetMaterialFeedbacks) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? materialId = _undefined}) =>
      _then(Variables$Query$GetMaterialFeedbacks._({
        ..._instance._$data,
        if (materialId != _undefined && materialId != null)
          'materialId': (materialId as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetMaterialFeedbacks<TRes>
    implements CopyWith$Variables$Query$GetMaterialFeedbacks<TRes> {
  _CopyWithStubImpl$Variables$Query$GetMaterialFeedbacks(this._res);

  TRes _res;

  call({String? materialId}) => _res;
}

class Query$GetMaterialFeedbacks {
  Query$GetMaterialFeedbacks({
    required this.user,
    this.$__typename = 'Query',
  });

  factory Query$GetMaterialFeedbacks.fromJson(Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$GetMaterialFeedbacks(
      user: Query$GetMaterialFeedbacks$user.fromJson(
          (l$user as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetMaterialFeedbacks$user user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetMaterialFeedbacks ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetMaterialFeedbacks
    on Query$GetMaterialFeedbacks {
  CopyWith$Query$GetMaterialFeedbacks<Query$GetMaterialFeedbacks>
      get copyWith => CopyWith$Query$GetMaterialFeedbacks(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetMaterialFeedbacks<TRes> {
  factory CopyWith$Query$GetMaterialFeedbacks(
    Query$GetMaterialFeedbacks instance,
    TRes Function(Query$GetMaterialFeedbacks) then,
  ) = _CopyWithImpl$Query$GetMaterialFeedbacks;

  factory CopyWith$Query$GetMaterialFeedbacks.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMaterialFeedbacks;

  TRes call({
    Query$GetMaterialFeedbacks$user? user,
    String? $__typename,
  });
  CopyWith$Query$GetMaterialFeedbacks$user<TRes> get user;
}

class _CopyWithImpl$Query$GetMaterialFeedbacks<TRes>
    implements CopyWith$Query$GetMaterialFeedbacks<TRes> {
  _CopyWithImpl$Query$GetMaterialFeedbacks(
    this._instance,
    this._then,
  );

  final Query$GetMaterialFeedbacks _instance;

  final TRes Function(Query$GetMaterialFeedbacks) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetMaterialFeedbacks(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Query$GetMaterialFeedbacks$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetMaterialFeedbacks$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$GetMaterialFeedbacks$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$GetMaterialFeedbacks<TRes>
    implements CopyWith$Query$GetMaterialFeedbacks<TRes> {
  _CopyWithStubImpl$Query$GetMaterialFeedbacks(this._res);

  TRes _res;

  call({
    Query$GetMaterialFeedbacks$user? user,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetMaterialFeedbacks$user<TRes> get user =>
      CopyWith$Query$GetMaterialFeedbacks$user.stub(_res);
}

const documentNodeQueryGetMaterialFeedbacks = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetMaterialFeedbacks'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'materialId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'user'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'material_feedbacks'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'materialId'),
                value: VariableNode(name: NameNode(value: 'materialId')),
              )
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'AIFeedback'),
                directives: [],
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  fragmentDefinitionAIFeedback,
  fragmentDefinitionAIFeedbackInterface,
  fragmentDefinitionAIFeedbackPart,
]);
Query$GetMaterialFeedbacks _parserFn$Query$GetMaterialFeedbacks(
        Map<String, dynamic> data) =>
    Query$GetMaterialFeedbacks.fromJson(data);
typedef OnQueryComplete$Query$GetMaterialFeedbacks = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetMaterialFeedbacks?,
);

class Options$Query$GetMaterialFeedbacks
    extends graphql.QueryOptions<Query$GetMaterialFeedbacks> {
  Options$Query$GetMaterialFeedbacks({
    String? operationName,
    required Variables$Query$GetMaterialFeedbacks variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMaterialFeedbacks? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetMaterialFeedbacks? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null
                        ? null
                        : _parserFn$Query$GetMaterialFeedbacks(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetMaterialFeedbacks,
          parserFn: _parserFn$Query$GetMaterialFeedbacks,
        );

  final OnQueryComplete$Query$GetMaterialFeedbacks? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetMaterialFeedbacks
    extends graphql.WatchQueryOptions<Query$GetMaterialFeedbacks> {
  WatchOptions$Query$GetMaterialFeedbacks({
    String? operationName,
    required Variables$Query$GetMaterialFeedbacks variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMaterialFeedbacks? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryGetMaterialFeedbacks,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetMaterialFeedbacks,
        );
}

class FetchMoreOptions$Query$GetMaterialFeedbacks
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetMaterialFeedbacks({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetMaterialFeedbacks variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetMaterialFeedbacks,
        );
}

extension ClientExtension$Query$GetMaterialFeedbacks on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetMaterialFeedbacks>>
      query$GetMaterialFeedbacks(
              Options$Query$GetMaterialFeedbacks options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$GetMaterialFeedbacks>
      watchQuery$GetMaterialFeedbacks(
              WatchOptions$Query$GetMaterialFeedbacks options) =>
          this.watchQuery(options);
  void writeQuery$GetMaterialFeedbacks({
    required Query$GetMaterialFeedbacks data,
    required Variables$Query$GetMaterialFeedbacks variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryGetMaterialFeedbacks),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetMaterialFeedbacks? readQuery$GetMaterialFeedbacks({
    required Variables$Query$GetMaterialFeedbacks variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryGetMaterialFeedbacks),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetMaterialFeedbacks.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetMaterialFeedbacks>
    useQuery$GetMaterialFeedbacks(Options$Query$GetMaterialFeedbacks options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetMaterialFeedbacks>
    useWatchQuery$GetMaterialFeedbacks(
            WatchOptions$Query$GetMaterialFeedbacks options) =>
        graphql_flutter.useWatchQuery(options);

class Query$GetMaterialFeedbacks$Widget
    extends graphql_flutter.Query<Query$GetMaterialFeedbacks> {
  Query$GetMaterialFeedbacks$Widget({
    widgets.Key? key,
    required Options$Query$GetMaterialFeedbacks options,
    required graphql_flutter.QueryBuilder<Query$GetMaterialFeedbacks> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$GetMaterialFeedbacks$user {
  Query$GetMaterialFeedbacks$user({
    required this.material_feedbacks,
    this.$__typename = 'UserQuery',
  });

  factory Query$GetMaterialFeedbacks$user.fromJson(Map<String, dynamic> json) {
    final l$material_feedbacks = json['material_feedbacks'];
    final l$$__typename = json['__typename'];
    return Query$GetMaterialFeedbacks$user(
      material_feedbacks: (l$material_feedbacks as List<dynamic>)
          .map((e) => Fragment$AIFeedback.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$AIFeedback> material_feedbacks;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$material_feedbacks = material_feedbacks;
    _resultData['material_feedbacks'] =
        l$material_feedbacks.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$material_feedbacks = material_feedbacks;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$material_feedbacks.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetMaterialFeedbacks$user ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$material_feedbacks = material_feedbacks;
    final lOther$material_feedbacks = other.material_feedbacks;
    if (l$material_feedbacks.length != lOther$material_feedbacks.length) {
      return false;
    }
    for (int i = 0; i < l$material_feedbacks.length; i++) {
      final l$material_feedbacks$entry = l$material_feedbacks[i];
      final lOther$material_feedbacks$entry = lOther$material_feedbacks[i];
      if (l$material_feedbacks$entry != lOther$material_feedbacks$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetMaterialFeedbacks$user
    on Query$GetMaterialFeedbacks$user {
  CopyWith$Query$GetMaterialFeedbacks$user<Query$GetMaterialFeedbacks$user>
      get copyWith => CopyWith$Query$GetMaterialFeedbacks$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetMaterialFeedbacks$user<TRes> {
  factory CopyWith$Query$GetMaterialFeedbacks$user(
    Query$GetMaterialFeedbacks$user instance,
    TRes Function(Query$GetMaterialFeedbacks$user) then,
  ) = _CopyWithImpl$Query$GetMaterialFeedbacks$user;

  factory CopyWith$Query$GetMaterialFeedbacks$user.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMaterialFeedbacks$user;

  TRes call({
    List<Fragment$AIFeedback>? material_feedbacks,
    String? $__typename,
  });
  TRes material_feedbacks(
      Iterable<Fragment$AIFeedback> Function(
              Iterable<CopyWith$Fragment$AIFeedback<Fragment$AIFeedback>>)
          _fn);
}

class _CopyWithImpl$Query$GetMaterialFeedbacks$user<TRes>
    implements CopyWith$Query$GetMaterialFeedbacks$user<TRes> {
  _CopyWithImpl$Query$GetMaterialFeedbacks$user(
    this._instance,
    this._then,
  );

  final Query$GetMaterialFeedbacks$user _instance;

  final TRes Function(Query$GetMaterialFeedbacks$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? material_feedbacks = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetMaterialFeedbacks$user(
        material_feedbacks:
            material_feedbacks == _undefined || material_feedbacks == null
                ? _instance.material_feedbacks
                : (material_feedbacks as List<Fragment$AIFeedback>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes material_feedbacks(
          Iterable<Fragment$AIFeedback> Function(
                  Iterable<CopyWith$Fragment$AIFeedback<Fragment$AIFeedback>>)
              _fn) =>
      call(
          material_feedbacks: _fn(_instance.material_feedbacks
              .map((e) => CopyWith$Fragment$AIFeedback(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$GetMaterialFeedbacks$user<TRes>
    implements CopyWith$Query$GetMaterialFeedbacks$user<TRes> {
  _CopyWithStubImpl$Query$GetMaterialFeedbacks$user(this._res);

  TRes _res;

  call({
    List<Fragment$AIFeedback>? material_feedbacks,
    String? $__typename,
  }) =>
      _res;

  material_feedbacks(_fn) => _res;
}

class Query$GetModelSets {
  Query$GetModelSets({
    required this.user,
    this.$__typename = 'Query',
  });

  factory Query$GetModelSets.fromJson(Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$GetModelSets(
      user: Query$GetModelSets$user.fromJson((l$user as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetModelSets$user user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetModelSets || runtimeType != other.runtimeType) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetModelSets on Query$GetModelSets {
  CopyWith$Query$GetModelSets<Query$GetModelSets> get copyWith =>
      CopyWith$Query$GetModelSets(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetModelSets<TRes> {
  factory CopyWith$Query$GetModelSets(
    Query$GetModelSets instance,
    TRes Function(Query$GetModelSets) then,
  ) = _CopyWithImpl$Query$GetModelSets;

  factory CopyWith$Query$GetModelSets.stub(TRes res) =
      _CopyWithStubImpl$Query$GetModelSets;

  TRes call({
    Query$GetModelSets$user? user,
    String? $__typename,
  });
  CopyWith$Query$GetModelSets$user<TRes> get user;
}

class _CopyWithImpl$Query$GetModelSets<TRes>
    implements CopyWith$Query$GetModelSets<TRes> {
  _CopyWithImpl$Query$GetModelSets(
    this._instance,
    this._then,
  );

  final Query$GetModelSets _instance;

  final TRes Function(Query$GetModelSets) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetModelSets(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Query$GetModelSets$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetModelSets$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$GetModelSets$user(local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$GetModelSets<TRes>
    implements CopyWith$Query$GetModelSets<TRes> {
  _CopyWithStubImpl$Query$GetModelSets(this._res);

  TRes _res;

  call({
    Query$GetModelSets$user? user,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetModelSets$user<TRes> get user =>
      CopyWith$Query$GetModelSets$user.stub(_res);
}

const documentNodeQueryGetModelSets = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetModelSets'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'user'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'model_sets'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'items'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FragmentSpreadNode(
                    name: NameNode(value: 'ModelSet'),
                    directives: [],
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  fragmentDefinitionModelSet,
]);
Query$GetModelSets _parserFn$Query$GetModelSets(Map<String, dynamic> data) =>
    Query$GetModelSets.fromJson(data);
typedef OnQueryComplete$Query$GetModelSets = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetModelSets?,
);

class Options$Query$GetModelSets
    extends graphql.QueryOptions<Query$GetModelSets> {
  Options$Query$GetModelSets({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetModelSets? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetModelSets? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$GetModelSets(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetModelSets,
          parserFn: _parserFn$Query$GetModelSets,
        );

  final OnQueryComplete$Query$GetModelSets? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetModelSets
    extends graphql.WatchQueryOptions<Query$GetModelSets> {
  WatchOptions$Query$GetModelSets({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetModelSets? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryGetModelSets,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetModelSets,
        );
}

class FetchMoreOptions$Query$GetModelSets extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetModelSets(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryGetModelSets,
        );
}

extension ClientExtension$Query$GetModelSets on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetModelSets>> query$GetModelSets(
          [Options$Query$GetModelSets? options]) async =>
      await this.query(options ?? Options$Query$GetModelSets());
  graphql.ObservableQuery<Query$GetModelSets> watchQuery$GetModelSets(
          [WatchOptions$Query$GetModelSets? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$GetModelSets());
  void writeQuery$GetModelSets({
    required Query$GetModelSets data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation:
                graphql.Operation(document: documentNodeQueryGetModelSets)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetModelSets? readQuery$GetModelSets({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryGetModelSets)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetModelSets.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetModelSets> useQuery$GetModelSets(
        [Options$Query$GetModelSets? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$GetModelSets());
graphql.ObservableQuery<Query$GetModelSets> useWatchQuery$GetModelSets(
        [WatchOptions$Query$GetModelSets? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$GetModelSets());

class Query$GetModelSets$Widget
    extends graphql_flutter.Query<Query$GetModelSets> {
  Query$GetModelSets$Widget({
    widgets.Key? key,
    Options$Query$GetModelSets? options,
    required graphql_flutter.QueryBuilder<Query$GetModelSets> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$GetModelSets(),
          builder: builder,
        );
}

class Query$GetModelSets$user {
  Query$GetModelSets$user({
    required this.model_sets,
    this.$__typename = 'UserQuery',
  });

  factory Query$GetModelSets$user.fromJson(Map<String, dynamic> json) {
    final l$model_sets = json['model_sets'];
    final l$$__typename = json['__typename'];
    return Query$GetModelSets$user(
      model_sets: Query$GetModelSets$user$model_sets.fromJson(
          (l$model_sets as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetModelSets$user$model_sets model_sets;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$model_sets = model_sets;
    _resultData['model_sets'] = l$model_sets.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$model_sets = model_sets;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$model_sets,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetModelSets$user || runtimeType != other.runtimeType) {
      return false;
    }
    final l$model_sets = model_sets;
    final lOther$model_sets = other.model_sets;
    if (l$model_sets != lOther$model_sets) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetModelSets$user on Query$GetModelSets$user {
  CopyWith$Query$GetModelSets$user<Query$GetModelSets$user> get copyWith =>
      CopyWith$Query$GetModelSets$user(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetModelSets$user<TRes> {
  factory CopyWith$Query$GetModelSets$user(
    Query$GetModelSets$user instance,
    TRes Function(Query$GetModelSets$user) then,
  ) = _CopyWithImpl$Query$GetModelSets$user;

  factory CopyWith$Query$GetModelSets$user.stub(TRes res) =
      _CopyWithStubImpl$Query$GetModelSets$user;

  TRes call({
    Query$GetModelSets$user$model_sets? model_sets,
    String? $__typename,
  });
  CopyWith$Query$GetModelSets$user$model_sets<TRes> get model_sets;
}

class _CopyWithImpl$Query$GetModelSets$user<TRes>
    implements CopyWith$Query$GetModelSets$user<TRes> {
  _CopyWithImpl$Query$GetModelSets$user(
    this._instance,
    this._then,
  );

  final Query$GetModelSets$user _instance;

  final TRes Function(Query$GetModelSets$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? model_sets = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetModelSets$user(
        model_sets: model_sets == _undefined || model_sets == null
            ? _instance.model_sets
            : (model_sets as Query$GetModelSets$user$model_sets),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetModelSets$user$model_sets<TRes> get model_sets {
    final local$model_sets = _instance.model_sets;
    return CopyWith$Query$GetModelSets$user$model_sets(
        local$model_sets, (e) => call(model_sets: e));
  }
}

class _CopyWithStubImpl$Query$GetModelSets$user<TRes>
    implements CopyWith$Query$GetModelSets$user<TRes> {
  _CopyWithStubImpl$Query$GetModelSets$user(this._res);

  TRes _res;

  call({
    Query$GetModelSets$user$model_sets? model_sets,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetModelSets$user$model_sets<TRes> get model_sets =>
      CopyWith$Query$GetModelSets$user$model_sets.stub(_res);
}

class Query$GetModelSets$user$model_sets {
  Query$GetModelSets$user$model_sets({
    required this.items,
    this.$__typename = 'ModelSetConnection',
  });

  factory Query$GetModelSets$user$model_sets.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$GetModelSets$user$model_sets(
      items: (l$items as List<dynamic>)
          .map((e) => Fragment$ModelSet.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$ModelSet> items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$items = items;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$items.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetModelSets$user$model_sets ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items.length != lOther$items.length) {
      return false;
    }
    for (int i = 0; i < l$items.length; i++) {
      final l$items$entry = l$items[i];
      final lOther$items$entry = lOther$items[i];
      if (l$items$entry != lOther$items$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetModelSets$user$model_sets
    on Query$GetModelSets$user$model_sets {
  CopyWith$Query$GetModelSets$user$model_sets<
          Query$GetModelSets$user$model_sets>
      get copyWith => CopyWith$Query$GetModelSets$user$model_sets(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetModelSets$user$model_sets<TRes> {
  factory CopyWith$Query$GetModelSets$user$model_sets(
    Query$GetModelSets$user$model_sets instance,
    TRes Function(Query$GetModelSets$user$model_sets) then,
  ) = _CopyWithImpl$Query$GetModelSets$user$model_sets;

  factory CopyWith$Query$GetModelSets$user$model_sets.stub(TRes res) =
      _CopyWithStubImpl$Query$GetModelSets$user$model_sets;

  TRes call({
    List<Fragment$ModelSet>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$ModelSet> Function(
              Iterable<CopyWith$Fragment$ModelSet<Fragment$ModelSet>>)
          _fn);
}

class _CopyWithImpl$Query$GetModelSets$user$model_sets<TRes>
    implements CopyWith$Query$GetModelSets$user$model_sets<TRes> {
  _CopyWithImpl$Query$GetModelSets$user$model_sets(
    this._instance,
    this._then,
  );

  final Query$GetModelSets$user$model_sets _instance;

  final TRes Function(Query$GetModelSets$user$model_sets) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetModelSets$user$model_sets(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$ModelSet>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes items(
          Iterable<Fragment$ModelSet> Function(
                  Iterable<CopyWith$Fragment$ModelSet<Fragment$ModelSet>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) => CopyWith$Fragment$ModelSet(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$GetModelSets$user$model_sets<TRes>
    implements CopyWith$Query$GetModelSets$user$model_sets<TRes> {
  _CopyWithStubImpl$Query$GetModelSets$user$model_sets(this._res);

  TRes _res;

  call({
    List<Fragment$ModelSet>? items,
    String? $__typename,
  }) =>
      _res;

  items(_fn) => _res;
}

class Query$GetSupportedLanguages {
  Query$GetSupportedLanguages({
    required this.user,
    this.$__typename = 'Query',
  });

  factory Query$GetSupportedLanguages.fromJson(Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$GetSupportedLanguages(
      user: Query$GetSupportedLanguages$user.fromJson(
          (l$user as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetSupportedLanguages$user user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetSupportedLanguages ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetSupportedLanguages
    on Query$GetSupportedLanguages {
  CopyWith$Query$GetSupportedLanguages<Query$GetSupportedLanguages>
      get copyWith => CopyWith$Query$GetSupportedLanguages(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetSupportedLanguages<TRes> {
  factory CopyWith$Query$GetSupportedLanguages(
    Query$GetSupportedLanguages instance,
    TRes Function(Query$GetSupportedLanguages) then,
  ) = _CopyWithImpl$Query$GetSupportedLanguages;

  factory CopyWith$Query$GetSupportedLanguages.stub(TRes res) =
      _CopyWithStubImpl$Query$GetSupportedLanguages;

  TRes call({
    Query$GetSupportedLanguages$user? user,
    String? $__typename,
  });
  CopyWith$Query$GetSupportedLanguages$user<TRes> get user;
}

class _CopyWithImpl$Query$GetSupportedLanguages<TRes>
    implements CopyWith$Query$GetSupportedLanguages<TRes> {
  _CopyWithImpl$Query$GetSupportedLanguages(
    this._instance,
    this._then,
  );

  final Query$GetSupportedLanguages _instance;

  final TRes Function(Query$GetSupportedLanguages) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetSupportedLanguages(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Query$GetSupportedLanguages$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetSupportedLanguages$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$GetSupportedLanguages$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$GetSupportedLanguages<TRes>
    implements CopyWith$Query$GetSupportedLanguages<TRes> {
  _CopyWithStubImpl$Query$GetSupportedLanguages(this._res);

  TRes _res;

  call({
    Query$GetSupportedLanguages$user? user,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetSupportedLanguages$user<TRes> get user =>
      CopyWith$Query$GetSupportedLanguages$user.stub(_res);
}

const documentNodeQueryGetSupportedLanguages = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetSupportedLanguages'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'user'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'supported_languages'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'items'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FragmentSpreadNode(
                    name: NameNode(value: 'DetailedSupportedLanguage'),
                    directives: [],
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  fragmentDefinitionDetailedSupportedLanguage,
  fragmentDefinitionSupportedLanguage,
]);
Query$GetSupportedLanguages _parserFn$Query$GetSupportedLanguages(
        Map<String, dynamic> data) =>
    Query$GetSupportedLanguages.fromJson(data);
typedef OnQueryComplete$Query$GetSupportedLanguages = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetSupportedLanguages?,
);

class Options$Query$GetSupportedLanguages
    extends graphql.QueryOptions<Query$GetSupportedLanguages> {
  Options$Query$GetSupportedLanguages({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetSupportedLanguages? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetSupportedLanguages? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null
                        ? null
                        : _parserFn$Query$GetSupportedLanguages(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetSupportedLanguages,
          parserFn: _parserFn$Query$GetSupportedLanguages,
        );

  final OnQueryComplete$Query$GetSupportedLanguages? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetSupportedLanguages
    extends graphql.WatchQueryOptions<Query$GetSupportedLanguages> {
  WatchOptions$Query$GetSupportedLanguages({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetSupportedLanguages? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryGetSupportedLanguages,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetSupportedLanguages,
        );
}

class FetchMoreOptions$Query$GetSupportedLanguages
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetSupportedLanguages(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryGetSupportedLanguages,
        );
}

extension ClientExtension$Query$GetSupportedLanguages on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetSupportedLanguages>>
      query$GetSupportedLanguages(
              [Options$Query$GetSupportedLanguages? options]) async =>
          await this.query(options ?? Options$Query$GetSupportedLanguages());
  graphql.ObservableQuery<
      Query$GetSupportedLanguages> watchQuery$GetSupportedLanguages(
          [WatchOptions$Query$GetSupportedLanguages? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$GetSupportedLanguages());
  void writeQuery$GetSupportedLanguages({
    required Query$GetSupportedLanguages data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(
                document: documentNodeQueryGetSupportedLanguages)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetSupportedLanguages? readQuery$GetSupportedLanguages(
      {bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryGetSupportedLanguages)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetSupportedLanguages.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetSupportedLanguages>
    useQuery$GetSupportedLanguages(
            [Options$Query$GetSupportedLanguages? options]) =>
        graphql_flutter
            .useQuery(options ?? Options$Query$GetSupportedLanguages());
graphql.ObservableQuery<Query$GetSupportedLanguages>
    useWatchQuery$GetSupportedLanguages(
            [WatchOptions$Query$GetSupportedLanguages? options]) =>
        graphql_flutter.useWatchQuery(
            options ?? WatchOptions$Query$GetSupportedLanguages());

class Query$GetSupportedLanguages$Widget
    extends graphql_flutter.Query<Query$GetSupportedLanguages> {
  Query$GetSupportedLanguages$Widget({
    widgets.Key? key,
    Options$Query$GetSupportedLanguages? options,
    required graphql_flutter.QueryBuilder<Query$GetSupportedLanguages> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$GetSupportedLanguages(),
          builder: builder,
        );
}

class Query$GetSupportedLanguages$user {
  Query$GetSupportedLanguages$user({
    required this.supported_languages,
    this.$__typename = 'UserQuery',
  });

  factory Query$GetSupportedLanguages$user.fromJson(Map<String, dynamic> json) {
    final l$supported_languages = json['supported_languages'];
    final l$$__typename = json['__typename'];
    return Query$GetSupportedLanguages$user(
      supported_languages:
          Query$GetSupportedLanguages$user$supported_languages.fromJson(
              (l$supported_languages as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetSupportedLanguages$user$supported_languages
      supported_languages;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$supported_languages = supported_languages;
    _resultData['supported_languages'] = l$supported_languages.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$supported_languages = supported_languages;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$supported_languages,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetSupportedLanguages$user ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$supported_languages = supported_languages;
    final lOther$supported_languages = other.supported_languages;
    if (l$supported_languages != lOther$supported_languages) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetSupportedLanguages$user
    on Query$GetSupportedLanguages$user {
  CopyWith$Query$GetSupportedLanguages$user<Query$GetSupportedLanguages$user>
      get copyWith => CopyWith$Query$GetSupportedLanguages$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetSupportedLanguages$user<TRes> {
  factory CopyWith$Query$GetSupportedLanguages$user(
    Query$GetSupportedLanguages$user instance,
    TRes Function(Query$GetSupportedLanguages$user) then,
  ) = _CopyWithImpl$Query$GetSupportedLanguages$user;

  factory CopyWith$Query$GetSupportedLanguages$user.stub(TRes res) =
      _CopyWithStubImpl$Query$GetSupportedLanguages$user;

  TRes call({
    Query$GetSupportedLanguages$user$supported_languages? supported_languages,
    String? $__typename,
  });
  CopyWith$Query$GetSupportedLanguages$user$supported_languages<TRes>
      get supported_languages;
}

class _CopyWithImpl$Query$GetSupportedLanguages$user<TRes>
    implements CopyWith$Query$GetSupportedLanguages$user<TRes> {
  _CopyWithImpl$Query$GetSupportedLanguages$user(
    this._instance,
    this._then,
  );

  final Query$GetSupportedLanguages$user _instance;

  final TRes Function(Query$GetSupportedLanguages$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? supported_languages = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetSupportedLanguages$user(
        supported_languages:
            supported_languages == _undefined || supported_languages == null
                ? _instance.supported_languages
                : (supported_languages
                    as Query$GetSupportedLanguages$user$supported_languages),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetSupportedLanguages$user$supported_languages<TRes>
      get supported_languages {
    final local$supported_languages = _instance.supported_languages;
    return CopyWith$Query$GetSupportedLanguages$user$supported_languages(
        local$supported_languages, (e) => call(supported_languages: e));
  }
}

class _CopyWithStubImpl$Query$GetSupportedLanguages$user<TRes>
    implements CopyWith$Query$GetSupportedLanguages$user<TRes> {
  _CopyWithStubImpl$Query$GetSupportedLanguages$user(this._res);

  TRes _res;

  call({
    Query$GetSupportedLanguages$user$supported_languages? supported_languages,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetSupportedLanguages$user$supported_languages<TRes>
      get supported_languages =>
          CopyWith$Query$GetSupportedLanguages$user$supported_languages.stub(
              _res);
}

class Query$GetSupportedLanguages$user$supported_languages {
  Query$GetSupportedLanguages$user$supported_languages({
    required this.items,
    this.$__typename = 'SupportedLanguageConnection',
  });

  factory Query$GetSupportedLanguages$user$supported_languages.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$GetSupportedLanguages$user$supported_languages(
      items: (l$items as List<dynamic>)
          .map((e) => Fragment$DetailedSupportedLanguage.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$DetailedSupportedLanguage> items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$items = items;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$items.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetSupportedLanguages$user$supported_languages ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items.length != lOther$items.length) {
      return false;
    }
    for (int i = 0; i < l$items.length; i++) {
      final l$items$entry = l$items[i];
      final lOther$items$entry = lOther$items[i];
      if (l$items$entry != lOther$items$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetSupportedLanguages$user$supported_languages
    on Query$GetSupportedLanguages$user$supported_languages {
  CopyWith$Query$GetSupportedLanguages$user$supported_languages<
          Query$GetSupportedLanguages$user$supported_languages>
      get copyWith =>
          CopyWith$Query$GetSupportedLanguages$user$supported_languages(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetSupportedLanguages$user$supported_languages<
    TRes> {
  factory CopyWith$Query$GetSupportedLanguages$user$supported_languages(
    Query$GetSupportedLanguages$user$supported_languages instance,
    TRes Function(Query$GetSupportedLanguages$user$supported_languages) then,
  ) = _CopyWithImpl$Query$GetSupportedLanguages$user$supported_languages;

  factory CopyWith$Query$GetSupportedLanguages$user$supported_languages.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetSupportedLanguages$user$supported_languages;

  TRes call({
    List<Fragment$DetailedSupportedLanguage>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$DetailedSupportedLanguage> Function(
              Iterable<
                  CopyWith$Fragment$DetailedSupportedLanguage<
                      Fragment$DetailedSupportedLanguage>>)
          _fn);
}

class _CopyWithImpl$Query$GetSupportedLanguages$user$supported_languages<TRes>
    implements
        CopyWith$Query$GetSupportedLanguages$user$supported_languages<TRes> {
  _CopyWithImpl$Query$GetSupportedLanguages$user$supported_languages(
    this._instance,
    this._then,
  );

  final Query$GetSupportedLanguages$user$supported_languages _instance;

  final TRes Function(Query$GetSupportedLanguages$user$supported_languages)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetSupportedLanguages$user$supported_languages(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$DetailedSupportedLanguage>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes items(
          Iterable<Fragment$DetailedSupportedLanguage> Function(
                  Iterable<
                      CopyWith$Fragment$DetailedSupportedLanguage<
                          Fragment$DetailedSupportedLanguage>>)
              _fn) =>
      call(
          items: _fn(_instance.items
              .map((e) => CopyWith$Fragment$DetailedSupportedLanguage(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$GetSupportedLanguages$user$supported_languages<
        TRes>
    implements
        CopyWith$Query$GetSupportedLanguages$user$supported_languages<TRes> {
  _CopyWithStubImpl$Query$GetSupportedLanguages$user$supported_languages(
      this._res);

  TRes _res;

  call({
    List<Fragment$DetailedSupportedLanguage>? items,
    String? $__typename,
  }) =>
      _res;

  items(_fn) => _res;
}

class Query$GetSupportedLocales {
  Query$GetSupportedLocales({
    required this.user,
    this.$__typename = 'Query',
  });

  factory Query$GetSupportedLocales.fromJson(Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$GetSupportedLocales(
      user: Query$GetSupportedLocales$user.fromJson(
          (l$user as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetSupportedLocales$user user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetSupportedLocales ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetSupportedLocales
    on Query$GetSupportedLocales {
  CopyWith$Query$GetSupportedLocales<Query$GetSupportedLocales> get copyWith =>
      CopyWith$Query$GetSupportedLocales(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetSupportedLocales<TRes> {
  factory CopyWith$Query$GetSupportedLocales(
    Query$GetSupportedLocales instance,
    TRes Function(Query$GetSupportedLocales) then,
  ) = _CopyWithImpl$Query$GetSupportedLocales;

  factory CopyWith$Query$GetSupportedLocales.stub(TRes res) =
      _CopyWithStubImpl$Query$GetSupportedLocales;

  TRes call({
    Query$GetSupportedLocales$user? user,
    String? $__typename,
  });
  CopyWith$Query$GetSupportedLocales$user<TRes> get user;
}

class _CopyWithImpl$Query$GetSupportedLocales<TRes>
    implements CopyWith$Query$GetSupportedLocales<TRes> {
  _CopyWithImpl$Query$GetSupportedLocales(
    this._instance,
    this._then,
  );

  final Query$GetSupportedLocales _instance;

  final TRes Function(Query$GetSupportedLocales) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetSupportedLocales(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Query$GetSupportedLocales$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetSupportedLocales$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$GetSupportedLocales$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$GetSupportedLocales<TRes>
    implements CopyWith$Query$GetSupportedLocales<TRes> {
  _CopyWithStubImpl$Query$GetSupportedLocales(this._res);

  TRes _res;

  call({
    Query$GetSupportedLocales$user? user,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetSupportedLocales$user<TRes> get user =>
      CopyWith$Query$GetSupportedLocales$user.stub(_res);
}

const documentNodeQueryGetSupportedLocales = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetSupportedLocales'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'user'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'supported_locales'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'items'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FragmentSpreadNode(
                    name: NameNode(value: 'SupportedLocale'),
                    directives: [],
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  fragmentDefinitionSupportedLocale,
]);
Query$GetSupportedLocales _parserFn$Query$GetSupportedLocales(
        Map<String, dynamic> data) =>
    Query$GetSupportedLocales.fromJson(data);
typedef OnQueryComplete$Query$GetSupportedLocales = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetSupportedLocales?,
);

class Options$Query$GetSupportedLocales
    extends graphql.QueryOptions<Query$GetSupportedLocales> {
  Options$Query$GetSupportedLocales({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetSupportedLocales? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetSupportedLocales? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null
                        ? null
                        : _parserFn$Query$GetSupportedLocales(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetSupportedLocales,
          parserFn: _parserFn$Query$GetSupportedLocales,
        );

  final OnQueryComplete$Query$GetSupportedLocales? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetSupportedLocales
    extends graphql.WatchQueryOptions<Query$GetSupportedLocales> {
  WatchOptions$Query$GetSupportedLocales({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetSupportedLocales? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryGetSupportedLocales,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetSupportedLocales,
        );
}

class FetchMoreOptions$Query$GetSupportedLocales
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetSupportedLocales(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryGetSupportedLocales,
        );
}

extension ClientExtension$Query$GetSupportedLocales on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetSupportedLocales>>
      query$GetSupportedLocales(
              [Options$Query$GetSupportedLocales? options]) async =>
          await this.query(options ?? Options$Query$GetSupportedLocales());
  graphql.ObservableQuery<Query$GetSupportedLocales>
      watchQuery$GetSupportedLocales(
              [WatchOptions$Query$GetSupportedLocales? options]) =>
          this.watchQuery(options ?? WatchOptions$Query$GetSupportedLocales());
  void writeQuery$GetSupportedLocales({
    required Query$GetSupportedLocales data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(
                document: documentNodeQueryGetSupportedLocales)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetSupportedLocales? readQuery$GetSupportedLocales(
      {bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryGetSupportedLocales)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetSupportedLocales.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetSupportedLocales>
    useQuery$GetSupportedLocales(
            [Options$Query$GetSupportedLocales? options]) =>
        graphql_flutter
            .useQuery(options ?? Options$Query$GetSupportedLocales());
graphql.ObservableQuery<Query$GetSupportedLocales>
    useWatchQuery$GetSupportedLocales(
            [WatchOptions$Query$GetSupportedLocales? options]) =>
        graphql_flutter
            .useWatchQuery(options ?? WatchOptions$Query$GetSupportedLocales());

class Query$GetSupportedLocales$Widget
    extends graphql_flutter.Query<Query$GetSupportedLocales> {
  Query$GetSupportedLocales$Widget({
    widgets.Key? key,
    Options$Query$GetSupportedLocales? options,
    required graphql_flutter.QueryBuilder<Query$GetSupportedLocales> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$GetSupportedLocales(),
          builder: builder,
        );
}

class Query$GetSupportedLocales$user {
  Query$GetSupportedLocales$user({
    required this.supported_locales,
    this.$__typename = 'UserQuery',
  });

  factory Query$GetSupportedLocales$user.fromJson(Map<String, dynamic> json) {
    final l$supported_locales = json['supported_locales'];
    final l$$__typename = json['__typename'];
    return Query$GetSupportedLocales$user(
      supported_locales:
          Query$GetSupportedLocales$user$supported_locales.fromJson(
              (l$supported_locales as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetSupportedLocales$user$supported_locales supported_locales;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$supported_locales = supported_locales;
    _resultData['supported_locales'] = l$supported_locales.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$supported_locales = supported_locales;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$supported_locales,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetSupportedLocales$user ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$supported_locales = supported_locales;
    final lOther$supported_locales = other.supported_locales;
    if (l$supported_locales != lOther$supported_locales) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetSupportedLocales$user
    on Query$GetSupportedLocales$user {
  CopyWith$Query$GetSupportedLocales$user<Query$GetSupportedLocales$user>
      get copyWith => CopyWith$Query$GetSupportedLocales$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetSupportedLocales$user<TRes> {
  factory CopyWith$Query$GetSupportedLocales$user(
    Query$GetSupportedLocales$user instance,
    TRes Function(Query$GetSupportedLocales$user) then,
  ) = _CopyWithImpl$Query$GetSupportedLocales$user;

  factory CopyWith$Query$GetSupportedLocales$user.stub(TRes res) =
      _CopyWithStubImpl$Query$GetSupportedLocales$user;

  TRes call({
    Query$GetSupportedLocales$user$supported_locales? supported_locales,
    String? $__typename,
  });
  CopyWith$Query$GetSupportedLocales$user$supported_locales<TRes>
      get supported_locales;
}

class _CopyWithImpl$Query$GetSupportedLocales$user<TRes>
    implements CopyWith$Query$GetSupportedLocales$user<TRes> {
  _CopyWithImpl$Query$GetSupportedLocales$user(
    this._instance,
    this._then,
  );

  final Query$GetSupportedLocales$user _instance;

  final TRes Function(Query$GetSupportedLocales$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? supported_locales = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetSupportedLocales$user(
        supported_locales:
            supported_locales == _undefined || supported_locales == null
                ? _instance.supported_locales
                : (supported_locales
                    as Query$GetSupportedLocales$user$supported_locales),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetSupportedLocales$user$supported_locales<TRes>
      get supported_locales {
    final local$supported_locales = _instance.supported_locales;
    return CopyWith$Query$GetSupportedLocales$user$supported_locales(
        local$supported_locales, (e) => call(supported_locales: e));
  }
}

class _CopyWithStubImpl$Query$GetSupportedLocales$user<TRes>
    implements CopyWith$Query$GetSupportedLocales$user<TRes> {
  _CopyWithStubImpl$Query$GetSupportedLocales$user(this._res);

  TRes _res;

  call({
    Query$GetSupportedLocales$user$supported_locales? supported_locales,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetSupportedLocales$user$supported_locales<TRes>
      get supported_locales =>
          CopyWith$Query$GetSupportedLocales$user$supported_locales.stub(_res);
}

class Query$GetSupportedLocales$user$supported_locales {
  Query$GetSupportedLocales$user$supported_locales({
    required this.items,
    this.$__typename = 'SupportedLocaleConnection',
  });

  factory Query$GetSupportedLocales$user$supported_locales.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$GetSupportedLocales$user$supported_locales(
      items: (l$items as List<dynamic>)
          .map((e) =>
              Fragment$SupportedLocale.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$SupportedLocale> items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$items = items;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$items.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetSupportedLocales$user$supported_locales ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items.length != lOther$items.length) {
      return false;
    }
    for (int i = 0; i < l$items.length; i++) {
      final l$items$entry = l$items[i];
      final lOther$items$entry = lOther$items[i];
      if (l$items$entry != lOther$items$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetSupportedLocales$user$supported_locales
    on Query$GetSupportedLocales$user$supported_locales {
  CopyWith$Query$GetSupportedLocales$user$supported_locales<
          Query$GetSupportedLocales$user$supported_locales>
      get copyWith => CopyWith$Query$GetSupportedLocales$user$supported_locales(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetSupportedLocales$user$supported_locales<TRes> {
  factory CopyWith$Query$GetSupportedLocales$user$supported_locales(
    Query$GetSupportedLocales$user$supported_locales instance,
    TRes Function(Query$GetSupportedLocales$user$supported_locales) then,
  ) = _CopyWithImpl$Query$GetSupportedLocales$user$supported_locales;

  factory CopyWith$Query$GetSupportedLocales$user$supported_locales.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetSupportedLocales$user$supported_locales;

  TRes call({
    List<Fragment$SupportedLocale>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$SupportedLocale> Function(
              Iterable<
                  CopyWith$Fragment$SupportedLocale<Fragment$SupportedLocale>>)
          _fn);
}

class _CopyWithImpl$Query$GetSupportedLocales$user$supported_locales<TRes>
    implements CopyWith$Query$GetSupportedLocales$user$supported_locales<TRes> {
  _CopyWithImpl$Query$GetSupportedLocales$user$supported_locales(
    this._instance,
    this._then,
  );

  final Query$GetSupportedLocales$user$supported_locales _instance;

  final TRes Function(Query$GetSupportedLocales$user$supported_locales) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetSupportedLocales$user$supported_locales(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$SupportedLocale>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes items(
          Iterable<Fragment$SupportedLocale> Function(
                  Iterable<
                      CopyWith$Fragment$SupportedLocale<
                          Fragment$SupportedLocale>>)
              _fn) =>
      call(
          items:
              _fn(_instance.items.map((e) => CopyWith$Fragment$SupportedLocale(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$GetSupportedLocales$user$supported_locales<TRes>
    implements CopyWith$Query$GetSupportedLocales$user$supported_locales<TRes> {
  _CopyWithStubImpl$Query$GetSupportedLocales$user$supported_locales(this._res);

  TRes _res;

  call({
    List<Fragment$SupportedLocale>? items,
    String? $__typename,
  }) =>
      _res;

  items(_fn) => _res;
}
