import '../schema.graphqls.dart';
import 'dart:async';
import 'fragments.gql.dart';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$SetDevice {
  factory Variables$Mutation$SetDevice(
          {required Input$SetDeviceIdInput input}) =>
      Variables$Mutation$SetDevice._({
        r'input': input,
      });

  Variables$Mutation$SetDevice._(this._$data);

  factory Variables$Mutation$SetDevice.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] =
        Input$SetDeviceIdInput.fromJson((l$input as Map<String, dynamic>));
    return Variables$Mutation$SetDevice._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$SetDeviceIdInput get input =>
      (_$data['input'] as Input$SetDeviceIdInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$SetDevice<Variables$Mutation$SetDevice>
      get copyWith => CopyWith$Variables$Mutation$SetDevice(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$SetDevice ||
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

abstract class CopyWith$Variables$Mutation$SetDevice<TRes> {
  factory CopyWith$Variables$Mutation$SetDevice(
    Variables$Mutation$SetDevice instance,
    TRes Function(Variables$Mutation$SetDevice) then,
  ) = _CopyWithImpl$Variables$Mutation$SetDevice;

  factory CopyWith$Variables$Mutation$SetDevice.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$SetDevice;

  TRes call({Input$SetDeviceIdInput? input});
}

class _CopyWithImpl$Variables$Mutation$SetDevice<TRes>
    implements CopyWith$Variables$Mutation$SetDevice<TRes> {
  _CopyWithImpl$Variables$Mutation$SetDevice(
    this._instance,
    this._then,
  );

  final Variables$Mutation$SetDevice _instance;

  final TRes Function(Variables$Mutation$SetDevice) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) =>
      _then(Variables$Mutation$SetDevice._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$SetDeviceIdInput),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$SetDevice<TRes>
    implements CopyWith$Variables$Mutation$SetDevice<TRes> {
  _CopyWithStubImpl$Variables$Mutation$SetDevice(this._res);

  TRes _res;

  call({Input$SetDeviceIdInput? input}) => _res;
}

class Mutation$SetDevice {
  Mutation$SetDevice({
    required this.public,
    this.$__typename = 'Mutation',
  });

  factory Mutation$SetDevice.fromJson(Map<String, dynamic> json) {
    final l$public = json['public'];
    final l$$__typename = json['__typename'];
    return Mutation$SetDevice(
      public: Mutation$SetDevice$public.fromJson(
          (l$public as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$SetDevice$public public;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$public = public;
    _resultData['public'] = l$public.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$public = public;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$public,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$SetDevice || runtimeType != other.runtimeType) {
      return false;
    }
    final l$public = public;
    final lOther$public = other.public;
    if (l$public != lOther$public) {
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

extension UtilityExtension$Mutation$SetDevice on Mutation$SetDevice {
  CopyWith$Mutation$SetDevice<Mutation$SetDevice> get copyWith =>
      CopyWith$Mutation$SetDevice(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$SetDevice<TRes> {
  factory CopyWith$Mutation$SetDevice(
    Mutation$SetDevice instance,
    TRes Function(Mutation$SetDevice) then,
  ) = _CopyWithImpl$Mutation$SetDevice;

  factory CopyWith$Mutation$SetDevice.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SetDevice;

  TRes call({
    Mutation$SetDevice$public? public,
    String? $__typename,
  });
  CopyWith$Mutation$SetDevice$public<TRes> get public;
}

class _CopyWithImpl$Mutation$SetDevice<TRes>
    implements CopyWith$Mutation$SetDevice<TRes> {
  _CopyWithImpl$Mutation$SetDevice(
    this._instance,
    this._then,
  );

  final Mutation$SetDevice _instance;

  final TRes Function(Mutation$SetDevice) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? public = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SetDevice(
        public: public == _undefined || public == null
            ? _instance.public
            : (public as Mutation$SetDevice$public),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SetDevice$public<TRes> get public {
    final local$public = _instance.public;
    return CopyWith$Mutation$SetDevice$public(
        local$public, (e) => call(public: e));
  }
}

class _CopyWithStubImpl$Mutation$SetDevice<TRes>
    implements CopyWith$Mutation$SetDevice<TRes> {
  _CopyWithStubImpl$Mutation$SetDevice(this._res);

  TRes _res;

  call({
    Mutation$SetDevice$public? public,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SetDevice$public<TRes> get public =>
      CopyWith$Mutation$SetDevice$public.stub(_res);
}

const documentNodeMutationSetDevice = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'SetDevice'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'SetDeviceIdInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'public'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'set_device_id'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'input'),
                value: VariableNode(name: NameNode(value: 'input')),
              )
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
Mutation$SetDevice _parserFn$Mutation$SetDevice(Map<String, dynamic> data) =>
    Mutation$SetDevice.fromJson(data);
typedef OnMutationCompleted$Mutation$SetDevice = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$SetDevice?,
);

class Options$Mutation$SetDevice
    extends graphql.MutationOptions<Mutation$SetDevice> {
  Options$Mutation$SetDevice({
    String? operationName,
    required Variables$Mutation$SetDevice variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SetDevice? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SetDevice? onCompleted,
    graphql.OnMutationUpdate<Mutation$SetDevice>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$SetDevice(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSetDevice,
          parserFn: _parserFn$Mutation$SetDevice,
        );

  final OnMutationCompleted$Mutation$SetDevice? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$SetDevice
    extends graphql.WatchQueryOptions<Mutation$SetDevice> {
  WatchOptions$Mutation$SetDevice({
    String? operationName,
    required Variables$Mutation$SetDevice variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SetDevice? typedOptimisticResult,
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
          document: documentNodeMutationSetDevice,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$SetDevice,
        );
}

extension ClientExtension$Mutation$SetDevice on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$SetDevice>> mutate$SetDevice(
          Options$Mutation$SetDevice options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$SetDevice> watchMutation$SetDevice(
          WatchOptions$Mutation$SetDevice options) =>
      this.watchMutation(options);
}

class Mutation$SetDevice$HookResult {
  Mutation$SetDevice$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$SetDevice runMutation;

  final graphql.QueryResult<Mutation$SetDevice> result;
}

Mutation$SetDevice$HookResult useMutation$SetDevice(
    [WidgetOptions$Mutation$SetDevice? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$SetDevice());
  return Mutation$SetDevice$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$SetDevice> useWatchMutation$SetDevice(
        WatchOptions$Mutation$SetDevice options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$SetDevice
    extends graphql.MutationOptions<Mutation$SetDevice> {
  WidgetOptions$Mutation$SetDevice({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SetDevice? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SetDevice? onCompleted,
    graphql.OnMutationUpdate<Mutation$SetDevice>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$SetDevice(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSetDevice,
          parserFn: _parserFn$Mutation$SetDevice,
        );

  final OnMutationCompleted$Mutation$SetDevice? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$SetDevice
    = graphql.MultiSourceResult<Mutation$SetDevice> Function(
  Variables$Mutation$SetDevice, {
  Object? optimisticResult,
  Mutation$SetDevice? typedOptimisticResult,
});
typedef Builder$Mutation$SetDevice = widgets.Widget Function(
  RunMutation$Mutation$SetDevice,
  graphql.QueryResult<Mutation$SetDevice>?,
);

class Mutation$SetDevice$Widget
    extends graphql_flutter.Mutation<Mutation$SetDevice> {
  Mutation$SetDevice$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$SetDevice? options,
    required Builder$Mutation$SetDevice builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$SetDevice(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$SetDevice$public {
  Mutation$SetDevice$public({
    required this.set_device_id,
    this.$__typename = 'PublicMutation',
  });

  factory Mutation$SetDevice$public.fromJson(Map<String, dynamic> json) {
    final l$set_device_id = json['set_device_id'];
    final l$$__typename = json['__typename'];
    return Mutation$SetDevice$public(
      set_device_id: (l$set_device_id as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String set_device_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$set_device_id = set_device_id;
    _resultData['set_device_id'] = l$set_device_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$set_device_id = set_device_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$set_device_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$SetDevice$public ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$set_device_id = set_device_id;
    final lOther$set_device_id = other.set_device_id;
    if (l$set_device_id != lOther$set_device_id) {
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

extension UtilityExtension$Mutation$SetDevice$public
    on Mutation$SetDevice$public {
  CopyWith$Mutation$SetDevice$public<Mutation$SetDevice$public> get copyWith =>
      CopyWith$Mutation$SetDevice$public(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$SetDevice$public<TRes> {
  factory CopyWith$Mutation$SetDevice$public(
    Mutation$SetDevice$public instance,
    TRes Function(Mutation$SetDevice$public) then,
  ) = _CopyWithImpl$Mutation$SetDevice$public;

  factory CopyWith$Mutation$SetDevice$public.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SetDevice$public;

  TRes call({
    String? set_device_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$SetDevice$public<TRes>
    implements CopyWith$Mutation$SetDevice$public<TRes> {
  _CopyWithImpl$Mutation$SetDevice$public(
    this._instance,
    this._then,
  );

  final Mutation$SetDevice$public _instance;

  final TRes Function(Mutation$SetDevice$public) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? set_device_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SetDevice$public(
        set_device_id: set_device_id == _undefined || set_device_id == null
            ? _instance.set_device_id
            : (set_device_id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$SetDevice$public<TRes>
    implements CopyWith$Mutation$SetDevice$public<TRes> {
  _CopyWithStubImpl$Mutation$SetDevice$public(this._res);

  TRes _res;

  call({
    String? set_device_id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$SetDeviceToken {
  factory Variables$Mutation$SetDeviceToken({
    required String id,
    required Input$SetFcmTokenInput input,
  }) =>
      Variables$Mutation$SetDeviceToken._({
        r'id': id,
        r'input': input,
      });

  Variables$Mutation$SetDeviceToken._(this._$data);

  factory Variables$Mutation$SetDeviceToken.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$input = data['input'];
    result$data['input'] =
        Input$SetFcmTokenInput.fromJson((l$input as Map<String, dynamic>));
    return Variables$Mutation$SetDeviceToken._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Input$SetFcmTokenInput get input =>
      (_$data['input'] as Input$SetFcmTokenInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$SetDeviceToken<Variables$Mutation$SetDeviceToken>
      get copyWith => CopyWith$Variables$Mutation$SetDeviceToken(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$SetDeviceToken ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
    final l$id = id;
    final l$input = input;
    return Object.hashAll([
      l$id,
      l$input,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$SetDeviceToken<TRes> {
  factory CopyWith$Variables$Mutation$SetDeviceToken(
    Variables$Mutation$SetDeviceToken instance,
    TRes Function(Variables$Mutation$SetDeviceToken) then,
  ) = _CopyWithImpl$Variables$Mutation$SetDeviceToken;

  factory CopyWith$Variables$Mutation$SetDeviceToken.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$SetDeviceToken;

  TRes call({
    String? id,
    Input$SetFcmTokenInput? input,
  });
}

class _CopyWithImpl$Variables$Mutation$SetDeviceToken<TRes>
    implements CopyWith$Variables$Mutation$SetDeviceToken<TRes> {
  _CopyWithImpl$Variables$Mutation$SetDeviceToken(
    this._instance,
    this._then,
  );

  final Variables$Mutation$SetDeviceToken _instance;

  final TRes Function(Variables$Mutation$SetDeviceToken) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? input = _undefined,
  }) =>
      _then(Variables$Mutation$SetDeviceToken._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
        if (input != _undefined && input != null)
          'input': (input as Input$SetFcmTokenInput),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$SetDeviceToken<TRes>
    implements CopyWith$Variables$Mutation$SetDeviceToken<TRes> {
  _CopyWithStubImpl$Variables$Mutation$SetDeviceToken(this._res);

  TRes _res;

  call({
    String? id,
    Input$SetFcmTokenInput? input,
  }) =>
      _res;
}

class Mutation$SetDeviceToken {
  Mutation$SetDeviceToken({
    required this.public,
    this.$__typename = 'Mutation',
  });

  factory Mutation$SetDeviceToken.fromJson(Map<String, dynamic> json) {
    final l$public = json['public'];
    final l$$__typename = json['__typename'];
    return Mutation$SetDeviceToken(
      public: Mutation$SetDeviceToken$public.fromJson(
          (l$public as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$SetDeviceToken$public public;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$public = public;
    _resultData['public'] = l$public.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$public = public;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$public,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$SetDeviceToken || runtimeType != other.runtimeType) {
      return false;
    }
    final l$public = public;
    final lOther$public = other.public;
    if (l$public != lOther$public) {
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

extension UtilityExtension$Mutation$SetDeviceToken on Mutation$SetDeviceToken {
  CopyWith$Mutation$SetDeviceToken<Mutation$SetDeviceToken> get copyWith =>
      CopyWith$Mutation$SetDeviceToken(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$SetDeviceToken<TRes> {
  factory CopyWith$Mutation$SetDeviceToken(
    Mutation$SetDeviceToken instance,
    TRes Function(Mutation$SetDeviceToken) then,
  ) = _CopyWithImpl$Mutation$SetDeviceToken;

  factory CopyWith$Mutation$SetDeviceToken.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SetDeviceToken;

  TRes call({
    Mutation$SetDeviceToken$public? public,
    String? $__typename,
  });
  CopyWith$Mutation$SetDeviceToken$public<TRes> get public;
}

class _CopyWithImpl$Mutation$SetDeviceToken<TRes>
    implements CopyWith$Mutation$SetDeviceToken<TRes> {
  _CopyWithImpl$Mutation$SetDeviceToken(
    this._instance,
    this._then,
  );

  final Mutation$SetDeviceToken _instance;

  final TRes Function(Mutation$SetDeviceToken) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? public = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SetDeviceToken(
        public: public == _undefined || public == null
            ? _instance.public
            : (public as Mutation$SetDeviceToken$public),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SetDeviceToken$public<TRes> get public {
    final local$public = _instance.public;
    return CopyWith$Mutation$SetDeviceToken$public(
        local$public, (e) => call(public: e));
  }
}

class _CopyWithStubImpl$Mutation$SetDeviceToken<TRes>
    implements CopyWith$Mutation$SetDeviceToken<TRes> {
  _CopyWithStubImpl$Mutation$SetDeviceToken(this._res);

  TRes _res;

  call({
    Mutation$SetDeviceToken$public? public,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SetDeviceToken$public<TRes> get public =>
      CopyWith$Mutation$SetDeviceToken$public.stub(_res);
}

const documentNodeMutationSetDeviceToken = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'SetDeviceToken'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'SetFcmTokenInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'public'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'set_fcm_token'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              ),
              ArgumentNode(
                name: NameNode(value: 'input'),
                value: VariableNode(name: NameNode(value: 'input')),
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
Mutation$SetDeviceToken _parserFn$Mutation$SetDeviceToken(
        Map<String, dynamic> data) =>
    Mutation$SetDeviceToken.fromJson(data);
typedef OnMutationCompleted$Mutation$SetDeviceToken = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$SetDeviceToken?,
);

class Options$Mutation$SetDeviceToken
    extends graphql.MutationOptions<Mutation$SetDeviceToken> {
  Options$Mutation$SetDeviceToken({
    String? operationName,
    required Variables$Mutation$SetDeviceToken variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SetDeviceToken? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SetDeviceToken? onCompleted,
    graphql.OnMutationUpdate<Mutation$SetDeviceToken>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$SetDeviceToken(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSetDeviceToken,
          parserFn: _parserFn$Mutation$SetDeviceToken,
        );

  final OnMutationCompleted$Mutation$SetDeviceToken? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$SetDeviceToken
    extends graphql.WatchQueryOptions<Mutation$SetDeviceToken> {
  WatchOptions$Mutation$SetDeviceToken({
    String? operationName,
    required Variables$Mutation$SetDeviceToken variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SetDeviceToken? typedOptimisticResult,
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
          document: documentNodeMutationSetDeviceToken,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$SetDeviceToken,
        );
}

extension ClientExtension$Mutation$SetDeviceToken on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$SetDeviceToken>> mutate$SetDeviceToken(
          Options$Mutation$SetDeviceToken options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$SetDeviceToken> watchMutation$SetDeviceToken(
          WatchOptions$Mutation$SetDeviceToken options) =>
      this.watchMutation(options);
}

class Mutation$SetDeviceToken$HookResult {
  Mutation$SetDeviceToken$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$SetDeviceToken runMutation;

  final graphql.QueryResult<Mutation$SetDeviceToken> result;
}

Mutation$SetDeviceToken$HookResult useMutation$SetDeviceToken(
    [WidgetOptions$Mutation$SetDeviceToken? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$SetDeviceToken());
  return Mutation$SetDeviceToken$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$SetDeviceToken>
    useWatchMutation$SetDeviceToken(
            WatchOptions$Mutation$SetDeviceToken options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$SetDeviceToken
    extends graphql.MutationOptions<Mutation$SetDeviceToken> {
  WidgetOptions$Mutation$SetDeviceToken({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SetDeviceToken? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SetDeviceToken? onCompleted,
    graphql.OnMutationUpdate<Mutation$SetDeviceToken>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$SetDeviceToken(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSetDeviceToken,
          parserFn: _parserFn$Mutation$SetDeviceToken,
        );

  final OnMutationCompleted$Mutation$SetDeviceToken? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$SetDeviceToken
    = graphql.MultiSourceResult<Mutation$SetDeviceToken> Function(
  Variables$Mutation$SetDeviceToken, {
  Object? optimisticResult,
  Mutation$SetDeviceToken? typedOptimisticResult,
});
typedef Builder$Mutation$SetDeviceToken = widgets.Widget Function(
  RunMutation$Mutation$SetDeviceToken,
  graphql.QueryResult<Mutation$SetDeviceToken>?,
);

class Mutation$SetDeviceToken$Widget
    extends graphql_flutter.Mutation<Mutation$SetDeviceToken> {
  Mutation$SetDeviceToken$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$SetDeviceToken? options,
    required Builder$Mutation$SetDeviceToken builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$SetDeviceToken(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$SetDeviceToken$public {
  Mutation$SetDeviceToken$public({
    required this.set_fcm_token,
    this.$__typename = 'PublicMutation',
  });

  factory Mutation$SetDeviceToken$public.fromJson(Map<String, dynamic> json) {
    final l$set_fcm_token = json['set_fcm_token'];
    final l$$__typename = json['__typename'];
    return Mutation$SetDeviceToken$public(
      set_fcm_token: (l$set_fcm_token as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool set_fcm_token;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$set_fcm_token = set_fcm_token;
    _resultData['set_fcm_token'] = l$set_fcm_token;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$set_fcm_token = set_fcm_token;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$set_fcm_token,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$SetDeviceToken$public ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$set_fcm_token = set_fcm_token;
    final lOther$set_fcm_token = other.set_fcm_token;
    if (l$set_fcm_token != lOther$set_fcm_token) {
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

extension UtilityExtension$Mutation$SetDeviceToken$public
    on Mutation$SetDeviceToken$public {
  CopyWith$Mutation$SetDeviceToken$public<Mutation$SetDeviceToken$public>
      get copyWith => CopyWith$Mutation$SetDeviceToken$public(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SetDeviceToken$public<TRes> {
  factory CopyWith$Mutation$SetDeviceToken$public(
    Mutation$SetDeviceToken$public instance,
    TRes Function(Mutation$SetDeviceToken$public) then,
  ) = _CopyWithImpl$Mutation$SetDeviceToken$public;

  factory CopyWith$Mutation$SetDeviceToken$public.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SetDeviceToken$public;

  TRes call({
    bool? set_fcm_token,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$SetDeviceToken$public<TRes>
    implements CopyWith$Mutation$SetDeviceToken$public<TRes> {
  _CopyWithImpl$Mutation$SetDeviceToken$public(
    this._instance,
    this._then,
  );

  final Mutation$SetDeviceToken$public _instance;

  final TRes Function(Mutation$SetDeviceToken$public) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? set_fcm_token = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SetDeviceToken$public(
        set_fcm_token: set_fcm_token == _undefined || set_fcm_token == null
            ? _instance.set_fcm_token
            : (set_fcm_token as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$SetDeviceToken$public<TRes>
    implements CopyWith$Mutation$SetDeviceToken$public<TRes> {
  _CopyWithStubImpl$Mutation$SetDeviceToken$public(this._res);

  TRes _res;

  call({
    bool? set_fcm_token,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$SetForwardedFrom {
  factory Variables$Mutation$SetForwardedFrom({
    required String id,
    required Input$SetForwardedFromInput input,
  }) =>
      Variables$Mutation$SetForwardedFrom._({
        r'id': id,
        r'input': input,
      });

  Variables$Mutation$SetForwardedFrom._(this._$data);

  factory Variables$Mutation$SetForwardedFrom.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$input = data['input'];
    result$data['input'] =
        Input$SetForwardedFromInput.fromJson((l$input as Map<String, dynamic>));
    return Variables$Mutation$SetForwardedFrom._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Input$SetForwardedFromInput get input =>
      (_$data['input'] as Input$SetForwardedFromInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$SetForwardedFrom<
          Variables$Mutation$SetForwardedFrom>
      get copyWith => CopyWith$Variables$Mutation$SetForwardedFrom(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$SetForwardedFrom ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
    final l$id = id;
    final l$input = input;
    return Object.hashAll([
      l$id,
      l$input,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$SetForwardedFrom<TRes> {
  factory CopyWith$Variables$Mutation$SetForwardedFrom(
    Variables$Mutation$SetForwardedFrom instance,
    TRes Function(Variables$Mutation$SetForwardedFrom) then,
  ) = _CopyWithImpl$Variables$Mutation$SetForwardedFrom;

  factory CopyWith$Variables$Mutation$SetForwardedFrom.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$SetForwardedFrom;

  TRes call({
    String? id,
    Input$SetForwardedFromInput? input,
  });
}

class _CopyWithImpl$Variables$Mutation$SetForwardedFrom<TRes>
    implements CopyWith$Variables$Mutation$SetForwardedFrom<TRes> {
  _CopyWithImpl$Variables$Mutation$SetForwardedFrom(
    this._instance,
    this._then,
  );

  final Variables$Mutation$SetForwardedFrom _instance;

  final TRes Function(Variables$Mutation$SetForwardedFrom) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? input = _undefined,
  }) =>
      _then(Variables$Mutation$SetForwardedFrom._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
        if (input != _undefined && input != null)
          'input': (input as Input$SetForwardedFromInput),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$SetForwardedFrom<TRes>
    implements CopyWith$Variables$Mutation$SetForwardedFrom<TRes> {
  _CopyWithStubImpl$Variables$Mutation$SetForwardedFrom(this._res);

  TRes _res;

  call({
    String? id,
    Input$SetForwardedFromInput? input,
  }) =>
      _res;
}

class Mutation$SetForwardedFrom {
  Mutation$SetForwardedFrom({
    required this.public,
    this.$__typename = 'Mutation',
  });

  factory Mutation$SetForwardedFrom.fromJson(Map<String, dynamic> json) {
    final l$public = json['public'];
    final l$$__typename = json['__typename'];
    return Mutation$SetForwardedFrom(
      public: Mutation$SetForwardedFrom$public.fromJson(
          (l$public as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$SetForwardedFrom$public public;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$public = public;
    _resultData['public'] = l$public.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$public = public;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$public,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$SetForwardedFrom ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$public = public;
    final lOther$public = other.public;
    if (l$public != lOther$public) {
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

extension UtilityExtension$Mutation$SetForwardedFrom
    on Mutation$SetForwardedFrom {
  CopyWith$Mutation$SetForwardedFrom<Mutation$SetForwardedFrom> get copyWith =>
      CopyWith$Mutation$SetForwardedFrom(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$SetForwardedFrom<TRes> {
  factory CopyWith$Mutation$SetForwardedFrom(
    Mutation$SetForwardedFrom instance,
    TRes Function(Mutation$SetForwardedFrom) then,
  ) = _CopyWithImpl$Mutation$SetForwardedFrom;

  factory CopyWith$Mutation$SetForwardedFrom.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SetForwardedFrom;

  TRes call({
    Mutation$SetForwardedFrom$public? public,
    String? $__typename,
  });
  CopyWith$Mutation$SetForwardedFrom$public<TRes> get public;
}

class _CopyWithImpl$Mutation$SetForwardedFrom<TRes>
    implements CopyWith$Mutation$SetForwardedFrom<TRes> {
  _CopyWithImpl$Mutation$SetForwardedFrom(
    this._instance,
    this._then,
  );

  final Mutation$SetForwardedFrom _instance;

  final TRes Function(Mutation$SetForwardedFrom) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? public = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SetForwardedFrom(
        public: public == _undefined || public == null
            ? _instance.public
            : (public as Mutation$SetForwardedFrom$public),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SetForwardedFrom$public<TRes> get public {
    final local$public = _instance.public;
    return CopyWith$Mutation$SetForwardedFrom$public(
        local$public, (e) => call(public: e));
  }
}

class _CopyWithStubImpl$Mutation$SetForwardedFrom<TRes>
    implements CopyWith$Mutation$SetForwardedFrom<TRes> {
  _CopyWithStubImpl$Mutation$SetForwardedFrom(this._res);

  TRes _res;

  call({
    Mutation$SetForwardedFrom$public? public,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SetForwardedFrom$public<TRes> get public =>
      CopyWith$Mutation$SetForwardedFrom$public.stub(_res);
}

const documentNodeMutationSetForwardedFrom = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'SetForwardedFrom'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'SetForwardedFromInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'public'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'set_forwarded_from'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              ),
              ArgumentNode(
                name: NameNode(value: 'input'),
                value: VariableNode(name: NameNode(value: 'input')),
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
Mutation$SetForwardedFrom _parserFn$Mutation$SetForwardedFrom(
        Map<String, dynamic> data) =>
    Mutation$SetForwardedFrom.fromJson(data);
typedef OnMutationCompleted$Mutation$SetForwardedFrom = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$SetForwardedFrom?,
);

class Options$Mutation$SetForwardedFrom
    extends graphql.MutationOptions<Mutation$SetForwardedFrom> {
  Options$Mutation$SetForwardedFrom({
    String? operationName,
    required Variables$Mutation$SetForwardedFrom variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SetForwardedFrom? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SetForwardedFrom? onCompleted,
    graphql.OnMutationUpdate<Mutation$SetForwardedFrom>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$SetForwardedFrom(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSetForwardedFrom,
          parserFn: _parserFn$Mutation$SetForwardedFrom,
        );

  final OnMutationCompleted$Mutation$SetForwardedFrom? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$SetForwardedFrom
    extends graphql.WatchQueryOptions<Mutation$SetForwardedFrom> {
  WatchOptions$Mutation$SetForwardedFrom({
    String? operationName,
    required Variables$Mutation$SetForwardedFrom variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SetForwardedFrom? typedOptimisticResult,
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
          document: documentNodeMutationSetForwardedFrom,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$SetForwardedFrom,
        );
}

extension ClientExtension$Mutation$SetForwardedFrom on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$SetForwardedFrom>>
      mutate$SetForwardedFrom(
              Options$Mutation$SetForwardedFrom options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$SetForwardedFrom>
      watchMutation$SetForwardedFrom(
              WatchOptions$Mutation$SetForwardedFrom options) =>
          this.watchMutation(options);
}

class Mutation$SetForwardedFrom$HookResult {
  Mutation$SetForwardedFrom$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$SetForwardedFrom runMutation;

  final graphql.QueryResult<Mutation$SetForwardedFrom> result;
}

Mutation$SetForwardedFrom$HookResult useMutation$SetForwardedFrom(
    [WidgetOptions$Mutation$SetForwardedFrom? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$SetForwardedFrom());
  return Mutation$SetForwardedFrom$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$SetForwardedFrom>
    useWatchMutation$SetForwardedFrom(
            WatchOptions$Mutation$SetForwardedFrom options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$SetForwardedFrom
    extends graphql.MutationOptions<Mutation$SetForwardedFrom> {
  WidgetOptions$Mutation$SetForwardedFrom({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SetForwardedFrom? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SetForwardedFrom? onCompleted,
    graphql.OnMutationUpdate<Mutation$SetForwardedFrom>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$SetForwardedFrom(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSetForwardedFrom,
          parserFn: _parserFn$Mutation$SetForwardedFrom,
        );

  final OnMutationCompleted$Mutation$SetForwardedFrom? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$SetForwardedFrom
    = graphql.MultiSourceResult<Mutation$SetForwardedFrom> Function(
  Variables$Mutation$SetForwardedFrom, {
  Object? optimisticResult,
  Mutation$SetForwardedFrom? typedOptimisticResult,
});
typedef Builder$Mutation$SetForwardedFrom = widgets.Widget Function(
  RunMutation$Mutation$SetForwardedFrom,
  graphql.QueryResult<Mutation$SetForwardedFrom>?,
);

class Mutation$SetForwardedFrom$Widget
    extends graphql_flutter.Mutation<Mutation$SetForwardedFrom> {
  Mutation$SetForwardedFrom$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$SetForwardedFrom? options,
    required Builder$Mutation$SetForwardedFrom builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$SetForwardedFrom(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$SetForwardedFrom$public {
  Mutation$SetForwardedFrom$public({
    required this.set_forwarded_from,
    this.$__typename = 'PublicMutation',
  });

  factory Mutation$SetForwardedFrom$public.fromJson(Map<String, dynamic> json) {
    final l$set_forwarded_from = json['set_forwarded_from'];
    final l$$__typename = json['__typename'];
    return Mutation$SetForwardedFrom$public(
      set_forwarded_from: (l$set_forwarded_from as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool set_forwarded_from;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$set_forwarded_from = set_forwarded_from;
    _resultData['set_forwarded_from'] = l$set_forwarded_from;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$set_forwarded_from = set_forwarded_from;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$set_forwarded_from,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$SetForwardedFrom$public ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$set_forwarded_from = set_forwarded_from;
    final lOther$set_forwarded_from = other.set_forwarded_from;
    if (l$set_forwarded_from != lOther$set_forwarded_from) {
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

extension UtilityExtension$Mutation$SetForwardedFrom$public
    on Mutation$SetForwardedFrom$public {
  CopyWith$Mutation$SetForwardedFrom$public<Mutation$SetForwardedFrom$public>
      get copyWith => CopyWith$Mutation$SetForwardedFrom$public(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SetForwardedFrom$public<TRes> {
  factory CopyWith$Mutation$SetForwardedFrom$public(
    Mutation$SetForwardedFrom$public instance,
    TRes Function(Mutation$SetForwardedFrom$public) then,
  ) = _CopyWithImpl$Mutation$SetForwardedFrom$public;

  factory CopyWith$Mutation$SetForwardedFrom$public.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SetForwardedFrom$public;

  TRes call({
    bool? set_forwarded_from,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$SetForwardedFrom$public<TRes>
    implements CopyWith$Mutation$SetForwardedFrom$public<TRes> {
  _CopyWithImpl$Mutation$SetForwardedFrom$public(
    this._instance,
    this._then,
  );

  final Mutation$SetForwardedFrom$public _instance;

  final TRes Function(Mutation$SetForwardedFrom$public) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? set_forwarded_from = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SetForwardedFrom$public(
        set_forwarded_from:
            set_forwarded_from == _undefined || set_forwarded_from == null
                ? _instance.set_forwarded_from
                : (set_forwarded_from as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$SetForwardedFrom$public<TRes>
    implements CopyWith$Mutation$SetForwardedFrom$public<TRes> {
  _CopyWithStubImpl$Mutation$SetForwardedFrom$public(this._res);

  TRes _res;

  call({
    bool? set_forwarded_from,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$login_email {
  factory Variables$Mutation$login_email(
          {required Input$LoginEmailRequest input}) =>
      Variables$Mutation$login_email._({
        r'input': input,
      });

  Variables$Mutation$login_email._(this._$data);

  factory Variables$Mutation$login_email.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] =
        Input$LoginEmailRequest.fromJson((l$input as Map<String, dynamic>));
    return Variables$Mutation$login_email._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$LoginEmailRequest get input =>
      (_$data['input'] as Input$LoginEmailRequest);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$login_email<Variables$Mutation$login_email>
      get copyWith => CopyWith$Variables$Mutation$login_email(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$login_email ||
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

abstract class CopyWith$Variables$Mutation$login_email<TRes> {
  factory CopyWith$Variables$Mutation$login_email(
    Variables$Mutation$login_email instance,
    TRes Function(Variables$Mutation$login_email) then,
  ) = _CopyWithImpl$Variables$Mutation$login_email;

  factory CopyWith$Variables$Mutation$login_email.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$login_email;

  TRes call({Input$LoginEmailRequest? input});
}

class _CopyWithImpl$Variables$Mutation$login_email<TRes>
    implements CopyWith$Variables$Mutation$login_email<TRes> {
  _CopyWithImpl$Variables$Mutation$login_email(
    this._instance,
    this._then,
  );

  final Variables$Mutation$login_email _instance;

  final TRes Function(Variables$Mutation$login_email) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) =>
      _then(Variables$Mutation$login_email._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$LoginEmailRequest),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$login_email<TRes>
    implements CopyWith$Variables$Mutation$login_email<TRes> {
  _CopyWithStubImpl$Variables$Mutation$login_email(this._res);

  TRes _res;

  call({Input$LoginEmailRequest? input}) => _res;
}

class Mutation$login_email {
  Mutation$login_email({
    required this.auth,
    this.$__typename = 'Mutation',
  });

  factory Mutation$login_email.fromJson(Map<String, dynamic> json) {
    final l$auth = json['auth'];
    final l$$__typename = json['__typename'];
    return Mutation$login_email(
      auth:
          Mutation$login_email$auth.fromJson((l$auth as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$login_email$auth auth;

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
    if (other is! Mutation$login_email || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Mutation$login_email on Mutation$login_email {
  CopyWith$Mutation$login_email<Mutation$login_email> get copyWith =>
      CopyWith$Mutation$login_email(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$login_email<TRes> {
  factory CopyWith$Mutation$login_email(
    Mutation$login_email instance,
    TRes Function(Mutation$login_email) then,
  ) = _CopyWithImpl$Mutation$login_email;

  factory CopyWith$Mutation$login_email.stub(TRes res) =
      _CopyWithStubImpl$Mutation$login_email;

  TRes call({
    Mutation$login_email$auth? auth,
    String? $__typename,
  });
  CopyWith$Mutation$login_email$auth<TRes> get auth;
}

class _CopyWithImpl$Mutation$login_email<TRes>
    implements CopyWith$Mutation$login_email<TRes> {
  _CopyWithImpl$Mutation$login_email(
    this._instance,
    this._then,
  );

  final Mutation$login_email _instance;

  final TRes Function(Mutation$login_email) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? auth = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$login_email(
        auth: auth == _undefined || auth == null
            ? _instance.auth
            : (auth as Mutation$login_email$auth),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$login_email$auth<TRes> get auth {
    final local$auth = _instance.auth;
    return CopyWith$Mutation$login_email$auth(local$auth, (e) => call(auth: e));
  }
}

class _CopyWithStubImpl$Mutation$login_email<TRes>
    implements CopyWith$Mutation$login_email<TRes> {
  _CopyWithStubImpl$Mutation$login_email(this._res);

  TRes _res;

  call({
    Mutation$login_email$auth? auth,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$login_email$auth<TRes> get auth =>
      CopyWith$Mutation$login_email$auth.stub(_res);
}

const documentNodeMutationlogin_email = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'login_email'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'LoginEmailRequest'),
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
            name: NameNode(value: 'login_email'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'input'),
                value: VariableNode(name: NameNode(value: 'input')),
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
                name: NameNode(value: 'auth'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FragmentSpreadNode(
                    name: NameNode(value: 'AuthInfo'),
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
  fragmentDefinitionAuthInfo,
  fragmentDefinitionMeAdmin,
]);
Mutation$login_email _parserFn$Mutation$login_email(
        Map<String, dynamic> data) =>
    Mutation$login_email.fromJson(data);
typedef OnMutationCompleted$Mutation$login_email = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$login_email?,
);

class Options$Mutation$login_email
    extends graphql.MutationOptions<Mutation$login_email> {
  Options$Mutation$login_email({
    String? operationName,
    required Variables$Mutation$login_email variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$login_email? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$login_email? onCompleted,
    graphql.OnMutationUpdate<Mutation$login_email>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$login_email(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationlogin_email,
          parserFn: _parserFn$Mutation$login_email,
        );

  final OnMutationCompleted$Mutation$login_email? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$login_email
    extends graphql.WatchQueryOptions<Mutation$login_email> {
  WatchOptions$Mutation$login_email({
    String? operationName,
    required Variables$Mutation$login_email variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$login_email? typedOptimisticResult,
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
          document: documentNodeMutationlogin_email,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$login_email,
        );
}

extension ClientExtension$Mutation$login_email on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$login_email>> mutate$login_email(
          Options$Mutation$login_email options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$login_email> watchMutation$login_email(
          WatchOptions$Mutation$login_email options) =>
      this.watchMutation(options);
}

class Mutation$login_email$HookResult {
  Mutation$login_email$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$login_email runMutation;

  final graphql.QueryResult<Mutation$login_email> result;
}

Mutation$login_email$HookResult useMutation$login_email(
    [WidgetOptions$Mutation$login_email? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$login_email());
  return Mutation$login_email$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$login_email> useWatchMutation$login_email(
        WatchOptions$Mutation$login_email options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$login_email
    extends graphql.MutationOptions<Mutation$login_email> {
  WidgetOptions$Mutation$login_email({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$login_email? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$login_email? onCompleted,
    graphql.OnMutationUpdate<Mutation$login_email>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$login_email(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationlogin_email,
          parserFn: _parserFn$Mutation$login_email,
        );

  final OnMutationCompleted$Mutation$login_email? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$login_email
    = graphql.MultiSourceResult<Mutation$login_email> Function(
  Variables$Mutation$login_email, {
  Object? optimisticResult,
  Mutation$login_email? typedOptimisticResult,
});
typedef Builder$Mutation$login_email = widgets.Widget Function(
  RunMutation$Mutation$login_email,
  graphql.QueryResult<Mutation$login_email>?,
);

class Mutation$login_email$Widget
    extends graphql_flutter.Mutation<Mutation$login_email> {
  Mutation$login_email$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$login_email? options,
    required Builder$Mutation$login_email builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$login_email(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$login_email$auth {
  Mutation$login_email$auth({
    required this.login_email,
    this.$__typename = 'AuthMutation',
  });

  factory Mutation$login_email$auth.fromJson(Map<String, dynamic> json) {
    final l$login_email = json['login_email'];
    final l$$__typename = json['__typename'];
    return Mutation$login_email$auth(
      login_email: Mutation$login_email$auth$login_email.fromJson(
          (l$login_email as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$login_email$auth$login_email login_email;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$login_email = login_email;
    _resultData['login_email'] = l$login_email.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$login_email = login_email;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$login_email,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$login_email$auth ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$login_email = login_email;
    final lOther$login_email = other.login_email;
    if (l$login_email != lOther$login_email) {
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

extension UtilityExtension$Mutation$login_email$auth
    on Mutation$login_email$auth {
  CopyWith$Mutation$login_email$auth<Mutation$login_email$auth> get copyWith =>
      CopyWith$Mutation$login_email$auth(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$login_email$auth<TRes> {
  factory CopyWith$Mutation$login_email$auth(
    Mutation$login_email$auth instance,
    TRes Function(Mutation$login_email$auth) then,
  ) = _CopyWithImpl$Mutation$login_email$auth;

  factory CopyWith$Mutation$login_email$auth.stub(TRes res) =
      _CopyWithStubImpl$Mutation$login_email$auth;

  TRes call({
    Mutation$login_email$auth$login_email? login_email,
    String? $__typename,
  });
  CopyWith$Mutation$login_email$auth$login_email<TRes> get login_email;
}

class _CopyWithImpl$Mutation$login_email$auth<TRes>
    implements CopyWith$Mutation$login_email$auth<TRes> {
  _CopyWithImpl$Mutation$login_email$auth(
    this._instance,
    this._then,
  );

  final Mutation$login_email$auth _instance;

  final TRes Function(Mutation$login_email$auth) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? login_email = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$login_email$auth(
        login_email: login_email == _undefined || login_email == null
            ? _instance.login_email
            : (login_email as Mutation$login_email$auth$login_email),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$login_email$auth$login_email<TRes> get login_email {
    final local$login_email = _instance.login_email;
    return CopyWith$Mutation$login_email$auth$login_email(
        local$login_email, (e) => call(login_email: e));
  }
}

class _CopyWithStubImpl$Mutation$login_email$auth<TRes>
    implements CopyWith$Mutation$login_email$auth<TRes> {
  _CopyWithStubImpl$Mutation$login_email$auth(this._res);

  TRes _res;

  call({
    Mutation$login_email$auth$login_email? login_email,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$login_email$auth$login_email<TRes> get login_email =>
      CopyWith$Mutation$login_email$auth$login_email.stub(_res);
}

class Mutation$login_email$auth$login_email {
  Mutation$login_email$auth$login_email({
    required this.user,
    required this.auth,
    this.admin,
    this.$__typename = 'AuthResponse',
  });

  factory Mutation$login_email$auth$login_email.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$auth = json['auth'];
    final l$admin = json['admin'];
    final l$$__typename = json['__typename'];
    return Mutation$login_email$auth$login_email(
      user: Fragment$PublicUser.fromJson((l$user as Map<String, dynamic>)),
      auth: Fragment$AuthInfo.fromJson((l$auth as Map<String, dynamic>)),
      admin: l$admin == null
          ? null
          : Fragment$MeAdmin.fromJson((l$admin as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$PublicUser user;

  final Fragment$AuthInfo auth;

  final Fragment$MeAdmin? admin;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$auth = auth;
    _resultData['auth'] = l$auth.toJson();
    final l$admin = admin;
    _resultData['admin'] = l$admin?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user = user;
    final l$auth = auth;
    final l$admin = admin;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user,
      l$auth,
      l$admin,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$login_email$auth$login_email ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
      return false;
    }
    final l$auth = auth;
    final lOther$auth = other.auth;
    if (l$auth != lOther$auth) {
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

extension UtilityExtension$Mutation$login_email$auth$login_email
    on Mutation$login_email$auth$login_email {
  CopyWith$Mutation$login_email$auth$login_email<
          Mutation$login_email$auth$login_email>
      get copyWith => CopyWith$Mutation$login_email$auth$login_email(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$login_email$auth$login_email<TRes> {
  factory CopyWith$Mutation$login_email$auth$login_email(
    Mutation$login_email$auth$login_email instance,
    TRes Function(Mutation$login_email$auth$login_email) then,
  ) = _CopyWithImpl$Mutation$login_email$auth$login_email;

  factory CopyWith$Mutation$login_email$auth$login_email.stub(TRes res) =
      _CopyWithStubImpl$Mutation$login_email$auth$login_email;

  TRes call({
    Fragment$PublicUser? user,
    Fragment$AuthInfo? auth,
    Fragment$MeAdmin? admin,
    String? $__typename,
  });
  CopyWith$Fragment$PublicUser<TRes> get user;
  CopyWith$Fragment$AuthInfo<TRes> get auth;
  CopyWith$Fragment$MeAdmin<TRes> get admin;
}

class _CopyWithImpl$Mutation$login_email$auth$login_email<TRes>
    implements CopyWith$Mutation$login_email$auth$login_email<TRes> {
  _CopyWithImpl$Mutation$login_email$auth$login_email(
    this._instance,
    this._then,
  );

  final Mutation$login_email$auth$login_email _instance;

  final TRes Function(Mutation$login_email$auth$login_email) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user = _undefined,
    Object? auth = _undefined,
    Object? admin = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$login_email$auth$login_email(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Fragment$PublicUser),
        auth: auth == _undefined || auth == null
            ? _instance.auth
            : (auth as Fragment$AuthInfo),
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

  CopyWith$Fragment$AuthInfo<TRes> get auth {
    final local$auth = _instance.auth;
    return CopyWith$Fragment$AuthInfo(local$auth, (e) => call(auth: e));
  }

  CopyWith$Fragment$MeAdmin<TRes> get admin {
    final local$admin = _instance.admin;
    return local$admin == null
        ? CopyWith$Fragment$MeAdmin.stub(_then(_instance))
        : CopyWith$Fragment$MeAdmin(local$admin, (e) => call(admin: e));
  }
}

class _CopyWithStubImpl$Mutation$login_email$auth$login_email<TRes>
    implements CopyWith$Mutation$login_email$auth$login_email<TRes> {
  _CopyWithStubImpl$Mutation$login_email$auth$login_email(this._res);

  TRes _res;

  call({
    Fragment$PublicUser? user,
    Fragment$AuthInfo? auth,
    Fragment$MeAdmin? admin,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$PublicUser<TRes> get user =>
      CopyWith$Fragment$PublicUser.stub(_res);

  CopyWith$Fragment$AuthInfo<TRes> get auth =>
      CopyWith$Fragment$AuthInfo.stub(_res);

  CopyWith$Fragment$MeAdmin<TRes> get admin =>
      CopyWith$Fragment$MeAdmin.stub(_res);
}

class Variables$Mutation$register_email {
  factory Variables$Mutation$register_email(
          {required Input$RegisterEmailRequest input}) =>
      Variables$Mutation$register_email._({
        r'input': input,
      });

  Variables$Mutation$register_email._(this._$data);

  factory Variables$Mutation$register_email.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] =
        Input$RegisterEmailRequest.fromJson((l$input as Map<String, dynamic>));
    return Variables$Mutation$register_email._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$RegisterEmailRequest get input =>
      (_$data['input'] as Input$RegisterEmailRequest);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$register_email<Variables$Mutation$register_email>
      get copyWith => CopyWith$Variables$Mutation$register_email(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$register_email ||
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

abstract class CopyWith$Variables$Mutation$register_email<TRes> {
  factory CopyWith$Variables$Mutation$register_email(
    Variables$Mutation$register_email instance,
    TRes Function(Variables$Mutation$register_email) then,
  ) = _CopyWithImpl$Variables$Mutation$register_email;

  factory CopyWith$Variables$Mutation$register_email.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$register_email;

  TRes call({Input$RegisterEmailRequest? input});
}

class _CopyWithImpl$Variables$Mutation$register_email<TRes>
    implements CopyWith$Variables$Mutation$register_email<TRes> {
  _CopyWithImpl$Variables$Mutation$register_email(
    this._instance,
    this._then,
  );

  final Variables$Mutation$register_email _instance;

  final TRes Function(Variables$Mutation$register_email) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) =>
      _then(Variables$Mutation$register_email._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$RegisterEmailRequest),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$register_email<TRes>
    implements CopyWith$Variables$Mutation$register_email<TRes> {
  _CopyWithStubImpl$Variables$Mutation$register_email(this._res);

  TRes _res;

  call({Input$RegisterEmailRequest? input}) => _res;
}

class Mutation$register_email {
  Mutation$register_email({
    required this.auth,
    this.$__typename = 'Mutation',
  });

  factory Mutation$register_email.fromJson(Map<String, dynamic> json) {
    final l$auth = json['auth'];
    final l$$__typename = json['__typename'];
    return Mutation$register_email(
      auth: Mutation$register_email$auth.fromJson(
          (l$auth as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$register_email$auth auth;

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
    if (other is! Mutation$register_email || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Mutation$register_email on Mutation$register_email {
  CopyWith$Mutation$register_email<Mutation$register_email> get copyWith =>
      CopyWith$Mutation$register_email(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$register_email<TRes> {
  factory CopyWith$Mutation$register_email(
    Mutation$register_email instance,
    TRes Function(Mutation$register_email) then,
  ) = _CopyWithImpl$Mutation$register_email;

  factory CopyWith$Mutation$register_email.stub(TRes res) =
      _CopyWithStubImpl$Mutation$register_email;

  TRes call({
    Mutation$register_email$auth? auth,
    String? $__typename,
  });
  CopyWith$Mutation$register_email$auth<TRes> get auth;
}

class _CopyWithImpl$Mutation$register_email<TRes>
    implements CopyWith$Mutation$register_email<TRes> {
  _CopyWithImpl$Mutation$register_email(
    this._instance,
    this._then,
  );

  final Mutation$register_email _instance;

  final TRes Function(Mutation$register_email) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? auth = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$register_email(
        auth: auth == _undefined || auth == null
            ? _instance.auth
            : (auth as Mutation$register_email$auth),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$register_email$auth<TRes> get auth {
    final local$auth = _instance.auth;
    return CopyWith$Mutation$register_email$auth(
        local$auth, (e) => call(auth: e));
  }
}

class _CopyWithStubImpl$Mutation$register_email<TRes>
    implements CopyWith$Mutation$register_email<TRes> {
  _CopyWithStubImpl$Mutation$register_email(this._res);

  TRes _res;

  call({
    Mutation$register_email$auth? auth,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$register_email$auth<TRes> get auth =>
      CopyWith$Mutation$register_email$auth.stub(_res);
}

const documentNodeMutationregister_email = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'register_email'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'RegisterEmailRequest'),
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
            name: NameNode(value: 'register_email'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'input'),
                value: VariableNode(name: NameNode(value: 'input')),
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
                name: NameNode(value: 'auth'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FragmentSpreadNode(
                    name: NameNode(value: 'AuthInfo'),
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
  fragmentDefinitionAuthInfo,
]);
Mutation$register_email _parserFn$Mutation$register_email(
        Map<String, dynamic> data) =>
    Mutation$register_email.fromJson(data);
typedef OnMutationCompleted$Mutation$register_email = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$register_email?,
);

class Options$Mutation$register_email
    extends graphql.MutationOptions<Mutation$register_email> {
  Options$Mutation$register_email({
    String? operationName,
    required Variables$Mutation$register_email variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$register_email? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$register_email? onCompleted,
    graphql.OnMutationUpdate<Mutation$register_email>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$register_email(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationregister_email,
          parserFn: _parserFn$Mutation$register_email,
        );

  final OnMutationCompleted$Mutation$register_email? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$register_email
    extends graphql.WatchQueryOptions<Mutation$register_email> {
  WatchOptions$Mutation$register_email({
    String? operationName,
    required Variables$Mutation$register_email variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$register_email? typedOptimisticResult,
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
          document: documentNodeMutationregister_email,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$register_email,
        );
}

extension ClientExtension$Mutation$register_email on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$register_email>> mutate$register_email(
          Options$Mutation$register_email options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$register_email> watchMutation$register_email(
          WatchOptions$Mutation$register_email options) =>
      this.watchMutation(options);
}

class Mutation$register_email$HookResult {
  Mutation$register_email$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$register_email runMutation;

  final graphql.QueryResult<Mutation$register_email> result;
}

Mutation$register_email$HookResult useMutation$register_email(
    [WidgetOptions$Mutation$register_email? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$register_email());
  return Mutation$register_email$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$register_email>
    useWatchMutation$register_email(
            WatchOptions$Mutation$register_email options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$register_email
    extends graphql.MutationOptions<Mutation$register_email> {
  WidgetOptions$Mutation$register_email({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$register_email? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$register_email? onCompleted,
    graphql.OnMutationUpdate<Mutation$register_email>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$register_email(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationregister_email,
          parserFn: _parserFn$Mutation$register_email,
        );

  final OnMutationCompleted$Mutation$register_email? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$register_email
    = graphql.MultiSourceResult<Mutation$register_email> Function(
  Variables$Mutation$register_email, {
  Object? optimisticResult,
  Mutation$register_email? typedOptimisticResult,
});
typedef Builder$Mutation$register_email = widgets.Widget Function(
  RunMutation$Mutation$register_email,
  graphql.QueryResult<Mutation$register_email>?,
);

class Mutation$register_email$Widget
    extends graphql_flutter.Mutation<Mutation$register_email> {
  Mutation$register_email$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$register_email? options,
    required Builder$Mutation$register_email builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$register_email(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$register_email$auth {
  Mutation$register_email$auth({
    required this.register_email,
    this.$__typename = 'AuthMutation',
  });

  factory Mutation$register_email$auth.fromJson(Map<String, dynamic> json) {
    final l$register_email = json['register_email'];
    final l$$__typename = json['__typename'];
    return Mutation$register_email$auth(
      register_email: Mutation$register_email$auth$register_email.fromJson(
          (l$register_email as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$register_email$auth$register_email register_email;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$register_email = register_email;
    _resultData['register_email'] = l$register_email.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$register_email = register_email;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$register_email,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$register_email$auth ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$register_email = register_email;
    final lOther$register_email = other.register_email;
    if (l$register_email != lOther$register_email) {
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

extension UtilityExtension$Mutation$register_email$auth
    on Mutation$register_email$auth {
  CopyWith$Mutation$register_email$auth<Mutation$register_email$auth>
      get copyWith => CopyWith$Mutation$register_email$auth(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$register_email$auth<TRes> {
  factory CopyWith$Mutation$register_email$auth(
    Mutation$register_email$auth instance,
    TRes Function(Mutation$register_email$auth) then,
  ) = _CopyWithImpl$Mutation$register_email$auth;

  factory CopyWith$Mutation$register_email$auth.stub(TRes res) =
      _CopyWithStubImpl$Mutation$register_email$auth;

  TRes call({
    Mutation$register_email$auth$register_email? register_email,
    String? $__typename,
  });
  CopyWith$Mutation$register_email$auth$register_email<TRes> get register_email;
}

class _CopyWithImpl$Mutation$register_email$auth<TRes>
    implements CopyWith$Mutation$register_email$auth<TRes> {
  _CopyWithImpl$Mutation$register_email$auth(
    this._instance,
    this._then,
  );

  final Mutation$register_email$auth _instance;

  final TRes Function(Mutation$register_email$auth) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? register_email = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$register_email$auth(
        register_email: register_email == _undefined || register_email == null
            ? _instance.register_email
            : (register_email as Mutation$register_email$auth$register_email),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$register_email$auth$register_email<TRes>
      get register_email {
    final local$register_email = _instance.register_email;
    return CopyWith$Mutation$register_email$auth$register_email(
        local$register_email, (e) => call(register_email: e));
  }
}

class _CopyWithStubImpl$Mutation$register_email$auth<TRes>
    implements CopyWith$Mutation$register_email$auth<TRes> {
  _CopyWithStubImpl$Mutation$register_email$auth(this._res);

  TRes _res;

  call({
    Mutation$register_email$auth$register_email? register_email,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$register_email$auth$register_email<TRes>
      get register_email =>
          CopyWith$Mutation$register_email$auth$register_email.stub(_res);
}

class Mutation$register_email$auth$register_email {
  Mutation$register_email$auth$register_email({
    required this.user,
    required this.auth,
    this.$__typename = 'AuthResponse',
  });

  factory Mutation$register_email$auth$register_email.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$auth = json['auth'];
    final l$$__typename = json['__typename'];
    return Mutation$register_email$auth$register_email(
      user: Fragment$PublicUser.fromJson((l$user as Map<String, dynamic>)),
      auth: Fragment$AuthInfo.fromJson((l$auth as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$PublicUser user;

  final Fragment$AuthInfo auth;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$auth = auth;
    _resultData['auth'] = l$auth.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user = user;
    final l$auth = auth;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user,
      l$auth,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$register_email$auth$register_email ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
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

extension UtilityExtension$Mutation$register_email$auth$register_email
    on Mutation$register_email$auth$register_email {
  CopyWith$Mutation$register_email$auth$register_email<
          Mutation$register_email$auth$register_email>
      get copyWith => CopyWith$Mutation$register_email$auth$register_email(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$register_email$auth$register_email<TRes> {
  factory CopyWith$Mutation$register_email$auth$register_email(
    Mutation$register_email$auth$register_email instance,
    TRes Function(Mutation$register_email$auth$register_email) then,
  ) = _CopyWithImpl$Mutation$register_email$auth$register_email;

  factory CopyWith$Mutation$register_email$auth$register_email.stub(TRes res) =
      _CopyWithStubImpl$Mutation$register_email$auth$register_email;

  TRes call({
    Fragment$PublicUser? user,
    Fragment$AuthInfo? auth,
    String? $__typename,
  });
  CopyWith$Fragment$PublicUser<TRes> get user;
  CopyWith$Fragment$AuthInfo<TRes> get auth;
}

class _CopyWithImpl$Mutation$register_email$auth$register_email<TRes>
    implements CopyWith$Mutation$register_email$auth$register_email<TRes> {
  _CopyWithImpl$Mutation$register_email$auth$register_email(
    this._instance,
    this._then,
  );

  final Mutation$register_email$auth$register_email _instance;

  final TRes Function(Mutation$register_email$auth$register_email) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user = _undefined,
    Object? auth = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$register_email$auth$register_email(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Fragment$PublicUser),
        auth: auth == _undefined || auth == null
            ? _instance.auth
            : (auth as Fragment$AuthInfo),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$PublicUser<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Fragment$PublicUser(local$user, (e) => call(user: e));
  }

  CopyWith$Fragment$AuthInfo<TRes> get auth {
    final local$auth = _instance.auth;
    return CopyWith$Fragment$AuthInfo(local$auth, (e) => call(auth: e));
  }
}

class _CopyWithStubImpl$Mutation$register_email$auth$register_email<TRes>
    implements CopyWith$Mutation$register_email$auth$register_email<TRes> {
  _CopyWithStubImpl$Mutation$register_email$auth$register_email(this._res);

  TRes _res;

  call({
    Fragment$PublicUser? user,
    Fragment$AuthInfo? auth,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$PublicUser<TRes> get user =>
      CopyWith$Fragment$PublicUser.stub(_res);

  CopyWith$Fragment$AuthInfo<TRes> get auth =>
      CopyWith$Fragment$AuthInfo.stub(_res);
}

class Variables$Mutation$VerifyEmail {
  factory Variables$Mutation$VerifyEmail(
          {required Input$VerifyEmailRequest input}) =>
      Variables$Mutation$VerifyEmail._({
        r'input': input,
      });

  Variables$Mutation$VerifyEmail._(this._$data);

  factory Variables$Mutation$VerifyEmail.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] =
        Input$VerifyEmailRequest.fromJson((l$input as Map<String, dynamic>));
    return Variables$Mutation$VerifyEmail._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$VerifyEmailRequest get input =>
      (_$data['input'] as Input$VerifyEmailRequest);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$VerifyEmail<Variables$Mutation$VerifyEmail>
      get copyWith => CopyWith$Variables$Mutation$VerifyEmail(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$VerifyEmail ||
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

abstract class CopyWith$Variables$Mutation$VerifyEmail<TRes> {
  factory CopyWith$Variables$Mutation$VerifyEmail(
    Variables$Mutation$VerifyEmail instance,
    TRes Function(Variables$Mutation$VerifyEmail) then,
  ) = _CopyWithImpl$Variables$Mutation$VerifyEmail;

  factory CopyWith$Variables$Mutation$VerifyEmail.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$VerifyEmail;

  TRes call({Input$VerifyEmailRequest? input});
}

class _CopyWithImpl$Variables$Mutation$VerifyEmail<TRes>
    implements CopyWith$Variables$Mutation$VerifyEmail<TRes> {
  _CopyWithImpl$Variables$Mutation$VerifyEmail(
    this._instance,
    this._then,
  );

  final Variables$Mutation$VerifyEmail _instance;

  final TRes Function(Variables$Mutation$VerifyEmail) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) =>
      _then(Variables$Mutation$VerifyEmail._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$VerifyEmailRequest),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$VerifyEmail<TRes>
    implements CopyWith$Variables$Mutation$VerifyEmail<TRes> {
  _CopyWithStubImpl$Variables$Mutation$VerifyEmail(this._res);

  TRes _res;

  call({Input$VerifyEmailRequest? input}) => _res;
}

class Mutation$VerifyEmail {
  Mutation$VerifyEmail({
    required this.auth,
    this.$__typename = 'Mutation',
  });

  factory Mutation$VerifyEmail.fromJson(Map<String, dynamic> json) {
    final l$auth = json['auth'];
    final l$$__typename = json['__typename'];
    return Mutation$VerifyEmail(
      auth:
          Mutation$VerifyEmail$auth.fromJson((l$auth as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$VerifyEmail$auth auth;

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
    if (other is! Mutation$VerifyEmail || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Mutation$VerifyEmail on Mutation$VerifyEmail {
  CopyWith$Mutation$VerifyEmail<Mutation$VerifyEmail> get copyWith =>
      CopyWith$Mutation$VerifyEmail(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$VerifyEmail<TRes> {
  factory CopyWith$Mutation$VerifyEmail(
    Mutation$VerifyEmail instance,
    TRes Function(Mutation$VerifyEmail) then,
  ) = _CopyWithImpl$Mutation$VerifyEmail;

  factory CopyWith$Mutation$VerifyEmail.stub(TRes res) =
      _CopyWithStubImpl$Mutation$VerifyEmail;

  TRes call({
    Mutation$VerifyEmail$auth? auth,
    String? $__typename,
  });
  CopyWith$Mutation$VerifyEmail$auth<TRes> get auth;
}

class _CopyWithImpl$Mutation$VerifyEmail<TRes>
    implements CopyWith$Mutation$VerifyEmail<TRes> {
  _CopyWithImpl$Mutation$VerifyEmail(
    this._instance,
    this._then,
  );

  final Mutation$VerifyEmail _instance;

  final TRes Function(Mutation$VerifyEmail) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? auth = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$VerifyEmail(
        auth: auth == _undefined || auth == null
            ? _instance.auth
            : (auth as Mutation$VerifyEmail$auth),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$VerifyEmail$auth<TRes> get auth {
    final local$auth = _instance.auth;
    return CopyWith$Mutation$VerifyEmail$auth(local$auth, (e) => call(auth: e));
  }
}

class _CopyWithStubImpl$Mutation$VerifyEmail<TRes>
    implements CopyWith$Mutation$VerifyEmail<TRes> {
  _CopyWithStubImpl$Mutation$VerifyEmail(this._res);

  TRes _res;

  call({
    Mutation$VerifyEmail$auth? auth,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$VerifyEmail$auth<TRes> get auth =>
      CopyWith$Mutation$VerifyEmail$auth.stub(_res);
}

const documentNodeMutationVerifyEmail = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'VerifyEmail'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'VerifyEmailRequest'),
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
            name: NameNode(value: 'verify_email'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'input'),
                value: VariableNode(name: NameNode(value: 'input')),
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
                name: NameNode(value: 'auth'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FragmentSpreadNode(
                    name: NameNode(value: 'AuthInfo'),
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
  fragmentDefinitionAuthInfo,
]);
Mutation$VerifyEmail _parserFn$Mutation$VerifyEmail(
        Map<String, dynamic> data) =>
    Mutation$VerifyEmail.fromJson(data);
typedef OnMutationCompleted$Mutation$VerifyEmail = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$VerifyEmail?,
);

class Options$Mutation$VerifyEmail
    extends graphql.MutationOptions<Mutation$VerifyEmail> {
  Options$Mutation$VerifyEmail({
    String? operationName,
    required Variables$Mutation$VerifyEmail variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$VerifyEmail? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$VerifyEmail? onCompleted,
    graphql.OnMutationUpdate<Mutation$VerifyEmail>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$VerifyEmail(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationVerifyEmail,
          parserFn: _parserFn$Mutation$VerifyEmail,
        );

  final OnMutationCompleted$Mutation$VerifyEmail? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$VerifyEmail
    extends graphql.WatchQueryOptions<Mutation$VerifyEmail> {
  WatchOptions$Mutation$VerifyEmail({
    String? operationName,
    required Variables$Mutation$VerifyEmail variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$VerifyEmail? typedOptimisticResult,
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
          document: documentNodeMutationVerifyEmail,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$VerifyEmail,
        );
}

extension ClientExtension$Mutation$VerifyEmail on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$VerifyEmail>> mutate$VerifyEmail(
          Options$Mutation$VerifyEmail options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$VerifyEmail> watchMutation$VerifyEmail(
          WatchOptions$Mutation$VerifyEmail options) =>
      this.watchMutation(options);
}

class Mutation$VerifyEmail$HookResult {
  Mutation$VerifyEmail$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$VerifyEmail runMutation;

  final graphql.QueryResult<Mutation$VerifyEmail> result;
}

Mutation$VerifyEmail$HookResult useMutation$VerifyEmail(
    [WidgetOptions$Mutation$VerifyEmail? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$VerifyEmail());
  return Mutation$VerifyEmail$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$VerifyEmail> useWatchMutation$VerifyEmail(
        WatchOptions$Mutation$VerifyEmail options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$VerifyEmail
    extends graphql.MutationOptions<Mutation$VerifyEmail> {
  WidgetOptions$Mutation$VerifyEmail({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$VerifyEmail? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$VerifyEmail? onCompleted,
    graphql.OnMutationUpdate<Mutation$VerifyEmail>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$VerifyEmail(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationVerifyEmail,
          parserFn: _parserFn$Mutation$VerifyEmail,
        );

  final OnMutationCompleted$Mutation$VerifyEmail? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$VerifyEmail
    = graphql.MultiSourceResult<Mutation$VerifyEmail> Function(
  Variables$Mutation$VerifyEmail, {
  Object? optimisticResult,
  Mutation$VerifyEmail? typedOptimisticResult,
});
typedef Builder$Mutation$VerifyEmail = widgets.Widget Function(
  RunMutation$Mutation$VerifyEmail,
  graphql.QueryResult<Mutation$VerifyEmail>?,
);

class Mutation$VerifyEmail$Widget
    extends graphql_flutter.Mutation<Mutation$VerifyEmail> {
  Mutation$VerifyEmail$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$VerifyEmail? options,
    required Builder$Mutation$VerifyEmail builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$VerifyEmail(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$VerifyEmail$auth {
  Mutation$VerifyEmail$auth({
    required this.verify_email,
    this.$__typename = 'AuthMutation',
  });

  factory Mutation$VerifyEmail$auth.fromJson(Map<String, dynamic> json) {
    final l$verify_email = json['verify_email'];
    final l$$__typename = json['__typename'];
    return Mutation$VerifyEmail$auth(
      verify_email: Mutation$VerifyEmail$auth$verify_email.fromJson(
          (l$verify_email as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$VerifyEmail$auth$verify_email verify_email;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$verify_email = verify_email;
    _resultData['verify_email'] = l$verify_email.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$verify_email = verify_email;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$verify_email,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$VerifyEmail$auth ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$verify_email = verify_email;
    final lOther$verify_email = other.verify_email;
    if (l$verify_email != lOther$verify_email) {
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

extension UtilityExtension$Mutation$VerifyEmail$auth
    on Mutation$VerifyEmail$auth {
  CopyWith$Mutation$VerifyEmail$auth<Mutation$VerifyEmail$auth> get copyWith =>
      CopyWith$Mutation$VerifyEmail$auth(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$VerifyEmail$auth<TRes> {
  factory CopyWith$Mutation$VerifyEmail$auth(
    Mutation$VerifyEmail$auth instance,
    TRes Function(Mutation$VerifyEmail$auth) then,
  ) = _CopyWithImpl$Mutation$VerifyEmail$auth;

  factory CopyWith$Mutation$VerifyEmail$auth.stub(TRes res) =
      _CopyWithStubImpl$Mutation$VerifyEmail$auth;

  TRes call({
    Mutation$VerifyEmail$auth$verify_email? verify_email,
    String? $__typename,
  });
  CopyWith$Mutation$VerifyEmail$auth$verify_email<TRes> get verify_email;
}

class _CopyWithImpl$Mutation$VerifyEmail$auth<TRes>
    implements CopyWith$Mutation$VerifyEmail$auth<TRes> {
  _CopyWithImpl$Mutation$VerifyEmail$auth(
    this._instance,
    this._then,
  );

  final Mutation$VerifyEmail$auth _instance;

  final TRes Function(Mutation$VerifyEmail$auth) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? verify_email = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$VerifyEmail$auth(
        verify_email: verify_email == _undefined || verify_email == null
            ? _instance.verify_email
            : (verify_email as Mutation$VerifyEmail$auth$verify_email),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$VerifyEmail$auth$verify_email<TRes> get verify_email {
    final local$verify_email = _instance.verify_email;
    return CopyWith$Mutation$VerifyEmail$auth$verify_email(
        local$verify_email, (e) => call(verify_email: e));
  }
}

class _CopyWithStubImpl$Mutation$VerifyEmail$auth<TRes>
    implements CopyWith$Mutation$VerifyEmail$auth<TRes> {
  _CopyWithStubImpl$Mutation$VerifyEmail$auth(this._res);

  TRes _res;

  call({
    Mutation$VerifyEmail$auth$verify_email? verify_email,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$VerifyEmail$auth$verify_email<TRes> get verify_email =>
      CopyWith$Mutation$VerifyEmail$auth$verify_email.stub(_res);
}

class Mutation$VerifyEmail$auth$verify_email {
  Mutation$VerifyEmail$auth$verify_email({
    required this.user,
    required this.auth,
    this.$__typename = 'AuthResponse',
  });

  factory Mutation$VerifyEmail$auth$verify_email.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$auth = json['auth'];
    final l$$__typename = json['__typename'];
    return Mutation$VerifyEmail$auth$verify_email(
      user: Fragment$PublicUser.fromJson((l$user as Map<String, dynamic>)),
      auth: Fragment$AuthInfo.fromJson((l$auth as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$PublicUser user;

  final Fragment$AuthInfo auth;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$auth = auth;
    _resultData['auth'] = l$auth.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user = user;
    final l$auth = auth;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user,
      l$auth,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$VerifyEmail$auth$verify_email ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
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

extension UtilityExtension$Mutation$VerifyEmail$auth$verify_email
    on Mutation$VerifyEmail$auth$verify_email {
  CopyWith$Mutation$VerifyEmail$auth$verify_email<
          Mutation$VerifyEmail$auth$verify_email>
      get copyWith => CopyWith$Mutation$VerifyEmail$auth$verify_email(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$VerifyEmail$auth$verify_email<TRes> {
  factory CopyWith$Mutation$VerifyEmail$auth$verify_email(
    Mutation$VerifyEmail$auth$verify_email instance,
    TRes Function(Mutation$VerifyEmail$auth$verify_email) then,
  ) = _CopyWithImpl$Mutation$VerifyEmail$auth$verify_email;

  factory CopyWith$Mutation$VerifyEmail$auth$verify_email.stub(TRes res) =
      _CopyWithStubImpl$Mutation$VerifyEmail$auth$verify_email;

  TRes call({
    Fragment$PublicUser? user,
    Fragment$AuthInfo? auth,
    String? $__typename,
  });
  CopyWith$Fragment$PublicUser<TRes> get user;
  CopyWith$Fragment$AuthInfo<TRes> get auth;
}

class _CopyWithImpl$Mutation$VerifyEmail$auth$verify_email<TRes>
    implements CopyWith$Mutation$VerifyEmail$auth$verify_email<TRes> {
  _CopyWithImpl$Mutation$VerifyEmail$auth$verify_email(
    this._instance,
    this._then,
  );

  final Mutation$VerifyEmail$auth$verify_email _instance;

  final TRes Function(Mutation$VerifyEmail$auth$verify_email) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user = _undefined,
    Object? auth = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$VerifyEmail$auth$verify_email(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Fragment$PublicUser),
        auth: auth == _undefined || auth == null
            ? _instance.auth
            : (auth as Fragment$AuthInfo),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$PublicUser<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Fragment$PublicUser(local$user, (e) => call(user: e));
  }

  CopyWith$Fragment$AuthInfo<TRes> get auth {
    final local$auth = _instance.auth;
    return CopyWith$Fragment$AuthInfo(local$auth, (e) => call(auth: e));
  }
}

class _CopyWithStubImpl$Mutation$VerifyEmail$auth$verify_email<TRes>
    implements CopyWith$Mutation$VerifyEmail$auth$verify_email<TRes> {
  _CopyWithStubImpl$Mutation$VerifyEmail$auth$verify_email(this._res);

  TRes _res;

  call({
    Fragment$PublicUser? user,
    Fragment$AuthInfo? auth,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$PublicUser<TRes> get user =>
      CopyWith$Fragment$PublicUser.stub(_res);

  CopyWith$Fragment$AuthInfo<TRes> get auth =>
      CopyWith$Fragment$AuthInfo.stub(_res);
}

class Variables$Mutation$CreateJourney {
  factory Variables$Mutation$CreateJourney(
          {required Input$CreateJourneyInput input}) =>
      Variables$Mutation$CreateJourney._({
        r'input': input,
      });

  Variables$Mutation$CreateJourney._(this._$data);

  factory Variables$Mutation$CreateJourney.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] =
        Input$CreateJourneyInput.fromJson((l$input as Map<String, dynamic>));
    return Variables$Mutation$CreateJourney._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$CreateJourneyInput get input =>
      (_$data['input'] as Input$CreateJourneyInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateJourney<Variables$Mutation$CreateJourney>
      get copyWith => CopyWith$Variables$Mutation$CreateJourney(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CreateJourney ||
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

abstract class CopyWith$Variables$Mutation$CreateJourney<TRes> {
  factory CopyWith$Variables$Mutation$CreateJourney(
    Variables$Mutation$CreateJourney instance,
    TRes Function(Variables$Mutation$CreateJourney) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateJourney;

  factory CopyWith$Variables$Mutation$CreateJourney.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateJourney;

  TRes call({Input$CreateJourneyInput? input});
}

class _CopyWithImpl$Variables$Mutation$CreateJourney<TRes>
    implements CopyWith$Variables$Mutation$CreateJourney<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateJourney(
    this._instance,
    this._then,
  );

  final Variables$Mutation$CreateJourney _instance;

  final TRes Function(Variables$Mutation$CreateJourney) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) =>
      _then(Variables$Mutation$CreateJourney._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$CreateJourneyInput),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$CreateJourney<TRes>
    implements CopyWith$Variables$Mutation$CreateJourney<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateJourney(this._res);

  TRes _res;

  call({Input$CreateJourneyInput? input}) => _res;
}

class Mutation$CreateJourney {
  Mutation$CreateJourney({
    required this.user,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CreateJourney.fromJson(Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateJourney(
      user: Mutation$CreateJourney$user.fromJson(
          (l$user as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateJourney$user user;

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
    if (other is! Mutation$CreateJourney || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Mutation$CreateJourney on Mutation$CreateJourney {
  CopyWith$Mutation$CreateJourney<Mutation$CreateJourney> get copyWith =>
      CopyWith$Mutation$CreateJourney(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$CreateJourney<TRes> {
  factory CopyWith$Mutation$CreateJourney(
    Mutation$CreateJourney instance,
    TRes Function(Mutation$CreateJourney) then,
  ) = _CopyWithImpl$Mutation$CreateJourney;

  factory CopyWith$Mutation$CreateJourney.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateJourney;

  TRes call({
    Mutation$CreateJourney$user? user,
    String? $__typename,
  });
  CopyWith$Mutation$CreateJourney$user<TRes> get user;
}

class _CopyWithImpl$Mutation$CreateJourney<TRes>
    implements CopyWith$Mutation$CreateJourney<TRes> {
  _CopyWithImpl$Mutation$CreateJourney(
    this._instance,
    this._then,
  );

  final Mutation$CreateJourney _instance;

  final TRes Function(Mutation$CreateJourney) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateJourney(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Mutation$CreateJourney$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$CreateJourney$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Mutation$CreateJourney$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Mutation$CreateJourney<TRes>
    implements CopyWith$Mutation$CreateJourney<TRes> {
  _CopyWithStubImpl$Mutation$CreateJourney(this._res);

  TRes _res;

  call({
    Mutation$CreateJourney$user? user,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$CreateJourney$user<TRes> get user =>
      CopyWith$Mutation$CreateJourney$user.stub(_res);
}

const documentNodeMutationCreateJourney = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'CreateJourney'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'CreateJourneyInput'),
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
            name: NameNode(value: 'create_journey'),
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
Mutation$CreateJourney _parserFn$Mutation$CreateJourney(
        Map<String, dynamic> data) =>
    Mutation$CreateJourney.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateJourney = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$CreateJourney?,
);

class Options$Mutation$CreateJourney
    extends graphql.MutationOptions<Mutation$CreateJourney> {
  Options$Mutation$CreateJourney({
    String? operationName,
    required Variables$Mutation$CreateJourney variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateJourney? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateJourney? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateJourney>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$CreateJourney(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateJourney,
          parserFn: _parserFn$Mutation$CreateJourney,
        );

  final OnMutationCompleted$Mutation$CreateJourney? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$CreateJourney
    extends graphql.WatchQueryOptions<Mutation$CreateJourney> {
  WatchOptions$Mutation$CreateJourney({
    String? operationName,
    required Variables$Mutation$CreateJourney variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateJourney? typedOptimisticResult,
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
          document: documentNodeMutationCreateJourney,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$CreateJourney,
        );
}

extension ClientExtension$Mutation$CreateJourney on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateJourney>> mutate$CreateJourney(
          Options$Mutation$CreateJourney options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$CreateJourney> watchMutation$CreateJourney(
          WatchOptions$Mutation$CreateJourney options) =>
      this.watchMutation(options);
}

class Mutation$CreateJourney$HookResult {
  Mutation$CreateJourney$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$CreateJourney runMutation;

  final graphql.QueryResult<Mutation$CreateJourney> result;
}

Mutation$CreateJourney$HookResult useMutation$CreateJourney(
    [WidgetOptions$Mutation$CreateJourney? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$CreateJourney());
  return Mutation$CreateJourney$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$CreateJourney> useWatchMutation$CreateJourney(
        WatchOptions$Mutation$CreateJourney options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$CreateJourney
    extends graphql.MutationOptions<Mutation$CreateJourney> {
  WidgetOptions$Mutation$CreateJourney({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateJourney? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateJourney? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateJourney>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$CreateJourney(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateJourney,
          parserFn: _parserFn$Mutation$CreateJourney,
        );

  final OnMutationCompleted$Mutation$CreateJourney? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$CreateJourney
    = graphql.MultiSourceResult<Mutation$CreateJourney> Function(
  Variables$Mutation$CreateJourney, {
  Object? optimisticResult,
  Mutation$CreateJourney? typedOptimisticResult,
});
typedef Builder$Mutation$CreateJourney = widgets.Widget Function(
  RunMutation$Mutation$CreateJourney,
  graphql.QueryResult<Mutation$CreateJourney>?,
);

class Mutation$CreateJourney$Widget
    extends graphql_flutter.Mutation<Mutation$CreateJourney> {
  Mutation$CreateJourney$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$CreateJourney? options,
    required Builder$Mutation$CreateJourney builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$CreateJourney(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$CreateJourney$user {
  Mutation$CreateJourney$user({
    required this.create_journey,
    this.$__typename = 'UserMutation',
  });

  factory Mutation$CreateJourney$user.fromJson(Map<String, dynamic> json) {
    final l$create_journey = json['create_journey'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateJourney$user(
      create_journey:
          Fragment$Journey.fromJson((l$create_journey as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$Journey create_journey;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$create_journey = create_journey;
    _resultData['create_journey'] = l$create_journey.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$create_journey = create_journey;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$create_journey,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateJourney$user ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$create_journey = create_journey;
    final lOther$create_journey = other.create_journey;
    if (l$create_journey != lOther$create_journey) {
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

extension UtilityExtension$Mutation$CreateJourney$user
    on Mutation$CreateJourney$user {
  CopyWith$Mutation$CreateJourney$user<Mutation$CreateJourney$user>
      get copyWith => CopyWith$Mutation$CreateJourney$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CreateJourney$user<TRes> {
  factory CopyWith$Mutation$CreateJourney$user(
    Mutation$CreateJourney$user instance,
    TRes Function(Mutation$CreateJourney$user) then,
  ) = _CopyWithImpl$Mutation$CreateJourney$user;

  factory CopyWith$Mutation$CreateJourney$user.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateJourney$user;

  TRes call({
    Fragment$Journey? create_journey,
    String? $__typename,
  });
  CopyWith$Fragment$Journey<TRes> get create_journey;
}

class _CopyWithImpl$Mutation$CreateJourney$user<TRes>
    implements CopyWith$Mutation$CreateJourney$user<TRes> {
  _CopyWithImpl$Mutation$CreateJourney$user(
    this._instance,
    this._then,
  );

  final Mutation$CreateJourney$user _instance;

  final TRes Function(Mutation$CreateJourney$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? create_journey = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateJourney$user(
        create_journey: create_journey == _undefined || create_journey == null
            ? _instance.create_journey
            : (create_journey as Fragment$Journey),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$Journey<TRes> get create_journey {
    final local$create_journey = _instance.create_journey;
    return CopyWith$Fragment$Journey(
        local$create_journey, (e) => call(create_journey: e));
  }
}

class _CopyWithStubImpl$Mutation$CreateJourney$user<TRes>
    implements CopyWith$Mutation$CreateJourney$user<TRes> {
  _CopyWithStubImpl$Mutation$CreateJourney$user(this._res);

  TRes _res;

  call({
    Fragment$Journey? create_journey,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$Journey<TRes> get create_journey =>
      CopyWith$Fragment$Journey.stub(_res);
}

class Variables$Mutation$DeleteJourney {
  factory Variables$Mutation$DeleteJourney({required String id}) =>
      Variables$Mutation$DeleteJourney._({
        r'id': id,
      });

  Variables$Mutation$DeleteJourney._(this._$data);

  factory Variables$Mutation$DeleteJourney.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Mutation$DeleteJourney._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$DeleteJourney<Variables$Mutation$DeleteJourney>
      get copyWith => CopyWith$Variables$Mutation$DeleteJourney(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$DeleteJourney ||
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

abstract class CopyWith$Variables$Mutation$DeleteJourney<TRes> {
  factory CopyWith$Variables$Mutation$DeleteJourney(
    Variables$Mutation$DeleteJourney instance,
    TRes Function(Variables$Mutation$DeleteJourney) then,
  ) = _CopyWithImpl$Variables$Mutation$DeleteJourney;

  factory CopyWith$Variables$Mutation$DeleteJourney.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DeleteJourney;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Mutation$DeleteJourney<TRes>
    implements CopyWith$Variables$Mutation$DeleteJourney<TRes> {
  _CopyWithImpl$Variables$Mutation$DeleteJourney(
    this._instance,
    this._then,
  );

  final Variables$Mutation$DeleteJourney _instance;

  final TRes Function(Variables$Mutation$DeleteJourney) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Mutation$DeleteJourney._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$DeleteJourney<TRes>
    implements CopyWith$Variables$Mutation$DeleteJourney<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DeleteJourney(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Mutation$DeleteJourney {
  Mutation$DeleteJourney({
    required this.user,
    this.$__typename = 'Mutation',
  });

  factory Mutation$DeleteJourney.fromJson(Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteJourney(
      user: Mutation$DeleteJourney$user.fromJson(
          (l$user as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$DeleteJourney$user user;

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
    if (other is! Mutation$DeleteJourney || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Mutation$DeleteJourney on Mutation$DeleteJourney {
  CopyWith$Mutation$DeleteJourney<Mutation$DeleteJourney> get copyWith =>
      CopyWith$Mutation$DeleteJourney(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$DeleteJourney<TRes> {
  factory CopyWith$Mutation$DeleteJourney(
    Mutation$DeleteJourney instance,
    TRes Function(Mutation$DeleteJourney) then,
  ) = _CopyWithImpl$Mutation$DeleteJourney;

  factory CopyWith$Mutation$DeleteJourney.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteJourney;

  TRes call({
    Mutation$DeleteJourney$user? user,
    String? $__typename,
  });
  CopyWith$Mutation$DeleteJourney$user<TRes> get user;
}

class _CopyWithImpl$Mutation$DeleteJourney<TRes>
    implements CopyWith$Mutation$DeleteJourney<TRes> {
  _CopyWithImpl$Mutation$DeleteJourney(
    this._instance,
    this._then,
  );

  final Mutation$DeleteJourney _instance;

  final TRes Function(Mutation$DeleteJourney) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$DeleteJourney(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Mutation$DeleteJourney$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$DeleteJourney$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Mutation$DeleteJourney$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Mutation$DeleteJourney<TRes>
    implements CopyWith$Mutation$DeleteJourney<TRes> {
  _CopyWithStubImpl$Mutation$DeleteJourney(this._res);

  TRes _res;

  call({
    Mutation$DeleteJourney$user? user,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$DeleteJourney$user<TRes> get user =>
      CopyWith$Mutation$DeleteJourney$user.stub(_res);
}

const documentNodeMutationDeleteJourney = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'DeleteJourney'),
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
            name: NameNode(value: 'delete_journey'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              )
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
Mutation$DeleteJourney _parserFn$Mutation$DeleteJourney(
        Map<String, dynamic> data) =>
    Mutation$DeleteJourney.fromJson(data);
typedef OnMutationCompleted$Mutation$DeleteJourney = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$DeleteJourney?,
);

class Options$Mutation$DeleteJourney
    extends graphql.MutationOptions<Mutation$DeleteJourney> {
  Options$Mutation$DeleteJourney({
    String? operationName,
    required Variables$Mutation$DeleteJourney variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteJourney? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteJourney? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteJourney>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$DeleteJourney(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationDeleteJourney,
          parserFn: _parserFn$Mutation$DeleteJourney,
        );

  final OnMutationCompleted$Mutation$DeleteJourney? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$DeleteJourney
    extends graphql.WatchQueryOptions<Mutation$DeleteJourney> {
  WatchOptions$Mutation$DeleteJourney({
    String? operationName,
    required Variables$Mutation$DeleteJourney variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteJourney? typedOptimisticResult,
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
          document: documentNodeMutationDeleteJourney,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$DeleteJourney,
        );
}

extension ClientExtension$Mutation$DeleteJourney on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$DeleteJourney>> mutate$DeleteJourney(
          Options$Mutation$DeleteJourney options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$DeleteJourney> watchMutation$DeleteJourney(
          WatchOptions$Mutation$DeleteJourney options) =>
      this.watchMutation(options);
}

class Mutation$DeleteJourney$HookResult {
  Mutation$DeleteJourney$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$DeleteJourney runMutation;

  final graphql.QueryResult<Mutation$DeleteJourney> result;
}

Mutation$DeleteJourney$HookResult useMutation$DeleteJourney(
    [WidgetOptions$Mutation$DeleteJourney? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$DeleteJourney());
  return Mutation$DeleteJourney$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$DeleteJourney> useWatchMutation$DeleteJourney(
        WatchOptions$Mutation$DeleteJourney options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$DeleteJourney
    extends graphql.MutationOptions<Mutation$DeleteJourney> {
  WidgetOptions$Mutation$DeleteJourney({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteJourney? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteJourney? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteJourney>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$DeleteJourney(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationDeleteJourney,
          parserFn: _parserFn$Mutation$DeleteJourney,
        );

  final OnMutationCompleted$Mutation$DeleteJourney? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$DeleteJourney
    = graphql.MultiSourceResult<Mutation$DeleteJourney> Function(
  Variables$Mutation$DeleteJourney, {
  Object? optimisticResult,
  Mutation$DeleteJourney? typedOptimisticResult,
});
typedef Builder$Mutation$DeleteJourney = widgets.Widget Function(
  RunMutation$Mutation$DeleteJourney,
  graphql.QueryResult<Mutation$DeleteJourney>?,
);

class Mutation$DeleteJourney$Widget
    extends graphql_flutter.Mutation<Mutation$DeleteJourney> {
  Mutation$DeleteJourney$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$DeleteJourney? options,
    required Builder$Mutation$DeleteJourney builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$DeleteJourney(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$DeleteJourney$user {
  Mutation$DeleteJourney$user({
    required this.delete_journey,
    this.$__typename = 'UserMutation',
  });

  factory Mutation$DeleteJourney$user.fromJson(Map<String, dynamic> json) {
    final l$delete_journey = json['delete_journey'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteJourney$user(
      delete_journey: (l$delete_journey as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool delete_journey;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delete_journey = delete_journey;
    _resultData['delete_journey'] = l$delete_journey;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delete_journey = delete_journey;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$delete_journey,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DeleteJourney$user ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delete_journey = delete_journey;
    final lOther$delete_journey = other.delete_journey;
    if (l$delete_journey != lOther$delete_journey) {
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

extension UtilityExtension$Mutation$DeleteJourney$user
    on Mutation$DeleteJourney$user {
  CopyWith$Mutation$DeleteJourney$user<Mutation$DeleteJourney$user>
      get copyWith => CopyWith$Mutation$DeleteJourney$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$DeleteJourney$user<TRes> {
  factory CopyWith$Mutation$DeleteJourney$user(
    Mutation$DeleteJourney$user instance,
    TRes Function(Mutation$DeleteJourney$user) then,
  ) = _CopyWithImpl$Mutation$DeleteJourney$user;

  factory CopyWith$Mutation$DeleteJourney$user.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteJourney$user;

  TRes call({
    bool? delete_journey,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$DeleteJourney$user<TRes>
    implements CopyWith$Mutation$DeleteJourney$user<TRes> {
  _CopyWithImpl$Mutation$DeleteJourney$user(
    this._instance,
    this._then,
  );

  final Mutation$DeleteJourney$user _instance;

  final TRes Function(Mutation$DeleteJourney$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? delete_journey = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$DeleteJourney$user(
        delete_journey: delete_journey == _undefined || delete_journey == null
            ? _instance.delete_journey
            : (delete_journey as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$DeleteJourney$user<TRes>
    implements CopyWith$Mutation$DeleteJourney$user<TRes> {
  _CopyWithStubImpl$Mutation$DeleteJourney$user(this._res);

  TRes _res;

  call({
    bool? delete_journey,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$UpdateJourney {
  factory Variables$Mutation$UpdateJourney({
    required String id,
    required Input$UpdateJourneyInput input,
  }) =>
      Variables$Mutation$UpdateJourney._({
        r'id': id,
        r'input': input,
      });

  Variables$Mutation$UpdateJourney._(this._$data);

  factory Variables$Mutation$UpdateJourney.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$input = data['input'];
    result$data['input'] =
        Input$UpdateJourneyInput.fromJson((l$input as Map<String, dynamic>));
    return Variables$Mutation$UpdateJourney._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Input$UpdateJourneyInput get input =>
      (_$data['input'] as Input$UpdateJourneyInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateJourney<Variables$Mutation$UpdateJourney>
      get copyWith => CopyWith$Variables$Mutation$UpdateJourney(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$UpdateJourney ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
    final l$id = id;
    final l$input = input;
    return Object.hashAll([
      l$id,
      l$input,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$UpdateJourney<TRes> {
  factory CopyWith$Variables$Mutation$UpdateJourney(
    Variables$Mutation$UpdateJourney instance,
    TRes Function(Variables$Mutation$UpdateJourney) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateJourney;

  factory CopyWith$Variables$Mutation$UpdateJourney.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateJourney;

  TRes call({
    String? id,
    Input$UpdateJourneyInput? input,
  });
}

class _CopyWithImpl$Variables$Mutation$UpdateJourney<TRes>
    implements CopyWith$Variables$Mutation$UpdateJourney<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateJourney(
    this._instance,
    this._then,
  );

  final Variables$Mutation$UpdateJourney _instance;

  final TRes Function(Variables$Mutation$UpdateJourney) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? input = _undefined,
  }) =>
      _then(Variables$Mutation$UpdateJourney._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
        if (input != _undefined && input != null)
          'input': (input as Input$UpdateJourneyInput),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$UpdateJourney<TRes>
    implements CopyWith$Variables$Mutation$UpdateJourney<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateJourney(this._res);

  TRes _res;

  call({
    String? id,
    Input$UpdateJourneyInput? input,
  }) =>
      _res;
}

class Mutation$UpdateJourney {
  Mutation$UpdateJourney({
    required this.user,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UpdateJourney.fromJson(Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateJourney(
      user: Mutation$UpdateJourney$user.fromJson(
          (l$user as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateJourney$user user;

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
    if (other is! Mutation$UpdateJourney || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Mutation$UpdateJourney on Mutation$UpdateJourney {
  CopyWith$Mutation$UpdateJourney<Mutation$UpdateJourney> get copyWith =>
      CopyWith$Mutation$UpdateJourney(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$UpdateJourney<TRes> {
  factory CopyWith$Mutation$UpdateJourney(
    Mutation$UpdateJourney instance,
    TRes Function(Mutation$UpdateJourney) then,
  ) = _CopyWithImpl$Mutation$UpdateJourney;

  factory CopyWith$Mutation$UpdateJourney.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateJourney;

  TRes call({
    Mutation$UpdateJourney$user? user,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateJourney$user<TRes> get user;
}

class _CopyWithImpl$Mutation$UpdateJourney<TRes>
    implements CopyWith$Mutation$UpdateJourney<TRes> {
  _CopyWithImpl$Mutation$UpdateJourney(
    this._instance,
    this._then,
  );

  final Mutation$UpdateJourney _instance;

  final TRes Function(Mutation$UpdateJourney) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateJourney(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Mutation$UpdateJourney$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$UpdateJourney$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Mutation$UpdateJourney$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Mutation$UpdateJourney<TRes>
    implements CopyWith$Mutation$UpdateJourney<TRes> {
  _CopyWithStubImpl$Mutation$UpdateJourney(this._res);

  TRes _res;

  call({
    Mutation$UpdateJourney$user? user,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$UpdateJourney$user<TRes> get user =>
      CopyWith$Mutation$UpdateJourney$user.stub(_res);
}

const documentNodeMutationUpdateJourney = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateJourney'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'UpdateJourneyInput'),
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
            name: NameNode(value: 'update_journey'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              ),
              ArgumentNode(
                name: NameNode(value: 'input'),
                value: VariableNode(name: NameNode(value: 'input')),
              ),
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
Mutation$UpdateJourney _parserFn$Mutation$UpdateJourney(
        Map<String, dynamic> data) =>
    Mutation$UpdateJourney.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateJourney = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$UpdateJourney?,
);

class Options$Mutation$UpdateJourney
    extends graphql.MutationOptions<Mutation$UpdateJourney> {
  Options$Mutation$UpdateJourney({
    String? operationName,
    required Variables$Mutation$UpdateJourney variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateJourney? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateJourney? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateJourney>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$UpdateJourney(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateJourney,
          parserFn: _parserFn$Mutation$UpdateJourney,
        );

  final OnMutationCompleted$Mutation$UpdateJourney? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$UpdateJourney
    extends graphql.WatchQueryOptions<Mutation$UpdateJourney> {
  WatchOptions$Mutation$UpdateJourney({
    String? operationName,
    required Variables$Mutation$UpdateJourney variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateJourney? typedOptimisticResult,
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
          document: documentNodeMutationUpdateJourney,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$UpdateJourney,
        );
}

extension ClientExtension$Mutation$UpdateJourney on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateJourney>> mutate$UpdateJourney(
          Options$Mutation$UpdateJourney options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$UpdateJourney> watchMutation$UpdateJourney(
          WatchOptions$Mutation$UpdateJourney options) =>
      this.watchMutation(options);
}

class Mutation$UpdateJourney$HookResult {
  Mutation$UpdateJourney$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$UpdateJourney runMutation;

  final graphql.QueryResult<Mutation$UpdateJourney> result;
}

Mutation$UpdateJourney$HookResult useMutation$UpdateJourney(
    [WidgetOptions$Mutation$UpdateJourney? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$UpdateJourney());
  return Mutation$UpdateJourney$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UpdateJourney> useWatchMutation$UpdateJourney(
        WatchOptions$Mutation$UpdateJourney options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UpdateJourney
    extends graphql.MutationOptions<Mutation$UpdateJourney> {
  WidgetOptions$Mutation$UpdateJourney({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateJourney? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateJourney? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateJourney>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$UpdateJourney(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateJourney,
          parserFn: _parserFn$Mutation$UpdateJourney,
        );

  final OnMutationCompleted$Mutation$UpdateJourney? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$UpdateJourney
    = graphql.MultiSourceResult<Mutation$UpdateJourney> Function(
  Variables$Mutation$UpdateJourney, {
  Object? optimisticResult,
  Mutation$UpdateJourney? typedOptimisticResult,
});
typedef Builder$Mutation$UpdateJourney = widgets.Widget Function(
  RunMutation$Mutation$UpdateJourney,
  graphql.QueryResult<Mutation$UpdateJourney>?,
);

class Mutation$UpdateJourney$Widget
    extends graphql_flutter.Mutation<Mutation$UpdateJourney> {
  Mutation$UpdateJourney$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$UpdateJourney? options,
    required Builder$Mutation$UpdateJourney builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$UpdateJourney(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$UpdateJourney$user {
  Mutation$UpdateJourney$user({
    required this.update_journey,
    this.$__typename = 'UserMutation',
  });

  factory Mutation$UpdateJourney$user.fromJson(Map<String, dynamic> json) {
    final l$update_journey = json['update_journey'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateJourney$user(
      update_journey:
          Fragment$Journey.fromJson((l$update_journey as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$Journey update_journey;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_journey = update_journey;
    _resultData['update_journey'] = l$update_journey.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_journey = update_journey;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_journey,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateJourney$user ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_journey = update_journey;
    final lOther$update_journey = other.update_journey;
    if (l$update_journey != lOther$update_journey) {
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

extension UtilityExtension$Mutation$UpdateJourney$user
    on Mutation$UpdateJourney$user {
  CopyWith$Mutation$UpdateJourney$user<Mutation$UpdateJourney$user>
      get copyWith => CopyWith$Mutation$UpdateJourney$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UpdateJourney$user<TRes> {
  factory CopyWith$Mutation$UpdateJourney$user(
    Mutation$UpdateJourney$user instance,
    TRes Function(Mutation$UpdateJourney$user) then,
  ) = _CopyWithImpl$Mutation$UpdateJourney$user;

  factory CopyWith$Mutation$UpdateJourney$user.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateJourney$user;

  TRes call({
    Fragment$Journey? update_journey,
    String? $__typename,
  });
  CopyWith$Fragment$Journey<TRes> get update_journey;
}

class _CopyWithImpl$Mutation$UpdateJourney$user<TRes>
    implements CopyWith$Mutation$UpdateJourney$user<TRes> {
  _CopyWithImpl$Mutation$UpdateJourney$user(
    this._instance,
    this._then,
  );

  final Mutation$UpdateJourney$user _instance;

  final TRes Function(Mutation$UpdateJourney$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? update_journey = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateJourney$user(
        update_journey: update_journey == _undefined || update_journey == null
            ? _instance.update_journey
            : (update_journey as Fragment$Journey),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$Journey<TRes> get update_journey {
    final local$update_journey = _instance.update_journey;
    return CopyWith$Fragment$Journey(
        local$update_journey, (e) => call(update_journey: e));
  }
}

class _CopyWithStubImpl$Mutation$UpdateJourney$user<TRes>
    implements CopyWith$Mutation$UpdateJourney$user<TRes> {
  _CopyWithStubImpl$Mutation$UpdateJourney$user(this._res);

  TRes _res;

  call({
    Fragment$Journey? update_journey,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$Journey<TRes> get update_journey =>
      CopyWith$Fragment$Journey.stub(_res);
}

class Variables$Mutation$AnswerMaterial {
  factory Variables$Mutation$AnswerMaterial(
          {required Input$AnswerMaterialInput input}) =>
      Variables$Mutation$AnswerMaterial._({
        r'input': input,
      });

  Variables$Mutation$AnswerMaterial._(this._$data);

  factory Variables$Mutation$AnswerMaterial.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] =
        Input$AnswerMaterialInput.fromJson((l$input as Map<String, dynamic>));
    return Variables$Mutation$AnswerMaterial._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$AnswerMaterialInput get input =>
      (_$data['input'] as Input$AnswerMaterialInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$AnswerMaterial<Variables$Mutation$AnswerMaterial>
      get copyWith => CopyWith$Variables$Mutation$AnswerMaterial(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$AnswerMaterial ||
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

abstract class CopyWith$Variables$Mutation$AnswerMaterial<TRes> {
  factory CopyWith$Variables$Mutation$AnswerMaterial(
    Variables$Mutation$AnswerMaterial instance,
    TRes Function(Variables$Mutation$AnswerMaterial) then,
  ) = _CopyWithImpl$Variables$Mutation$AnswerMaterial;

  factory CopyWith$Variables$Mutation$AnswerMaterial.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$AnswerMaterial;

  TRes call({Input$AnswerMaterialInput? input});
}

class _CopyWithImpl$Variables$Mutation$AnswerMaterial<TRes>
    implements CopyWith$Variables$Mutation$AnswerMaterial<TRes> {
  _CopyWithImpl$Variables$Mutation$AnswerMaterial(
    this._instance,
    this._then,
  );

  final Variables$Mutation$AnswerMaterial _instance;

  final TRes Function(Variables$Mutation$AnswerMaterial) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) =>
      _then(Variables$Mutation$AnswerMaterial._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$AnswerMaterialInput),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$AnswerMaterial<TRes>
    implements CopyWith$Variables$Mutation$AnswerMaterial<TRes> {
  _CopyWithStubImpl$Variables$Mutation$AnswerMaterial(this._res);

  TRes _res;

  call({Input$AnswerMaterialInput? input}) => _res;
}

class Mutation$AnswerMaterial {
  Mutation$AnswerMaterial({
    required this.user,
    this.$__typename = 'Mutation',
  });

  factory Mutation$AnswerMaterial.fromJson(Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Mutation$AnswerMaterial(
      user: Mutation$AnswerMaterial$user.fromJson(
          (l$user as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$AnswerMaterial$user user;

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
    if (other is! Mutation$AnswerMaterial || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Mutation$AnswerMaterial on Mutation$AnswerMaterial {
  CopyWith$Mutation$AnswerMaterial<Mutation$AnswerMaterial> get copyWith =>
      CopyWith$Mutation$AnswerMaterial(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$AnswerMaterial<TRes> {
  factory CopyWith$Mutation$AnswerMaterial(
    Mutation$AnswerMaterial instance,
    TRes Function(Mutation$AnswerMaterial) then,
  ) = _CopyWithImpl$Mutation$AnswerMaterial;

  factory CopyWith$Mutation$AnswerMaterial.stub(TRes res) =
      _CopyWithStubImpl$Mutation$AnswerMaterial;

  TRes call({
    Mutation$AnswerMaterial$user? user,
    String? $__typename,
  });
  CopyWith$Mutation$AnswerMaterial$user<TRes> get user;
}

class _CopyWithImpl$Mutation$AnswerMaterial<TRes>
    implements CopyWith$Mutation$AnswerMaterial<TRes> {
  _CopyWithImpl$Mutation$AnswerMaterial(
    this._instance,
    this._then,
  );

  final Mutation$AnswerMaterial _instance;

  final TRes Function(Mutation$AnswerMaterial) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$AnswerMaterial(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Mutation$AnswerMaterial$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$AnswerMaterial$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Mutation$AnswerMaterial$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Mutation$AnswerMaterial<TRes>
    implements CopyWith$Mutation$AnswerMaterial<TRes> {
  _CopyWithStubImpl$Mutation$AnswerMaterial(this._res);

  TRes _res;

  call({
    Mutation$AnswerMaterial$user? user,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$AnswerMaterial$user<TRes> get user =>
      CopyWith$Mutation$AnswerMaterial$user.stub(_res);
}

const documentNodeMutationAnswerMaterial = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'AnswerMaterial'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'AnswerMaterialInput'),
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
            name: NameNode(value: 'answer_material'),
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
                name: NameNode(value: 'AnswerMaterialResponse'),
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
  fragmentDefinitionAnswerMaterialResponse,
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
Mutation$AnswerMaterial _parserFn$Mutation$AnswerMaterial(
        Map<String, dynamic> data) =>
    Mutation$AnswerMaterial.fromJson(data);
typedef OnMutationCompleted$Mutation$AnswerMaterial = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$AnswerMaterial?,
);

class Options$Mutation$AnswerMaterial
    extends graphql.MutationOptions<Mutation$AnswerMaterial> {
  Options$Mutation$AnswerMaterial({
    String? operationName,
    required Variables$Mutation$AnswerMaterial variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AnswerMaterial? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$AnswerMaterial? onCompleted,
    graphql.OnMutationUpdate<Mutation$AnswerMaterial>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$AnswerMaterial(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationAnswerMaterial,
          parserFn: _parserFn$Mutation$AnswerMaterial,
        );

  final OnMutationCompleted$Mutation$AnswerMaterial? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$AnswerMaterial
    extends graphql.WatchQueryOptions<Mutation$AnswerMaterial> {
  WatchOptions$Mutation$AnswerMaterial({
    String? operationName,
    required Variables$Mutation$AnswerMaterial variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AnswerMaterial? typedOptimisticResult,
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
          document: documentNodeMutationAnswerMaterial,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$AnswerMaterial,
        );
}

extension ClientExtension$Mutation$AnswerMaterial on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$AnswerMaterial>> mutate$AnswerMaterial(
          Options$Mutation$AnswerMaterial options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$AnswerMaterial> watchMutation$AnswerMaterial(
          WatchOptions$Mutation$AnswerMaterial options) =>
      this.watchMutation(options);
}

class Mutation$AnswerMaterial$HookResult {
  Mutation$AnswerMaterial$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$AnswerMaterial runMutation;

  final graphql.QueryResult<Mutation$AnswerMaterial> result;
}

Mutation$AnswerMaterial$HookResult useMutation$AnswerMaterial(
    [WidgetOptions$Mutation$AnswerMaterial? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$AnswerMaterial());
  return Mutation$AnswerMaterial$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$AnswerMaterial>
    useWatchMutation$AnswerMaterial(
            WatchOptions$Mutation$AnswerMaterial options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$AnswerMaterial
    extends graphql.MutationOptions<Mutation$AnswerMaterial> {
  WidgetOptions$Mutation$AnswerMaterial({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AnswerMaterial? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$AnswerMaterial? onCompleted,
    graphql.OnMutationUpdate<Mutation$AnswerMaterial>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$AnswerMaterial(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationAnswerMaterial,
          parserFn: _parserFn$Mutation$AnswerMaterial,
        );

  final OnMutationCompleted$Mutation$AnswerMaterial? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$AnswerMaterial
    = graphql.MultiSourceResult<Mutation$AnswerMaterial> Function(
  Variables$Mutation$AnswerMaterial, {
  Object? optimisticResult,
  Mutation$AnswerMaterial? typedOptimisticResult,
});
typedef Builder$Mutation$AnswerMaterial = widgets.Widget Function(
  RunMutation$Mutation$AnswerMaterial,
  graphql.QueryResult<Mutation$AnswerMaterial>?,
);

class Mutation$AnswerMaterial$Widget
    extends graphql_flutter.Mutation<Mutation$AnswerMaterial> {
  Mutation$AnswerMaterial$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$AnswerMaterial? options,
    required Builder$Mutation$AnswerMaterial builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$AnswerMaterial(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$AnswerMaterial$user {
  Mutation$AnswerMaterial$user({
    required this.answer_material,
    this.$__typename = 'UserMutation',
  });

  factory Mutation$AnswerMaterial$user.fromJson(Map<String, dynamic> json) {
    final l$answer_material = json['answer_material'];
    final l$$__typename = json['__typename'];
    return Mutation$AnswerMaterial$user(
      answer_material: Fragment$AnswerMaterialResponse.fromJson(
          (l$answer_material as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$AnswerMaterialResponse answer_material;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$answer_material = answer_material;
    _resultData['answer_material'] = l$answer_material.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$answer_material = answer_material;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$answer_material,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$AnswerMaterial$user ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$answer_material = answer_material;
    final lOther$answer_material = other.answer_material;
    if (l$answer_material != lOther$answer_material) {
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

extension UtilityExtension$Mutation$AnswerMaterial$user
    on Mutation$AnswerMaterial$user {
  CopyWith$Mutation$AnswerMaterial$user<Mutation$AnswerMaterial$user>
      get copyWith => CopyWith$Mutation$AnswerMaterial$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$AnswerMaterial$user<TRes> {
  factory CopyWith$Mutation$AnswerMaterial$user(
    Mutation$AnswerMaterial$user instance,
    TRes Function(Mutation$AnswerMaterial$user) then,
  ) = _CopyWithImpl$Mutation$AnswerMaterial$user;

  factory CopyWith$Mutation$AnswerMaterial$user.stub(TRes res) =
      _CopyWithStubImpl$Mutation$AnswerMaterial$user;

  TRes call({
    Fragment$AnswerMaterialResponse? answer_material,
    String? $__typename,
  });
  CopyWith$Fragment$AnswerMaterialResponse<TRes> get answer_material;
}

class _CopyWithImpl$Mutation$AnswerMaterial$user<TRes>
    implements CopyWith$Mutation$AnswerMaterial$user<TRes> {
  _CopyWithImpl$Mutation$AnswerMaterial$user(
    this._instance,
    this._then,
  );

  final Mutation$AnswerMaterial$user _instance;

  final TRes Function(Mutation$AnswerMaterial$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? answer_material = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$AnswerMaterial$user(
        answer_material:
            answer_material == _undefined || answer_material == null
                ? _instance.answer_material
                : (answer_material as Fragment$AnswerMaterialResponse),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$AnswerMaterialResponse<TRes> get answer_material {
    final local$answer_material = _instance.answer_material;
    return CopyWith$Fragment$AnswerMaterialResponse(
        local$answer_material, (e) => call(answer_material: e));
  }
}

class _CopyWithStubImpl$Mutation$AnswerMaterial$user<TRes>
    implements CopyWith$Mutation$AnswerMaterial$user<TRes> {
  _CopyWithStubImpl$Mutation$AnswerMaterial$user(this._res);

  TRes _res;

  call({
    Fragment$AnswerMaterialResponse? answer_material,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$AnswerMaterialResponse<TRes> get answer_material =>
      CopyWith$Fragment$AnswerMaterialResponse.stub(_res);
}

class Variables$Mutation$AddUserInput {
  factory Variables$Mutation$AddUserInput(
          {required Input$AddUserInputInput input}) =>
      Variables$Mutation$AddUserInput._({
        r'input': input,
      });

  Variables$Mutation$AddUserInput._(this._$data);

  factory Variables$Mutation$AddUserInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] =
        Input$AddUserInputInput.fromJson((l$input as Map<String, dynamic>));
    return Variables$Mutation$AddUserInput._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$AddUserInputInput get input =>
      (_$data['input'] as Input$AddUserInputInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$AddUserInput<Variables$Mutation$AddUserInput>
      get copyWith => CopyWith$Variables$Mutation$AddUserInput(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$AddUserInput ||
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

abstract class CopyWith$Variables$Mutation$AddUserInput<TRes> {
  factory CopyWith$Variables$Mutation$AddUserInput(
    Variables$Mutation$AddUserInput instance,
    TRes Function(Variables$Mutation$AddUserInput) then,
  ) = _CopyWithImpl$Variables$Mutation$AddUserInput;

  factory CopyWith$Variables$Mutation$AddUserInput.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$AddUserInput;

  TRes call({Input$AddUserInputInput? input});
}

class _CopyWithImpl$Variables$Mutation$AddUserInput<TRes>
    implements CopyWith$Variables$Mutation$AddUserInput<TRes> {
  _CopyWithImpl$Variables$Mutation$AddUserInput(
    this._instance,
    this._then,
  );

  final Variables$Mutation$AddUserInput _instance;

  final TRes Function(Variables$Mutation$AddUserInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) =>
      _then(Variables$Mutation$AddUserInput._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$AddUserInputInput),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$AddUserInput<TRes>
    implements CopyWith$Variables$Mutation$AddUserInput<TRes> {
  _CopyWithStubImpl$Variables$Mutation$AddUserInput(this._res);

  TRes _res;

  call({Input$AddUserInputInput? input}) => _res;
}

class Mutation$AddUserInput {
  Mutation$AddUserInput({
    required this.user,
    this.$__typename = 'Mutation',
  });

  factory Mutation$AddUserInput.fromJson(Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Mutation$AddUserInput(
      user:
          Mutation$AddUserInput$user.fromJson((l$user as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$AddUserInput$user user;

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
    if (other is! Mutation$AddUserInput || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Mutation$AddUserInput on Mutation$AddUserInput {
  CopyWith$Mutation$AddUserInput<Mutation$AddUserInput> get copyWith =>
      CopyWith$Mutation$AddUserInput(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$AddUserInput<TRes> {
  factory CopyWith$Mutation$AddUserInput(
    Mutation$AddUserInput instance,
    TRes Function(Mutation$AddUserInput) then,
  ) = _CopyWithImpl$Mutation$AddUserInput;

  factory CopyWith$Mutation$AddUserInput.stub(TRes res) =
      _CopyWithStubImpl$Mutation$AddUserInput;

  TRes call({
    Mutation$AddUserInput$user? user,
    String? $__typename,
  });
  CopyWith$Mutation$AddUserInput$user<TRes> get user;
}

class _CopyWithImpl$Mutation$AddUserInput<TRes>
    implements CopyWith$Mutation$AddUserInput<TRes> {
  _CopyWithImpl$Mutation$AddUserInput(
    this._instance,
    this._then,
  );

  final Mutation$AddUserInput _instance;

  final TRes Function(Mutation$AddUserInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$AddUserInput(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Mutation$AddUserInput$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$AddUserInput$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Mutation$AddUserInput$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Mutation$AddUserInput<TRes>
    implements CopyWith$Mutation$AddUserInput<TRes> {
  _CopyWithStubImpl$Mutation$AddUserInput(this._res);

  TRes _res;

  call({
    Mutation$AddUserInput$user? user,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$AddUserInput$user<TRes> get user =>
      CopyWith$Mutation$AddUserInput$user.stub(_res);
}

const documentNodeMutationAddUserInput = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'AddUserInput'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'AddUserInputInput'),
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
            name: NameNode(value: 'add_user_input'),
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
Mutation$AddUserInput _parserFn$Mutation$AddUserInput(
        Map<String, dynamic> data) =>
    Mutation$AddUserInput.fromJson(data);
typedef OnMutationCompleted$Mutation$AddUserInput = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$AddUserInput?,
);

class Options$Mutation$AddUserInput
    extends graphql.MutationOptions<Mutation$AddUserInput> {
  Options$Mutation$AddUserInput({
    String? operationName,
    required Variables$Mutation$AddUserInput variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AddUserInput? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$AddUserInput? onCompleted,
    graphql.OnMutationUpdate<Mutation$AddUserInput>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$AddUserInput(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationAddUserInput,
          parserFn: _parserFn$Mutation$AddUserInput,
        );

  final OnMutationCompleted$Mutation$AddUserInput? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$AddUserInput
    extends graphql.WatchQueryOptions<Mutation$AddUserInput> {
  WatchOptions$Mutation$AddUserInput({
    String? operationName,
    required Variables$Mutation$AddUserInput variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AddUserInput? typedOptimisticResult,
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
          document: documentNodeMutationAddUserInput,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$AddUserInput,
        );
}

extension ClientExtension$Mutation$AddUserInput on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$AddUserInput>> mutate$AddUserInput(
          Options$Mutation$AddUserInput options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$AddUserInput> watchMutation$AddUserInput(
          WatchOptions$Mutation$AddUserInput options) =>
      this.watchMutation(options);
}

class Mutation$AddUserInput$HookResult {
  Mutation$AddUserInput$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$AddUserInput runMutation;

  final graphql.QueryResult<Mutation$AddUserInput> result;
}

Mutation$AddUserInput$HookResult useMutation$AddUserInput(
    [WidgetOptions$Mutation$AddUserInput? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$AddUserInput());
  return Mutation$AddUserInput$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$AddUserInput> useWatchMutation$AddUserInput(
        WatchOptions$Mutation$AddUserInput options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$AddUserInput
    extends graphql.MutationOptions<Mutation$AddUserInput> {
  WidgetOptions$Mutation$AddUserInput({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AddUserInput? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$AddUserInput? onCompleted,
    graphql.OnMutationUpdate<Mutation$AddUserInput>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$AddUserInput(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationAddUserInput,
          parserFn: _parserFn$Mutation$AddUserInput,
        );

  final OnMutationCompleted$Mutation$AddUserInput? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$AddUserInput
    = graphql.MultiSourceResult<Mutation$AddUserInput> Function(
  Variables$Mutation$AddUserInput, {
  Object? optimisticResult,
  Mutation$AddUserInput? typedOptimisticResult,
});
typedef Builder$Mutation$AddUserInput = widgets.Widget Function(
  RunMutation$Mutation$AddUserInput,
  graphql.QueryResult<Mutation$AddUserInput>?,
);

class Mutation$AddUserInput$Widget
    extends graphql_flutter.Mutation<Mutation$AddUserInput> {
  Mutation$AddUserInput$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$AddUserInput? options,
    required Builder$Mutation$AddUserInput builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$AddUserInput(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$AddUserInput$user {
  Mutation$AddUserInput$user({
    required this.add_user_input,
    this.$__typename = 'UserMutation',
  });

  factory Mutation$AddUserInput$user.fromJson(Map<String, dynamic> json) {
    final l$add_user_input = json['add_user_input'];
    final l$$__typename = json['__typename'];
    return Mutation$AddUserInput$user(
      add_user_input: Fragment$ConversationTurn.fromJson(
          (l$add_user_input as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$ConversationTurn add_user_input;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$add_user_input = add_user_input;
    _resultData['add_user_input'] = l$add_user_input.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$add_user_input = add_user_input;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$add_user_input,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$AddUserInput$user ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$add_user_input = add_user_input;
    final lOther$add_user_input = other.add_user_input;
    if (l$add_user_input != lOther$add_user_input) {
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

extension UtilityExtension$Mutation$AddUserInput$user
    on Mutation$AddUserInput$user {
  CopyWith$Mutation$AddUserInput$user<Mutation$AddUserInput$user>
      get copyWith => CopyWith$Mutation$AddUserInput$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$AddUserInput$user<TRes> {
  factory CopyWith$Mutation$AddUserInput$user(
    Mutation$AddUserInput$user instance,
    TRes Function(Mutation$AddUserInput$user) then,
  ) = _CopyWithImpl$Mutation$AddUserInput$user;

  factory CopyWith$Mutation$AddUserInput$user.stub(TRes res) =
      _CopyWithStubImpl$Mutation$AddUserInput$user;

  TRes call({
    Fragment$ConversationTurn? add_user_input,
    String? $__typename,
  });
  CopyWith$Fragment$ConversationTurn<TRes> get add_user_input;
}

class _CopyWithImpl$Mutation$AddUserInput$user<TRes>
    implements CopyWith$Mutation$AddUserInput$user<TRes> {
  _CopyWithImpl$Mutation$AddUserInput$user(
    this._instance,
    this._then,
  );

  final Mutation$AddUserInput$user _instance;

  final TRes Function(Mutation$AddUserInput$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? add_user_input = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$AddUserInput$user(
        add_user_input: add_user_input == _undefined || add_user_input == null
            ? _instance.add_user_input
            : (add_user_input as Fragment$ConversationTurn),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$ConversationTurn<TRes> get add_user_input {
    final local$add_user_input = _instance.add_user_input;
    return CopyWith$Fragment$ConversationTurn(
        local$add_user_input, (e) => call(add_user_input: e));
  }
}

class _CopyWithStubImpl$Mutation$AddUserInput$user<TRes>
    implements CopyWith$Mutation$AddUserInput$user<TRes> {
  _CopyWithStubImpl$Mutation$AddUserInput$user(this._res);

  TRes _res;

  call({
    Fragment$ConversationTurn? add_user_input,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$ConversationTurn<TRes> get add_user_input =>
      CopyWith$Fragment$ConversationTurn.stub(_res);
}

class Variables$Mutation$SetNextPart {
  factory Variables$Mutation$SetNextPart({
    required String stageId,
    required int $part,
  }) =>
      Variables$Mutation$SetNextPart._({
        r'stageId': stageId,
        r'part': $part,
      });

  Variables$Mutation$SetNextPart._(this._$data);

  factory Variables$Mutation$SetNextPart.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$stageId = data['stageId'];
    result$data['stageId'] = (l$stageId as String);
    final l$$part = data['part'];
    result$data['part'] = (l$$part as int);
    return Variables$Mutation$SetNextPart._(result$data);
  }

  Map<String, dynamic> _$data;

  String get stageId => (_$data['stageId'] as String);

  int get $part => (_$data['part'] as int);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$stageId = stageId;
    result$data['stageId'] = l$stageId;
    final l$$part = $part;
    result$data['part'] = l$$part;
    return result$data;
  }

  CopyWith$Variables$Mutation$SetNextPart<Variables$Mutation$SetNextPart>
      get copyWith => CopyWith$Variables$Mutation$SetNextPart(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$SetNextPart ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$stageId = stageId;
    final lOther$stageId = other.stageId;
    if (l$stageId != lOther$stageId) {
      return false;
    }
    final l$$part = $part;
    final lOther$$part = other.$part;
    if (l$$part != lOther$$part) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$stageId = stageId;
    final l$$part = $part;
    return Object.hashAll([
      l$stageId,
      l$$part,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$SetNextPart<TRes> {
  factory CopyWith$Variables$Mutation$SetNextPart(
    Variables$Mutation$SetNextPart instance,
    TRes Function(Variables$Mutation$SetNextPart) then,
  ) = _CopyWithImpl$Variables$Mutation$SetNextPart;

  factory CopyWith$Variables$Mutation$SetNextPart.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$SetNextPart;

  TRes call({
    String? stageId,
    int? $part,
  });
}

class _CopyWithImpl$Variables$Mutation$SetNextPart<TRes>
    implements CopyWith$Variables$Mutation$SetNextPart<TRes> {
  _CopyWithImpl$Variables$Mutation$SetNextPart(
    this._instance,
    this._then,
  );

  final Variables$Mutation$SetNextPart _instance;

  final TRes Function(Variables$Mutation$SetNextPart) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? stageId = _undefined,
    Object? $part = _undefined,
  }) =>
      _then(Variables$Mutation$SetNextPart._({
        ..._instance._$data,
        if (stageId != _undefined && stageId != null)
          'stageId': (stageId as String),
        if ($part != _undefined && $part != null) 'part': ($part as int),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$SetNextPart<TRes>
    implements CopyWith$Variables$Mutation$SetNextPart<TRes> {
  _CopyWithStubImpl$Variables$Mutation$SetNextPart(this._res);

  TRes _res;

  call({
    String? stageId,
    int? $part,
  }) =>
      _res;
}

class Mutation$SetNextPart {
  Mutation$SetNextPart({
    required this.user,
    this.$__typename = 'Mutation',
  });

  factory Mutation$SetNextPart.fromJson(Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Mutation$SetNextPart(
      user:
          Mutation$SetNextPart$user.fromJson((l$user as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$SetNextPart$user user;

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
    if (other is! Mutation$SetNextPart || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Mutation$SetNextPart on Mutation$SetNextPart {
  CopyWith$Mutation$SetNextPart<Mutation$SetNextPart> get copyWith =>
      CopyWith$Mutation$SetNextPart(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$SetNextPart<TRes> {
  factory CopyWith$Mutation$SetNextPart(
    Mutation$SetNextPart instance,
    TRes Function(Mutation$SetNextPart) then,
  ) = _CopyWithImpl$Mutation$SetNextPart;

  factory CopyWith$Mutation$SetNextPart.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SetNextPart;

  TRes call({
    Mutation$SetNextPart$user? user,
    String? $__typename,
  });
  CopyWith$Mutation$SetNextPart$user<TRes> get user;
}

class _CopyWithImpl$Mutation$SetNextPart<TRes>
    implements CopyWith$Mutation$SetNextPart<TRes> {
  _CopyWithImpl$Mutation$SetNextPart(
    this._instance,
    this._then,
  );

  final Mutation$SetNextPart _instance;

  final TRes Function(Mutation$SetNextPart) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SetNextPart(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Mutation$SetNextPart$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SetNextPart$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Mutation$SetNextPart$user(local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Mutation$SetNextPart<TRes>
    implements CopyWith$Mutation$SetNextPart<TRes> {
  _CopyWithStubImpl$Mutation$SetNextPart(this._res);

  TRes _res;

  call({
    Mutation$SetNextPart$user? user,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SetNextPart$user<TRes> get user =>
      CopyWith$Mutation$SetNextPart$user.stub(_res);
}

const documentNodeMutationSetNextPart = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'SetNextPart'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'stageId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'part')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
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
            name: NameNode(value: 'set_next_part'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'stageId'),
                value: VariableNode(name: NameNode(value: 'stageId')),
              ),
              ArgumentNode(
                name: NameNode(value: 'part'),
                value: VariableNode(name: NameNode(value: 'part')),
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
Mutation$SetNextPart _parserFn$Mutation$SetNextPart(
        Map<String, dynamic> data) =>
    Mutation$SetNextPart.fromJson(data);
typedef OnMutationCompleted$Mutation$SetNextPart = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$SetNextPart?,
);

class Options$Mutation$SetNextPart
    extends graphql.MutationOptions<Mutation$SetNextPart> {
  Options$Mutation$SetNextPart({
    String? operationName,
    required Variables$Mutation$SetNextPart variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SetNextPart? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SetNextPart? onCompleted,
    graphql.OnMutationUpdate<Mutation$SetNextPart>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$SetNextPart(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSetNextPart,
          parserFn: _parserFn$Mutation$SetNextPart,
        );

  final OnMutationCompleted$Mutation$SetNextPart? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$SetNextPart
    extends graphql.WatchQueryOptions<Mutation$SetNextPart> {
  WatchOptions$Mutation$SetNextPart({
    String? operationName,
    required Variables$Mutation$SetNextPart variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SetNextPart? typedOptimisticResult,
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
          document: documentNodeMutationSetNextPart,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$SetNextPart,
        );
}

extension ClientExtension$Mutation$SetNextPart on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$SetNextPart>> mutate$SetNextPart(
          Options$Mutation$SetNextPart options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$SetNextPart> watchMutation$SetNextPart(
          WatchOptions$Mutation$SetNextPart options) =>
      this.watchMutation(options);
}

class Mutation$SetNextPart$HookResult {
  Mutation$SetNextPart$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$SetNextPart runMutation;

  final graphql.QueryResult<Mutation$SetNextPart> result;
}

Mutation$SetNextPart$HookResult useMutation$SetNextPart(
    [WidgetOptions$Mutation$SetNextPart? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$SetNextPart());
  return Mutation$SetNextPart$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$SetNextPart> useWatchMutation$SetNextPart(
        WatchOptions$Mutation$SetNextPart options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$SetNextPart
    extends graphql.MutationOptions<Mutation$SetNextPart> {
  WidgetOptions$Mutation$SetNextPart({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SetNextPart? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SetNextPart? onCompleted,
    graphql.OnMutationUpdate<Mutation$SetNextPart>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$SetNextPart(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSetNextPart,
          parserFn: _parserFn$Mutation$SetNextPart,
        );

  final OnMutationCompleted$Mutation$SetNextPart? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$SetNextPart
    = graphql.MultiSourceResult<Mutation$SetNextPart> Function(
  Variables$Mutation$SetNextPart, {
  Object? optimisticResult,
  Mutation$SetNextPart? typedOptimisticResult,
});
typedef Builder$Mutation$SetNextPart = widgets.Widget Function(
  RunMutation$Mutation$SetNextPart,
  graphql.QueryResult<Mutation$SetNextPart>?,
);

class Mutation$SetNextPart$Widget
    extends graphql_flutter.Mutation<Mutation$SetNextPart> {
  Mutation$SetNextPart$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$SetNextPart? options,
    required Builder$Mutation$SetNextPart builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$SetNextPart(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$SetNextPart$user {
  Mutation$SetNextPart$user({
    required this.set_next_part,
    this.$__typename = 'UserMutation',
  });

  factory Mutation$SetNextPart$user.fromJson(Map<String, dynamic> json) {
    final l$set_next_part = json['set_next_part'];
    final l$$__typename = json['__typename'];
    return Mutation$SetNextPart$user(
      set_next_part: (l$set_next_part as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool set_next_part;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$set_next_part = set_next_part;
    _resultData['set_next_part'] = l$set_next_part;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$set_next_part = set_next_part;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$set_next_part,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$SetNextPart$user ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$set_next_part = set_next_part;
    final lOther$set_next_part = other.set_next_part;
    if (l$set_next_part != lOther$set_next_part) {
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

extension UtilityExtension$Mutation$SetNextPart$user
    on Mutation$SetNextPart$user {
  CopyWith$Mutation$SetNextPart$user<Mutation$SetNextPart$user> get copyWith =>
      CopyWith$Mutation$SetNextPart$user(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$SetNextPart$user<TRes> {
  factory CopyWith$Mutation$SetNextPart$user(
    Mutation$SetNextPart$user instance,
    TRes Function(Mutation$SetNextPart$user) then,
  ) = _CopyWithImpl$Mutation$SetNextPart$user;

  factory CopyWith$Mutation$SetNextPart$user.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SetNextPart$user;

  TRes call({
    bool? set_next_part,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$SetNextPart$user<TRes>
    implements CopyWith$Mutation$SetNextPart$user<TRes> {
  _CopyWithImpl$Mutation$SetNextPart$user(
    this._instance,
    this._then,
  );

  final Mutation$SetNextPart$user _instance;

  final TRes Function(Mutation$SetNextPart$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? set_next_part = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SetNextPart$user(
        set_next_part: set_next_part == _undefined || set_next_part == null
            ? _instance.set_next_part
            : (set_next_part as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$SetNextPart$user<TRes>
    implements CopyWith$Mutation$SetNextPart$user<TRes> {
  _CopyWithStubImpl$Mutation$SetNextPart$user(this._res);

  TRes _res;

  call({
    bool? set_next_part,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$PracticeSentence {
  factory Variables$Mutation$PracticeSentence({
    required String stageId,
    required String ref,
  }) =>
      Variables$Mutation$PracticeSentence._({
        r'stageId': stageId,
        r'ref': ref,
      });

  Variables$Mutation$PracticeSentence._(this._$data);

  factory Variables$Mutation$PracticeSentence.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$stageId = data['stageId'];
    result$data['stageId'] = (l$stageId as String);
    final l$ref = data['ref'];
    result$data['ref'] = (l$ref as String);
    return Variables$Mutation$PracticeSentence._(result$data);
  }

  Map<String, dynamic> _$data;

  String get stageId => (_$data['stageId'] as String);

  String get ref => (_$data['ref'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$stageId = stageId;
    result$data['stageId'] = l$stageId;
    final l$ref = ref;
    result$data['ref'] = l$ref;
    return result$data;
  }

  CopyWith$Variables$Mutation$PracticeSentence<
          Variables$Mutation$PracticeSentence>
      get copyWith => CopyWith$Variables$Mutation$PracticeSentence(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$PracticeSentence ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$stageId = stageId;
    final lOther$stageId = other.stageId;
    if (l$stageId != lOther$stageId) {
      return false;
    }
    final l$ref = ref;
    final lOther$ref = other.ref;
    if (l$ref != lOther$ref) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$stageId = stageId;
    final l$ref = ref;
    return Object.hashAll([
      l$stageId,
      l$ref,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$PracticeSentence<TRes> {
  factory CopyWith$Variables$Mutation$PracticeSentence(
    Variables$Mutation$PracticeSentence instance,
    TRes Function(Variables$Mutation$PracticeSentence) then,
  ) = _CopyWithImpl$Variables$Mutation$PracticeSentence;

  factory CopyWith$Variables$Mutation$PracticeSentence.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$PracticeSentence;

  TRes call({
    String? stageId,
    String? ref,
  });
}

class _CopyWithImpl$Variables$Mutation$PracticeSentence<TRes>
    implements CopyWith$Variables$Mutation$PracticeSentence<TRes> {
  _CopyWithImpl$Variables$Mutation$PracticeSentence(
    this._instance,
    this._then,
  );

  final Variables$Mutation$PracticeSentence _instance;

  final TRes Function(Variables$Mutation$PracticeSentence) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? stageId = _undefined,
    Object? ref = _undefined,
  }) =>
      _then(Variables$Mutation$PracticeSentence._({
        ..._instance._$data,
        if (stageId != _undefined && stageId != null)
          'stageId': (stageId as String),
        if (ref != _undefined && ref != null) 'ref': (ref as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$PracticeSentence<TRes>
    implements CopyWith$Variables$Mutation$PracticeSentence<TRes> {
  _CopyWithStubImpl$Variables$Mutation$PracticeSentence(this._res);

  TRes _res;

  call({
    String? stageId,
    String? ref,
  }) =>
      _res;
}

class Mutation$PracticeSentence {
  Mutation$PracticeSentence({
    required this.user,
    this.$__typename = 'Mutation',
  });

  factory Mutation$PracticeSentence.fromJson(Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Mutation$PracticeSentence(
      user: Mutation$PracticeSentence$user.fromJson(
          (l$user as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$PracticeSentence$user user;

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
    if (other is! Mutation$PracticeSentence ||
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

extension UtilityExtension$Mutation$PracticeSentence
    on Mutation$PracticeSentence {
  CopyWith$Mutation$PracticeSentence<Mutation$PracticeSentence> get copyWith =>
      CopyWith$Mutation$PracticeSentence(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$PracticeSentence<TRes> {
  factory CopyWith$Mutation$PracticeSentence(
    Mutation$PracticeSentence instance,
    TRes Function(Mutation$PracticeSentence) then,
  ) = _CopyWithImpl$Mutation$PracticeSentence;

  factory CopyWith$Mutation$PracticeSentence.stub(TRes res) =
      _CopyWithStubImpl$Mutation$PracticeSentence;

  TRes call({
    Mutation$PracticeSentence$user? user,
    String? $__typename,
  });
  CopyWith$Mutation$PracticeSentence$user<TRes> get user;
}

class _CopyWithImpl$Mutation$PracticeSentence<TRes>
    implements CopyWith$Mutation$PracticeSentence<TRes> {
  _CopyWithImpl$Mutation$PracticeSentence(
    this._instance,
    this._then,
  );

  final Mutation$PracticeSentence _instance;

  final TRes Function(Mutation$PracticeSentence) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$PracticeSentence(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Mutation$PracticeSentence$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$PracticeSentence$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Mutation$PracticeSentence$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Mutation$PracticeSentence<TRes>
    implements CopyWith$Mutation$PracticeSentence<TRes> {
  _CopyWithStubImpl$Mutation$PracticeSentence(this._res);

  TRes _res;

  call({
    Mutation$PracticeSentence$user? user,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$PracticeSentence$user<TRes> get user =>
      CopyWith$Mutation$PracticeSentence$user.stub(_res);
}

const documentNodeMutationPracticeSentence = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'PracticeSentence'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'stageId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'ref')),
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
            name: NameNode(value: 'practice_sentence'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'stageId'),
                value: VariableNode(name: NameNode(value: 'stageId')),
              ),
              ArgumentNode(
                name: NameNode(value: 'ref'),
                value: VariableNode(name: NameNode(value: 'ref')),
              ),
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
Mutation$PracticeSentence _parserFn$Mutation$PracticeSentence(
        Map<String, dynamic> data) =>
    Mutation$PracticeSentence.fromJson(data);
typedef OnMutationCompleted$Mutation$PracticeSentence = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$PracticeSentence?,
);

class Options$Mutation$PracticeSentence
    extends graphql.MutationOptions<Mutation$PracticeSentence> {
  Options$Mutation$PracticeSentence({
    String? operationName,
    required Variables$Mutation$PracticeSentence variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$PracticeSentence? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$PracticeSentence? onCompleted,
    graphql.OnMutationUpdate<Mutation$PracticeSentence>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$PracticeSentence(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationPracticeSentence,
          parserFn: _parserFn$Mutation$PracticeSentence,
        );

  final OnMutationCompleted$Mutation$PracticeSentence? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$PracticeSentence
    extends graphql.WatchQueryOptions<Mutation$PracticeSentence> {
  WatchOptions$Mutation$PracticeSentence({
    String? operationName,
    required Variables$Mutation$PracticeSentence variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$PracticeSentence? typedOptimisticResult,
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
          document: documentNodeMutationPracticeSentence,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$PracticeSentence,
        );
}

extension ClientExtension$Mutation$PracticeSentence on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$PracticeSentence>>
      mutate$PracticeSentence(
              Options$Mutation$PracticeSentence options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$PracticeSentence>
      watchMutation$PracticeSentence(
              WatchOptions$Mutation$PracticeSentence options) =>
          this.watchMutation(options);
}

class Mutation$PracticeSentence$HookResult {
  Mutation$PracticeSentence$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$PracticeSentence runMutation;

  final graphql.QueryResult<Mutation$PracticeSentence> result;
}

Mutation$PracticeSentence$HookResult useMutation$PracticeSentence(
    [WidgetOptions$Mutation$PracticeSentence? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$PracticeSentence());
  return Mutation$PracticeSentence$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$PracticeSentence>
    useWatchMutation$PracticeSentence(
            WatchOptions$Mutation$PracticeSentence options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$PracticeSentence
    extends graphql.MutationOptions<Mutation$PracticeSentence> {
  WidgetOptions$Mutation$PracticeSentence({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$PracticeSentence? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$PracticeSentence? onCompleted,
    graphql.OnMutationUpdate<Mutation$PracticeSentence>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$PracticeSentence(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationPracticeSentence,
          parserFn: _parserFn$Mutation$PracticeSentence,
        );

  final OnMutationCompleted$Mutation$PracticeSentence? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$PracticeSentence
    = graphql.MultiSourceResult<Mutation$PracticeSentence> Function(
  Variables$Mutation$PracticeSentence, {
  Object? optimisticResult,
  Mutation$PracticeSentence? typedOptimisticResult,
});
typedef Builder$Mutation$PracticeSentence = widgets.Widget Function(
  RunMutation$Mutation$PracticeSentence,
  graphql.QueryResult<Mutation$PracticeSentence>?,
);

class Mutation$PracticeSentence$Widget
    extends graphql_flutter.Mutation<Mutation$PracticeSentence> {
  Mutation$PracticeSentence$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$PracticeSentence? options,
    required Builder$Mutation$PracticeSentence builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$PracticeSentence(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$PracticeSentence$user {
  Mutation$PracticeSentence$user({
    required this.practice_sentence,
    this.$__typename = 'UserMutation',
  });

  factory Mutation$PracticeSentence$user.fromJson(Map<String, dynamic> json) {
    final l$practice_sentence = json['practice_sentence'];
    final l$$__typename = json['__typename'];
    return Mutation$PracticeSentence$user(
      practice_sentence: Fragment$Material.fromJson(
          (l$practice_sentence as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$Material practice_sentence;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$practice_sentence = practice_sentence;
    _resultData['practice_sentence'] = l$practice_sentence.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$practice_sentence = practice_sentence;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$practice_sentence,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$PracticeSentence$user ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$practice_sentence = practice_sentence;
    final lOther$practice_sentence = other.practice_sentence;
    if (l$practice_sentence != lOther$practice_sentence) {
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

extension UtilityExtension$Mutation$PracticeSentence$user
    on Mutation$PracticeSentence$user {
  CopyWith$Mutation$PracticeSentence$user<Mutation$PracticeSentence$user>
      get copyWith => CopyWith$Mutation$PracticeSentence$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$PracticeSentence$user<TRes> {
  factory CopyWith$Mutation$PracticeSentence$user(
    Mutation$PracticeSentence$user instance,
    TRes Function(Mutation$PracticeSentence$user) then,
  ) = _CopyWithImpl$Mutation$PracticeSentence$user;

  factory CopyWith$Mutation$PracticeSentence$user.stub(TRes res) =
      _CopyWithStubImpl$Mutation$PracticeSentence$user;

  TRes call({
    Fragment$Material? practice_sentence,
    String? $__typename,
  });
  CopyWith$Fragment$Material<TRes> get practice_sentence;
}

class _CopyWithImpl$Mutation$PracticeSentence$user<TRes>
    implements CopyWith$Mutation$PracticeSentence$user<TRes> {
  _CopyWithImpl$Mutation$PracticeSentence$user(
    this._instance,
    this._then,
  );

  final Mutation$PracticeSentence$user _instance;

  final TRes Function(Mutation$PracticeSentence$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? practice_sentence = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$PracticeSentence$user(
        practice_sentence:
            practice_sentence == _undefined || practice_sentence == null
                ? _instance.practice_sentence
                : (practice_sentence as Fragment$Material),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$Material<TRes> get practice_sentence {
    final local$practice_sentence = _instance.practice_sentence;
    return CopyWith$Fragment$Material(
        local$practice_sentence, (e) => call(practice_sentence: e));
  }
}

class _CopyWithStubImpl$Mutation$PracticeSentence$user<TRes>
    implements CopyWith$Mutation$PracticeSentence$user<TRes> {
  _CopyWithStubImpl$Mutation$PracticeSentence$user(this._res);

  TRes _res;

  call({
    Fragment$Material? practice_sentence,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$Material<TRes> get practice_sentence =>
      CopyWith$Fragment$Material.stub(_res);
}

class Variables$Mutation$PracticeWord {
  factory Variables$Mutation$PracticeWord({
    required String stageId,
    required String ref,
  }) =>
      Variables$Mutation$PracticeWord._({
        r'stageId': stageId,
        r'ref': ref,
      });

  Variables$Mutation$PracticeWord._(this._$data);

  factory Variables$Mutation$PracticeWord.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$stageId = data['stageId'];
    result$data['stageId'] = (l$stageId as String);
    final l$ref = data['ref'];
    result$data['ref'] = (l$ref as String);
    return Variables$Mutation$PracticeWord._(result$data);
  }

  Map<String, dynamic> _$data;

  String get stageId => (_$data['stageId'] as String);

  String get ref => (_$data['ref'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$stageId = stageId;
    result$data['stageId'] = l$stageId;
    final l$ref = ref;
    result$data['ref'] = l$ref;
    return result$data;
  }

  CopyWith$Variables$Mutation$PracticeWord<Variables$Mutation$PracticeWord>
      get copyWith => CopyWith$Variables$Mutation$PracticeWord(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$PracticeWord ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$stageId = stageId;
    final lOther$stageId = other.stageId;
    if (l$stageId != lOther$stageId) {
      return false;
    }
    final l$ref = ref;
    final lOther$ref = other.ref;
    if (l$ref != lOther$ref) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$stageId = stageId;
    final l$ref = ref;
    return Object.hashAll([
      l$stageId,
      l$ref,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$PracticeWord<TRes> {
  factory CopyWith$Variables$Mutation$PracticeWord(
    Variables$Mutation$PracticeWord instance,
    TRes Function(Variables$Mutation$PracticeWord) then,
  ) = _CopyWithImpl$Variables$Mutation$PracticeWord;

  factory CopyWith$Variables$Mutation$PracticeWord.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$PracticeWord;

  TRes call({
    String? stageId,
    String? ref,
  });
}

class _CopyWithImpl$Variables$Mutation$PracticeWord<TRes>
    implements CopyWith$Variables$Mutation$PracticeWord<TRes> {
  _CopyWithImpl$Variables$Mutation$PracticeWord(
    this._instance,
    this._then,
  );

  final Variables$Mutation$PracticeWord _instance;

  final TRes Function(Variables$Mutation$PracticeWord) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? stageId = _undefined,
    Object? ref = _undefined,
  }) =>
      _then(Variables$Mutation$PracticeWord._({
        ..._instance._$data,
        if (stageId != _undefined && stageId != null)
          'stageId': (stageId as String),
        if (ref != _undefined && ref != null) 'ref': (ref as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$PracticeWord<TRes>
    implements CopyWith$Variables$Mutation$PracticeWord<TRes> {
  _CopyWithStubImpl$Variables$Mutation$PracticeWord(this._res);

  TRes _res;

  call({
    String? stageId,
    String? ref,
  }) =>
      _res;
}

class Mutation$PracticeWord {
  Mutation$PracticeWord({
    required this.user,
    this.$__typename = 'Mutation',
  });

  factory Mutation$PracticeWord.fromJson(Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Mutation$PracticeWord(
      user:
          Mutation$PracticeWord$user.fromJson((l$user as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$PracticeWord$user user;

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
    if (other is! Mutation$PracticeWord || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Mutation$PracticeWord on Mutation$PracticeWord {
  CopyWith$Mutation$PracticeWord<Mutation$PracticeWord> get copyWith =>
      CopyWith$Mutation$PracticeWord(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$PracticeWord<TRes> {
  factory CopyWith$Mutation$PracticeWord(
    Mutation$PracticeWord instance,
    TRes Function(Mutation$PracticeWord) then,
  ) = _CopyWithImpl$Mutation$PracticeWord;

  factory CopyWith$Mutation$PracticeWord.stub(TRes res) =
      _CopyWithStubImpl$Mutation$PracticeWord;

  TRes call({
    Mutation$PracticeWord$user? user,
    String? $__typename,
  });
  CopyWith$Mutation$PracticeWord$user<TRes> get user;
}

class _CopyWithImpl$Mutation$PracticeWord<TRes>
    implements CopyWith$Mutation$PracticeWord<TRes> {
  _CopyWithImpl$Mutation$PracticeWord(
    this._instance,
    this._then,
  );

  final Mutation$PracticeWord _instance;

  final TRes Function(Mutation$PracticeWord) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$PracticeWord(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Mutation$PracticeWord$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$PracticeWord$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Mutation$PracticeWord$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Mutation$PracticeWord<TRes>
    implements CopyWith$Mutation$PracticeWord<TRes> {
  _CopyWithStubImpl$Mutation$PracticeWord(this._res);

  TRes _res;

  call({
    Mutation$PracticeWord$user? user,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$PracticeWord$user<TRes> get user =>
      CopyWith$Mutation$PracticeWord$user.stub(_res);
}

const documentNodeMutationPracticeWord = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'PracticeWord'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'stageId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'ref')),
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
            name: NameNode(value: 'practice_word'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'stageId'),
                value: VariableNode(name: NameNode(value: 'stageId')),
              ),
              ArgumentNode(
                name: NameNode(value: 'ref'),
                value: VariableNode(name: NameNode(value: 'ref')),
              ),
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
Mutation$PracticeWord _parserFn$Mutation$PracticeWord(
        Map<String, dynamic> data) =>
    Mutation$PracticeWord.fromJson(data);
typedef OnMutationCompleted$Mutation$PracticeWord = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$PracticeWord?,
);

class Options$Mutation$PracticeWord
    extends graphql.MutationOptions<Mutation$PracticeWord> {
  Options$Mutation$PracticeWord({
    String? operationName,
    required Variables$Mutation$PracticeWord variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$PracticeWord? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$PracticeWord? onCompleted,
    graphql.OnMutationUpdate<Mutation$PracticeWord>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$PracticeWord(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationPracticeWord,
          parserFn: _parserFn$Mutation$PracticeWord,
        );

  final OnMutationCompleted$Mutation$PracticeWord? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$PracticeWord
    extends graphql.WatchQueryOptions<Mutation$PracticeWord> {
  WatchOptions$Mutation$PracticeWord({
    String? operationName,
    required Variables$Mutation$PracticeWord variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$PracticeWord? typedOptimisticResult,
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
          document: documentNodeMutationPracticeWord,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$PracticeWord,
        );
}

extension ClientExtension$Mutation$PracticeWord on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$PracticeWord>> mutate$PracticeWord(
          Options$Mutation$PracticeWord options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$PracticeWord> watchMutation$PracticeWord(
          WatchOptions$Mutation$PracticeWord options) =>
      this.watchMutation(options);
}

class Mutation$PracticeWord$HookResult {
  Mutation$PracticeWord$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$PracticeWord runMutation;

  final graphql.QueryResult<Mutation$PracticeWord> result;
}

Mutation$PracticeWord$HookResult useMutation$PracticeWord(
    [WidgetOptions$Mutation$PracticeWord? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$PracticeWord());
  return Mutation$PracticeWord$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$PracticeWord> useWatchMutation$PracticeWord(
        WatchOptions$Mutation$PracticeWord options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$PracticeWord
    extends graphql.MutationOptions<Mutation$PracticeWord> {
  WidgetOptions$Mutation$PracticeWord({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$PracticeWord? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$PracticeWord? onCompleted,
    graphql.OnMutationUpdate<Mutation$PracticeWord>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$PracticeWord(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationPracticeWord,
          parserFn: _parserFn$Mutation$PracticeWord,
        );

  final OnMutationCompleted$Mutation$PracticeWord? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$PracticeWord
    = graphql.MultiSourceResult<Mutation$PracticeWord> Function(
  Variables$Mutation$PracticeWord, {
  Object? optimisticResult,
  Mutation$PracticeWord? typedOptimisticResult,
});
typedef Builder$Mutation$PracticeWord = widgets.Widget Function(
  RunMutation$Mutation$PracticeWord,
  graphql.QueryResult<Mutation$PracticeWord>?,
);

class Mutation$PracticeWord$Widget
    extends graphql_flutter.Mutation<Mutation$PracticeWord> {
  Mutation$PracticeWord$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$PracticeWord? options,
    required Builder$Mutation$PracticeWord builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$PracticeWord(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$PracticeWord$user {
  Mutation$PracticeWord$user({
    required this.practice_word,
    this.$__typename = 'UserMutation',
  });

  factory Mutation$PracticeWord$user.fromJson(Map<String, dynamic> json) {
    final l$practice_word = json['practice_word'];
    final l$$__typename = json['__typename'];
    return Mutation$PracticeWord$user(
      practice_word:
          Fragment$Material.fromJson((l$practice_word as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$Material practice_word;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$practice_word = practice_word;
    _resultData['practice_word'] = l$practice_word.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$practice_word = practice_word;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$practice_word,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$PracticeWord$user ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$practice_word = practice_word;
    final lOther$practice_word = other.practice_word;
    if (l$practice_word != lOther$practice_word) {
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

extension UtilityExtension$Mutation$PracticeWord$user
    on Mutation$PracticeWord$user {
  CopyWith$Mutation$PracticeWord$user<Mutation$PracticeWord$user>
      get copyWith => CopyWith$Mutation$PracticeWord$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$PracticeWord$user<TRes> {
  factory CopyWith$Mutation$PracticeWord$user(
    Mutation$PracticeWord$user instance,
    TRes Function(Mutation$PracticeWord$user) then,
  ) = _CopyWithImpl$Mutation$PracticeWord$user;

  factory CopyWith$Mutation$PracticeWord$user.stub(TRes res) =
      _CopyWithStubImpl$Mutation$PracticeWord$user;

  TRes call({
    Fragment$Material? practice_word,
    String? $__typename,
  });
  CopyWith$Fragment$Material<TRes> get practice_word;
}

class _CopyWithImpl$Mutation$PracticeWord$user<TRes>
    implements CopyWith$Mutation$PracticeWord$user<TRes> {
  _CopyWithImpl$Mutation$PracticeWord$user(
    this._instance,
    this._then,
  );

  final Mutation$PracticeWord$user _instance;

  final TRes Function(Mutation$PracticeWord$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? practice_word = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$PracticeWord$user(
        practice_word: practice_word == _undefined || practice_word == null
            ? _instance.practice_word
            : (practice_word as Fragment$Material),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$Material<TRes> get practice_word {
    final local$practice_word = _instance.practice_word;
    return CopyWith$Fragment$Material(
        local$practice_word, (e) => call(practice_word: e));
  }
}

class _CopyWithStubImpl$Mutation$PracticeWord$user<TRes>
    implements CopyWith$Mutation$PracticeWord$user<TRes> {
  _CopyWithStubImpl$Mutation$PracticeWord$user(this._res);

  TRes _res;

  call({
    Fragment$Material? practice_word,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$Material<TRes> get practice_word =>
      CopyWith$Fragment$Material.stub(_res);
}

class Variables$Mutation$EnrichDocumentation {
  factory Variables$Mutation$EnrichDocumentation({
    required String stageId,
    required String ref,
  }) =>
      Variables$Mutation$EnrichDocumentation._({
        r'stageId': stageId,
        r'ref': ref,
      });

  Variables$Mutation$EnrichDocumentation._(this._$data);

  factory Variables$Mutation$EnrichDocumentation.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$stageId = data['stageId'];
    result$data['stageId'] = (l$stageId as String);
    final l$ref = data['ref'];
    result$data['ref'] = (l$ref as String);
    return Variables$Mutation$EnrichDocumentation._(result$data);
  }

  Map<String, dynamic> _$data;

  String get stageId => (_$data['stageId'] as String);

  String get ref => (_$data['ref'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$stageId = stageId;
    result$data['stageId'] = l$stageId;
    final l$ref = ref;
    result$data['ref'] = l$ref;
    return result$data;
  }

  CopyWith$Variables$Mutation$EnrichDocumentation<
          Variables$Mutation$EnrichDocumentation>
      get copyWith => CopyWith$Variables$Mutation$EnrichDocumentation(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$EnrichDocumentation ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$stageId = stageId;
    final lOther$stageId = other.stageId;
    if (l$stageId != lOther$stageId) {
      return false;
    }
    final l$ref = ref;
    final lOther$ref = other.ref;
    if (l$ref != lOther$ref) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$stageId = stageId;
    final l$ref = ref;
    return Object.hashAll([
      l$stageId,
      l$ref,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$EnrichDocumentation<TRes> {
  factory CopyWith$Variables$Mutation$EnrichDocumentation(
    Variables$Mutation$EnrichDocumentation instance,
    TRes Function(Variables$Mutation$EnrichDocumentation) then,
  ) = _CopyWithImpl$Variables$Mutation$EnrichDocumentation;

  factory CopyWith$Variables$Mutation$EnrichDocumentation.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$EnrichDocumentation;

  TRes call({
    String? stageId,
    String? ref,
  });
}

class _CopyWithImpl$Variables$Mutation$EnrichDocumentation<TRes>
    implements CopyWith$Variables$Mutation$EnrichDocumentation<TRes> {
  _CopyWithImpl$Variables$Mutation$EnrichDocumentation(
    this._instance,
    this._then,
  );

  final Variables$Mutation$EnrichDocumentation _instance;

  final TRes Function(Variables$Mutation$EnrichDocumentation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? stageId = _undefined,
    Object? ref = _undefined,
  }) =>
      _then(Variables$Mutation$EnrichDocumentation._({
        ..._instance._$data,
        if (stageId != _undefined && stageId != null)
          'stageId': (stageId as String),
        if (ref != _undefined && ref != null) 'ref': (ref as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$EnrichDocumentation<TRes>
    implements CopyWith$Variables$Mutation$EnrichDocumentation<TRes> {
  _CopyWithStubImpl$Variables$Mutation$EnrichDocumentation(this._res);

  TRes _res;

  call({
    String? stageId,
    String? ref,
  }) =>
      _res;
}

class Mutation$EnrichDocumentation {
  Mutation$EnrichDocumentation({
    required this.user,
    this.$__typename = 'Mutation',
  });

  factory Mutation$EnrichDocumentation.fromJson(Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Mutation$EnrichDocumentation(
      user: Mutation$EnrichDocumentation$user.fromJson(
          (l$user as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$EnrichDocumentation$user user;

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
    if (other is! Mutation$EnrichDocumentation ||
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

extension UtilityExtension$Mutation$EnrichDocumentation
    on Mutation$EnrichDocumentation {
  CopyWith$Mutation$EnrichDocumentation<Mutation$EnrichDocumentation>
      get copyWith => CopyWith$Mutation$EnrichDocumentation(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$EnrichDocumentation<TRes> {
  factory CopyWith$Mutation$EnrichDocumentation(
    Mutation$EnrichDocumentation instance,
    TRes Function(Mutation$EnrichDocumentation) then,
  ) = _CopyWithImpl$Mutation$EnrichDocumentation;

  factory CopyWith$Mutation$EnrichDocumentation.stub(TRes res) =
      _CopyWithStubImpl$Mutation$EnrichDocumentation;

  TRes call({
    Mutation$EnrichDocumentation$user? user,
    String? $__typename,
  });
  CopyWith$Mutation$EnrichDocumentation$user<TRes> get user;
}

class _CopyWithImpl$Mutation$EnrichDocumentation<TRes>
    implements CopyWith$Mutation$EnrichDocumentation<TRes> {
  _CopyWithImpl$Mutation$EnrichDocumentation(
    this._instance,
    this._then,
  );

  final Mutation$EnrichDocumentation _instance;

  final TRes Function(Mutation$EnrichDocumentation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$EnrichDocumentation(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Mutation$EnrichDocumentation$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$EnrichDocumentation$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Mutation$EnrichDocumentation$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Mutation$EnrichDocumentation<TRes>
    implements CopyWith$Mutation$EnrichDocumentation<TRes> {
  _CopyWithStubImpl$Mutation$EnrichDocumentation(this._res);

  TRes _res;

  call({
    Mutation$EnrichDocumentation$user? user,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$EnrichDocumentation$user<TRes> get user =>
      CopyWith$Mutation$EnrichDocumentation$user.stub(_res);
}

const documentNodeMutationEnrichDocumentation = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'EnrichDocumentation'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'stageId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'ref')),
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
            name: NameNode(value: 'enrich_documentation'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'stageId'),
                value: VariableNode(name: NameNode(value: 'stageId')),
              ),
              ArgumentNode(
                name: NameNode(value: 'ref'),
                value: VariableNode(name: NameNode(value: 'ref')),
              ),
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
Mutation$EnrichDocumentation _parserFn$Mutation$EnrichDocumentation(
        Map<String, dynamic> data) =>
    Mutation$EnrichDocumentation.fromJson(data);
typedef OnMutationCompleted$Mutation$EnrichDocumentation = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$EnrichDocumentation?,
);

class Options$Mutation$EnrichDocumentation
    extends graphql.MutationOptions<Mutation$EnrichDocumentation> {
  Options$Mutation$EnrichDocumentation({
    String? operationName,
    required Variables$Mutation$EnrichDocumentation variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$EnrichDocumentation? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$EnrichDocumentation? onCompleted,
    graphql.OnMutationUpdate<Mutation$EnrichDocumentation>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$EnrichDocumentation(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationEnrichDocumentation,
          parserFn: _parserFn$Mutation$EnrichDocumentation,
        );

  final OnMutationCompleted$Mutation$EnrichDocumentation? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$EnrichDocumentation
    extends graphql.WatchQueryOptions<Mutation$EnrichDocumentation> {
  WatchOptions$Mutation$EnrichDocumentation({
    String? operationName,
    required Variables$Mutation$EnrichDocumentation variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$EnrichDocumentation? typedOptimisticResult,
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
          document: documentNodeMutationEnrichDocumentation,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$EnrichDocumentation,
        );
}

extension ClientExtension$Mutation$EnrichDocumentation
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$EnrichDocumentation>>
      mutate$EnrichDocumentation(
              Options$Mutation$EnrichDocumentation options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$EnrichDocumentation>
      watchMutation$EnrichDocumentation(
              WatchOptions$Mutation$EnrichDocumentation options) =>
          this.watchMutation(options);
}

class Mutation$EnrichDocumentation$HookResult {
  Mutation$EnrichDocumentation$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$EnrichDocumentation runMutation;

  final graphql.QueryResult<Mutation$EnrichDocumentation> result;
}

Mutation$EnrichDocumentation$HookResult useMutation$EnrichDocumentation(
    [WidgetOptions$Mutation$EnrichDocumentation? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$EnrichDocumentation());
  return Mutation$EnrichDocumentation$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$EnrichDocumentation>
    useWatchMutation$EnrichDocumentation(
            WatchOptions$Mutation$EnrichDocumentation options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$EnrichDocumentation
    extends graphql.MutationOptions<Mutation$EnrichDocumentation> {
  WidgetOptions$Mutation$EnrichDocumentation({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$EnrichDocumentation? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$EnrichDocumentation? onCompleted,
    graphql.OnMutationUpdate<Mutation$EnrichDocumentation>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$EnrichDocumentation(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationEnrichDocumentation,
          parserFn: _parserFn$Mutation$EnrichDocumentation,
        );

  final OnMutationCompleted$Mutation$EnrichDocumentation? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$EnrichDocumentation
    = graphql.MultiSourceResult<Mutation$EnrichDocumentation> Function(
  Variables$Mutation$EnrichDocumentation, {
  Object? optimisticResult,
  Mutation$EnrichDocumentation? typedOptimisticResult,
});
typedef Builder$Mutation$EnrichDocumentation = widgets.Widget Function(
  RunMutation$Mutation$EnrichDocumentation,
  graphql.QueryResult<Mutation$EnrichDocumentation>?,
);

class Mutation$EnrichDocumentation$Widget
    extends graphql_flutter.Mutation<Mutation$EnrichDocumentation> {
  Mutation$EnrichDocumentation$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$EnrichDocumentation? options,
    required Builder$Mutation$EnrichDocumentation builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$EnrichDocumentation(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$EnrichDocumentation$user {
  Mutation$EnrichDocumentation$user({
    required this.enrich_documentation,
    this.$__typename = 'UserMutation',
  });

  factory Mutation$EnrichDocumentation$user.fromJson(
      Map<String, dynamic> json) {
    final l$enrich_documentation = json['enrich_documentation'];
    final l$$__typename = json['__typename'];
    return Mutation$EnrichDocumentation$user(
      enrich_documentation: Fragment$UserDoc.fromJson(
          (l$enrich_documentation as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$UserDoc enrich_documentation;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$enrich_documentation = enrich_documentation;
    _resultData['enrich_documentation'] = l$enrich_documentation.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$enrich_documentation = enrich_documentation;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$enrich_documentation,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$EnrichDocumentation$user ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$enrich_documentation = enrich_documentation;
    final lOther$enrich_documentation = other.enrich_documentation;
    if (l$enrich_documentation != lOther$enrich_documentation) {
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

extension UtilityExtension$Mutation$EnrichDocumentation$user
    on Mutation$EnrichDocumentation$user {
  CopyWith$Mutation$EnrichDocumentation$user<Mutation$EnrichDocumentation$user>
      get copyWith => CopyWith$Mutation$EnrichDocumentation$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$EnrichDocumentation$user<TRes> {
  factory CopyWith$Mutation$EnrichDocumentation$user(
    Mutation$EnrichDocumentation$user instance,
    TRes Function(Mutation$EnrichDocumentation$user) then,
  ) = _CopyWithImpl$Mutation$EnrichDocumentation$user;

  factory CopyWith$Mutation$EnrichDocumentation$user.stub(TRes res) =
      _CopyWithStubImpl$Mutation$EnrichDocumentation$user;

  TRes call({
    Fragment$UserDoc? enrich_documentation,
    String? $__typename,
  });
  CopyWith$Fragment$UserDoc<TRes> get enrich_documentation;
}

class _CopyWithImpl$Mutation$EnrichDocumentation$user<TRes>
    implements CopyWith$Mutation$EnrichDocumentation$user<TRes> {
  _CopyWithImpl$Mutation$EnrichDocumentation$user(
    this._instance,
    this._then,
  );

  final Mutation$EnrichDocumentation$user _instance;

  final TRes Function(Mutation$EnrichDocumentation$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? enrich_documentation = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$EnrichDocumentation$user(
        enrich_documentation:
            enrich_documentation == _undefined || enrich_documentation == null
                ? _instance.enrich_documentation
                : (enrich_documentation as Fragment$UserDoc),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$UserDoc<TRes> get enrich_documentation {
    final local$enrich_documentation = _instance.enrich_documentation;
    return CopyWith$Fragment$UserDoc(
        local$enrich_documentation, (e) => call(enrich_documentation: e));
  }
}

class _CopyWithStubImpl$Mutation$EnrichDocumentation$user<TRes>
    implements CopyWith$Mutation$EnrichDocumentation$user<TRes> {
  _CopyWithStubImpl$Mutation$EnrichDocumentation$user(this._res);

  TRes _res;

  call({
    Fragment$UserDoc? enrich_documentation,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$UserDoc<TRes> get enrich_documentation =>
      CopyWith$Fragment$UserDoc.stub(_res);
}

class Variables$Mutation$EnrichDictionary {
  factory Variables$Mutation$EnrichDictionary({
    required String stageId,
    required String ref,
  }) =>
      Variables$Mutation$EnrichDictionary._({
        r'stageId': stageId,
        r'ref': ref,
      });

  Variables$Mutation$EnrichDictionary._(this._$data);

  factory Variables$Mutation$EnrichDictionary.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$stageId = data['stageId'];
    result$data['stageId'] = (l$stageId as String);
    final l$ref = data['ref'];
    result$data['ref'] = (l$ref as String);
    return Variables$Mutation$EnrichDictionary._(result$data);
  }

  Map<String, dynamic> _$data;

  String get stageId => (_$data['stageId'] as String);

  String get ref => (_$data['ref'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$stageId = stageId;
    result$data['stageId'] = l$stageId;
    final l$ref = ref;
    result$data['ref'] = l$ref;
    return result$data;
  }

  CopyWith$Variables$Mutation$EnrichDictionary<
          Variables$Mutation$EnrichDictionary>
      get copyWith => CopyWith$Variables$Mutation$EnrichDictionary(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$EnrichDictionary ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$stageId = stageId;
    final lOther$stageId = other.stageId;
    if (l$stageId != lOther$stageId) {
      return false;
    }
    final l$ref = ref;
    final lOther$ref = other.ref;
    if (l$ref != lOther$ref) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$stageId = stageId;
    final l$ref = ref;
    return Object.hashAll([
      l$stageId,
      l$ref,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$EnrichDictionary<TRes> {
  factory CopyWith$Variables$Mutation$EnrichDictionary(
    Variables$Mutation$EnrichDictionary instance,
    TRes Function(Variables$Mutation$EnrichDictionary) then,
  ) = _CopyWithImpl$Variables$Mutation$EnrichDictionary;

  factory CopyWith$Variables$Mutation$EnrichDictionary.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$EnrichDictionary;

  TRes call({
    String? stageId,
    String? ref,
  });
}

class _CopyWithImpl$Variables$Mutation$EnrichDictionary<TRes>
    implements CopyWith$Variables$Mutation$EnrichDictionary<TRes> {
  _CopyWithImpl$Variables$Mutation$EnrichDictionary(
    this._instance,
    this._then,
  );

  final Variables$Mutation$EnrichDictionary _instance;

  final TRes Function(Variables$Mutation$EnrichDictionary) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? stageId = _undefined,
    Object? ref = _undefined,
  }) =>
      _then(Variables$Mutation$EnrichDictionary._({
        ..._instance._$data,
        if (stageId != _undefined && stageId != null)
          'stageId': (stageId as String),
        if (ref != _undefined && ref != null) 'ref': (ref as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$EnrichDictionary<TRes>
    implements CopyWith$Variables$Mutation$EnrichDictionary<TRes> {
  _CopyWithStubImpl$Variables$Mutation$EnrichDictionary(this._res);

  TRes _res;

  call({
    String? stageId,
    String? ref,
  }) =>
      _res;
}

class Mutation$EnrichDictionary {
  Mutation$EnrichDictionary({
    required this.user,
    this.$__typename = 'Mutation',
  });

  factory Mutation$EnrichDictionary.fromJson(Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Mutation$EnrichDictionary(
      user: Mutation$EnrichDictionary$user.fromJson(
          (l$user as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$EnrichDictionary$user user;

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
    if (other is! Mutation$EnrichDictionary ||
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

extension UtilityExtension$Mutation$EnrichDictionary
    on Mutation$EnrichDictionary {
  CopyWith$Mutation$EnrichDictionary<Mutation$EnrichDictionary> get copyWith =>
      CopyWith$Mutation$EnrichDictionary(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$EnrichDictionary<TRes> {
  factory CopyWith$Mutation$EnrichDictionary(
    Mutation$EnrichDictionary instance,
    TRes Function(Mutation$EnrichDictionary) then,
  ) = _CopyWithImpl$Mutation$EnrichDictionary;

  factory CopyWith$Mutation$EnrichDictionary.stub(TRes res) =
      _CopyWithStubImpl$Mutation$EnrichDictionary;

  TRes call({
    Mutation$EnrichDictionary$user? user,
    String? $__typename,
  });
  CopyWith$Mutation$EnrichDictionary$user<TRes> get user;
}

class _CopyWithImpl$Mutation$EnrichDictionary<TRes>
    implements CopyWith$Mutation$EnrichDictionary<TRes> {
  _CopyWithImpl$Mutation$EnrichDictionary(
    this._instance,
    this._then,
  );

  final Mutation$EnrichDictionary _instance;

  final TRes Function(Mutation$EnrichDictionary) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$EnrichDictionary(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Mutation$EnrichDictionary$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$EnrichDictionary$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Mutation$EnrichDictionary$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Mutation$EnrichDictionary<TRes>
    implements CopyWith$Mutation$EnrichDictionary<TRes> {
  _CopyWithStubImpl$Mutation$EnrichDictionary(this._res);

  TRes _res;

  call({
    Mutation$EnrichDictionary$user? user,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$EnrichDictionary$user<TRes> get user =>
      CopyWith$Mutation$EnrichDictionary$user.stub(_res);
}

const documentNodeMutationEnrichDictionary = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'EnrichDictionary'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'stageId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'ref')),
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
            name: NameNode(value: 'enrich_dictionary'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'stageId'),
                value: VariableNode(name: NameNode(value: 'stageId')),
              ),
              ArgumentNode(
                name: NameNode(value: 'ref'),
                value: VariableNode(name: NameNode(value: 'ref')),
              ),
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
Mutation$EnrichDictionary _parserFn$Mutation$EnrichDictionary(
        Map<String, dynamic> data) =>
    Mutation$EnrichDictionary.fromJson(data);
typedef OnMutationCompleted$Mutation$EnrichDictionary = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$EnrichDictionary?,
);

class Options$Mutation$EnrichDictionary
    extends graphql.MutationOptions<Mutation$EnrichDictionary> {
  Options$Mutation$EnrichDictionary({
    String? operationName,
    required Variables$Mutation$EnrichDictionary variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$EnrichDictionary? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$EnrichDictionary? onCompleted,
    graphql.OnMutationUpdate<Mutation$EnrichDictionary>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$EnrichDictionary(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationEnrichDictionary,
          parserFn: _parserFn$Mutation$EnrichDictionary,
        );

  final OnMutationCompleted$Mutation$EnrichDictionary? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$EnrichDictionary
    extends graphql.WatchQueryOptions<Mutation$EnrichDictionary> {
  WatchOptions$Mutation$EnrichDictionary({
    String? operationName,
    required Variables$Mutation$EnrichDictionary variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$EnrichDictionary? typedOptimisticResult,
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
          document: documentNodeMutationEnrichDictionary,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$EnrichDictionary,
        );
}

extension ClientExtension$Mutation$EnrichDictionary on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$EnrichDictionary>>
      mutate$EnrichDictionary(
              Options$Mutation$EnrichDictionary options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$EnrichDictionary>
      watchMutation$EnrichDictionary(
              WatchOptions$Mutation$EnrichDictionary options) =>
          this.watchMutation(options);
}

class Mutation$EnrichDictionary$HookResult {
  Mutation$EnrichDictionary$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$EnrichDictionary runMutation;

  final graphql.QueryResult<Mutation$EnrichDictionary> result;
}

Mutation$EnrichDictionary$HookResult useMutation$EnrichDictionary(
    [WidgetOptions$Mutation$EnrichDictionary? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$EnrichDictionary());
  return Mutation$EnrichDictionary$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$EnrichDictionary>
    useWatchMutation$EnrichDictionary(
            WatchOptions$Mutation$EnrichDictionary options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$EnrichDictionary
    extends graphql.MutationOptions<Mutation$EnrichDictionary> {
  WidgetOptions$Mutation$EnrichDictionary({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$EnrichDictionary? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$EnrichDictionary? onCompleted,
    graphql.OnMutationUpdate<Mutation$EnrichDictionary>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$EnrichDictionary(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationEnrichDictionary,
          parserFn: _parserFn$Mutation$EnrichDictionary,
        );

  final OnMutationCompleted$Mutation$EnrichDictionary? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$EnrichDictionary
    = graphql.MultiSourceResult<Mutation$EnrichDictionary> Function(
  Variables$Mutation$EnrichDictionary, {
  Object? optimisticResult,
  Mutation$EnrichDictionary? typedOptimisticResult,
});
typedef Builder$Mutation$EnrichDictionary = widgets.Widget Function(
  RunMutation$Mutation$EnrichDictionary,
  graphql.QueryResult<Mutation$EnrichDictionary>?,
);

class Mutation$EnrichDictionary$Widget
    extends graphql_flutter.Mutation<Mutation$EnrichDictionary> {
  Mutation$EnrichDictionary$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$EnrichDictionary? options,
    required Builder$Mutation$EnrichDictionary builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$EnrichDictionary(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$EnrichDictionary$user {
  Mutation$EnrichDictionary$user({
    required this.enrich_dictionary,
    this.$__typename = 'UserMutation',
  });

  factory Mutation$EnrichDictionary$user.fromJson(Map<String, dynamic> json) {
    final l$enrich_dictionary = json['enrich_dictionary'];
    final l$$__typename = json['__typename'];
    return Mutation$EnrichDictionary$user(
      enrich_dictionary: Fragment$UserDoc.fromJson(
          (l$enrich_dictionary as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$UserDoc enrich_dictionary;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$enrich_dictionary = enrich_dictionary;
    _resultData['enrich_dictionary'] = l$enrich_dictionary.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$enrich_dictionary = enrich_dictionary;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$enrich_dictionary,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$EnrichDictionary$user ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$enrich_dictionary = enrich_dictionary;
    final lOther$enrich_dictionary = other.enrich_dictionary;
    if (l$enrich_dictionary != lOther$enrich_dictionary) {
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

extension UtilityExtension$Mutation$EnrichDictionary$user
    on Mutation$EnrichDictionary$user {
  CopyWith$Mutation$EnrichDictionary$user<Mutation$EnrichDictionary$user>
      get copyWith => CopyWith$Mutation$EnrichDictionary$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$EnrichDictionary$user<TRes> {
  factory CopyWith$Mutation$EnrichDictionary$user(
    Mutation$EnrichDictionary$user instance,
    TRes Function(Mutation$EnrichDictionary$user) then,
  ) = _CopyWithImpl$Mutation$EnrichDictionary$user;

  factory CopyWith$Mutation$EnrichDictionary$user.stub(TRes res) =
      _CopyWithStubImpl$Mutation$EnrichDictionary$user;

  TRes call({
    Fragment$UserDoc? enrich_dictionary,
    String? $__typename,
  });
  CopyWith$Fragment$UserDoc<TRes> get enrich_dictionary;
}

class _CopyWithImpl$Mutation$EnrichDictionary$user<TRes>
    implements CopyWith$Mutation$EnrichDictionary$user<TRes> {
  _CopyWithImpl$Mutation$EnrichDictionary$user(
    this._instance,
    this._then,
  );

  final Mutation$EnrichDictionary$user _instance;

  final TRes Function(Mutation$EnrichDictionary$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? enrich_dictionary = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$EnrichDictionary$user(
        enrich_dictionary:
            enrich_dictionary == _undefined || enrich_dictionary == null
                ? _instance.enrich_dictionary
                : (enrich_dictionary as Fragment$UserDoc),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$UserDoc<TRes> get enrich_dictionary {
    final local$enrich_dictionary = _instance.enrich_dictionary;
    return CopyWith$Fragment$UserDoc(
        local$enrich_dictionary, (e) => call(enrich_dictionary: e));
  }
}

class _CopyWithStubImpl$Mutation$EnrichDictionary$user<TRes>
    implements CopyWith$Mutation$EnrichDictionary$user<TRes> {
  _CopyWithStubImpl$Mutation$EnrichDictionary$user(this._res);

  TRes _res;

  call({
    Fragment$UserDoc? enrich_dictionary,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$UserDoc<TRes> get enrich_dictionary =>
      CopyWith$Fragment$UserDoc.stub(_res);
}

class Variables$Mutation$SentenceUseCase {
  factory Variables$Mutation$SentenceUseCase({
    required String stageId,
    required String ref,
  }) =>
      Variables$Mutation$SentenceUseCase._({
        r'stageId': stageId,
        r'ref': ref,
      });

  Variables$Mutation$SentenceUseCase._(this._$data);

  factory Variables$Mutation$SentenceUseCase.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$stageId = data['stageId'];
    result$data['stageId'] = (l$stageId as String);
    final l$ref = data['ref'];
    result$data['ref'] = (l$ref as String);
    return Variables$Mutation$SentenceUseCase._(result$data);
  }

  Map<String, dynamic> _$data;

  String get stageId => (_$data['stageId'] as String);

  String get ref => (_$data['ref'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$stageId = stageId;
    result$data['stageId'] = l$stageId;
    final l$ref = ref;
    result$data['ref'] = l$ref;
    return result$data;
  }

  CopyWith$Variables$Mutation$SentenceUseCase<
          Variables$Mutation$SentenceUseCase>
      get copyWith => CopyWith$Variables$Mutation$SentenceUseCase(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$SentenceUseCase ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$stageId = stageId;
    final lOther$stageId = other.stageId;
    if (l$stageId != lOther$stageId) {
      return false;
    }
    final l$ref = ref;
    final lOther$ref = other.ref;
    if (l$ref != lOther$ref) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$stageId = stageId;
    final l$ref = ref;
    return Object.hashAll([
      l$stageId,
      l$ref,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$SentenceUseCase<TRes> {
  factory CopyWith$Variables$Mutation$SentenceUseCase(
    Variables$Mutation$SentenceUseCase instance,
    TRes Function(Variables$Mutation$SentenceUseCase) then,
  ) = _CopyWithImpl$Variables$Mutation$SentenceUseCase;

  factory CopyWith$Variables$Mutation$SentenceUseCase.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$SentenceUseCase;

  TRes call({
    String? stageId,
    String? ref,
  });
}

class _CopyWithImpl$Variables$Mutation$SentenceUseCase<TRes>
    implements CopyWith$Variables$Mutation$SentenceUseCase<TRes> {
  _CopyWithImpl$Variables$Mutation$SentenceUseCase(
    this._instance,
    this._then,
  );

  final Variables$Mutation$SentenceUseCase _instance;

  final TRes Function(Variables$Mutation$SentenceUseCase) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? stageId = _undefined,
    Object? ref = _undefined,
  }) =>
      _then(Variables$Mutation$SentenceUseCase._({
        ..._instance._$data,
        if (stageId != _undefined && stageId != null)
          'stageId': (stageId as String),
        if (ref != _undefined && ref != null) 'ref': (ref as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$SentenceUseCase<TRes>
    implements CopyWith$Variables$Mutation$SentenceUseCase<TRes> {
  _CopyWithStubImpl$Variables$Mutation$SentenceUseCase(this._res);

  TRes _res;

  call({
    String? stageId,
    String? ref,
  }) =>
      _res;
}

class Mutation$SentenceUseCase {
  Mutation$SentenceUseCase({
    required this.user,
    this.$__typename = 'Mutation',
  });

  factory Mutation$SentenceUseCase.fromJson(Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Mutation$SentenceUseCase(
      user: Mutation$SentenceUseCase$user.fromJson(
          (l$user as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$SentenceUseCase$user user;

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
    if (other is! Mutation$SentenceUseCase ||
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

extension UtilityExtension$Mutation$SentenceUseCase
    on Mutation$SentenceUseCase {
  CopyWith$Mutation$SentenceUseCase<Mutation$SentenceUseCase> get copyWith =>
      CopyWith$Mutation$SentenceUseCase(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$SentenceUseCase<TRes> {
  factory CopyWith$Mutation$SentenceUseCase(
    Mutation$SentenceUseCase instance,
    TRes Function(Mutation$SentenceUseCase) then,
  ) = _CopyWithImpl$Mutation$SentenceUseCase;

  factory CopyWith$Mutation$SentenceUseCase.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SentenceUseCase;

  TRes call({
    Mutation$SentenceUseCase$user? user,
    String? $__typename,
  });
  CopyWith$Mutation$SentenceUseCase$user<TRes> get user;
}

class _CopyWithImpl$Mutation$SentenceUseCase<TRes>
    implements CopyWith$Mutation$SentenceUseCase<TRes> {
  _CopyWithImpl$Mutation$SentenceUseCase(
    this._instance,
    this._then,
  );

  final Mutation$SentenceUseCase _instance;

  final TRes Function(Mutation$SentenceUseCase) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SentenceUseCase(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Mutation$SentenceUseCase$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SentenceUseCase$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Mutation$SentenceUseCase$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Mutation$SentenceUseCase<TRes>
    implements CopyWith$Mutation$SentenceUseCase<TRes> {
  _CopyWithStubImpl$Mutation$SentenceUseCase(this._res);

  TRes _res;

  call({
    Mutation$SentenceUseCase$user? user,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SentenceUseCase$user<TRes> get user =>
      CopyWith$Mutation$SentenceUseCase$user.stub(_res);
}

const documentNodeMutationSentenceUseCase = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'SentenceUseCase'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'stageId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'ref')),
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
            name: NameNode(value: 'sentence_use_case'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'stageId'),
                value: VariableNode(name: NameNode(value: 'stageId')),
              ),
              ArgumentNode(
                name: NameNode(value: 'ref'),
                value: VariableNode(name: NameNode(value: 'ref')),
              ),
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
Mutation$SentenceUseCase _parserFn$Mutation$SentenceUseCase(
        Map<String, dynamic> data) =>
    Mutation$SentenceUseCase.fromJson(data);
typedef OnMutationCompleted$Mutation$SentenceUseCase = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$SentenceUseCase?,
);

class Options$Mutation$SentenceUseCase
    extends graphql.MutationOptions<Mutation$SentenceUseCase> {
  Options$Mutation$SentenceUseCase({
    String? operationName,
    required Variables$Mutation$SentenceUseCase variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SentenceUseCase? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SentenceUseCase? onCompleted,
    graphql.OnMutationUpdate<Mutation$SentenceUseCase>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$SentenceUseCase(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSentenceUseCase,
          parserFn: _parserFn$Mutation$SentenceUseCase,
        );

  final OnMutationCompleted$Mutation$SentenceUseCase? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$SentenceUseCase
    extends graphql.WatchQueryOptions<Mutation$SentenceUseCase> {
  WatchOptions$Mutation$SentenceUseCase({
    String? operationName,
    required Variables$Mutation$SentenceUseCase variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SentenceUseCase? typedOptimisticResult,
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
          document: documentNodeMutationSentenceUseCase,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$SentenceUseCase,
        );
}

extension ClientExtension$Mutation$SentenceUseCase on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$SentenceUseCase>> mutate$SentenceUseCase(
          Options$Mutation$SentenceUseCase options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$SentenceUseCase>
      watchMutation$SentenceUseCase(
              WatchOptions$Mutation$SentenceUseCase options) =>
          this.watchMutation(options);
}

class Mutation$SentenceUseCase$HookResult {
  Mutation$SentenceUseCase$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$SentenceUseCase runMutation;

  final graphql.QueryResult<Mutation$SentenceUseCase> result;
}

Mutation$SentenceUseCase$HookResult useMutation$SentenceUseCase(
    [WidgetOptions$Mutation$SentenceUseCase? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$SentenceUseCase());
  return Mutation$SentenceUseCase$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$SentenceUseCase>
    useWatchMutation$SentenceUseCase(
            WatchOptions$Mutation$SentenceUseCase options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$SentenceUseCase
    extends graphql.MutationOptions<Mutation$SentenceUseCase> {
  WidgetOptions$Mutation$SentenceUseCase({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SentenceUseCase? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SentenceUseCase? onCompleted,
    graphql.OnMutationUpdate<Mutation$SentenceUseCase>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$SentenceUseCase(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSentenceUseCase,
          parserFn: _parserFn$Mutation$SentenceUseCase,
        );

  final OnMutationCompleted$Mutation$SentenceUseCase? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$SentenceUseCase
    = graphql.MultiSourceResult<Mutation$SentenceUseCase> Function(
  Variables$Mutation$SentenceUseCase, {
  Object? optimisticResult,
  Mutation$SentenceUseCase? typedOptimisticResult,
});
typedef Builder$Mutation$SentenceUseCase = widgets.Widget Function(
  RunMutation$Mutation$SentenceUseCase,
  graphql.QueryResult<Mutation$SentenceUseCase>?,
);

class Mutation$SentenceUseCase$Widget
    extends graphql_flutter.Mutation<Mutation$SentenceUseCase> {
  Mutation$SentenceUseCase$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$SentenceUseCase? options,
    required Builder$Mutation$SentenceUseCase builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$SentenceUseCase(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$SentenceUseCase$user {
  Mutation$SentenceUseCase$user({
    required this.sentence_use_case,
    this.$__typename = 'UserMutation',
  });

  factory Mutation$SentenceUseCase$user.fromJson(Map<String, dynamic> json) {
    final l$sentence_use_case = json['sentence_use_case'];
    final l$$__typename = json['__typename'];
    return Mutation$SentenceUseCase$user(
      sentence_use_case: Fragment$UserDoc.fromJson(
          (l$sentence_use_case as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$UserDoc sentence_use_case;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$sentence_use_case = sentence_use_case;
    _resultData['sentence_use_case'] = l$sentence_use_case.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$sentence_use_case = sentence_use_case;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$sentence_use_case,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$SentenceUseCase$user ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$sentence_use_case = sentence_use_case;
    final lOther$sentence_use_case = other.sentence_use_case;
    if (l$sentence_use_case != lOther$sentence_use_case) {
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

extension UtilityExtension$Mutation$SentenceUseCase$user
    on Mutation$SentenceUseCase$user {
  CopyWith$Mutation$SentenceUseCase$user<Mutation$SentenceUseCase$user>
      get copyWith => CopyWith$Mutation$SentenceUseCase$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SentenceUseCase$user<TRes> {
  factory CopyWith$Mutation$SentenceUseCase$user(
    Mutation$SentenceUseCase$user instance,
    TRes Function(Mutation$SentenceUseCase$user) then,
  ) = _CopyWithImpl$Mutation$SentenceUseCase$user;

  factory CopyWith$Mutation$SentenceUseCase$user.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SentenceUseCase$user;

  TRes call({
    Fragment$UserDoc? sentence_use_case,
    String? $__typename,
  });
  CopyWith$Fragment$UserDoc<TRes> get sentence_use_case;
}

class _CopyWithImpl$Mutation$SentenceUseCase$user<TRes>
    implements CopyWith$Mutation$SentenceUseCase$user<TRes> {
  _CopyWithImpl$Mutation$SentenceUseCase$user(
    this._instance,
    this._then,
  );

  final Mutation$SentenceUseCase$user _instance;

  final TRes Function(Mutation$SentenceUseCase$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? sentence_use_case = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SentenceUseCase$user(
        sentence_use_case:
            sentence_use_case == _undefined || sentence_use_case == null
                ? _instance.sentence_use_case
                : (sentence_use_case as Fragment$UserDoc),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$UserDoc<TRes> get sentence_use_case {
    final local$sentence_use_case = _instance.sentence_use_case;
    return CopyWith$Fragment$UserDoc(
        local$sentence_use_case, (e) => call(sentence_use_case: e));
  }
}

class _CopyWithStubImpl$Mutation$SentenceUseCase$user<TRes>
    implements CopyWith$Mutation$SentenceUseCase$user<TRes> {
  _CopyWithStubImpl$Mutation$SentenceUseCase$user(this._res);

  TRes _res;

  call({
    Fragment$UserDoc? sentence_use_case,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$UserDoc<TRes> get sentence_use_case =>
      CopyWith$Fragment$UserDoc.stub(_res);
}

class Variables$Mutation$WordUseCase {
  factory Variables$Mutation$WordUseCase({
    required String stageId,
    required String ref,
  }) =>
      Variables$Mutation$WordUseCase._({
        r'stageId': stageId,
        r'ref': ref,
      });

  Variables$Mutation$WordUseCase._(this._$data);

  factory Variables$Mutation$WordUseCase.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$stageId = data['stageId'];
    result$data['stageId'] = (l$stageId as String);
    final l$ref = data['ref'];
    result$data['ref'] = (l$ref as String);
    return Variables$Mutation$WordUseCase._(result$data);
  }

  Map<String, dynamic> _$data;

  String get stageId => (_$data['stageId'] as String);

  String get ref => (_$data['ref'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$stageId = stageId;
    result$data['stageId'] = l$stageId;
    final l$ref = ref;
    result$data['ref'] = l$ref;
    return result$data;
  }

  CopyWith$Variables$Mutation$WordUseCase<Variables$Mutation$WordUseCase>
      get copyWith => CopyWith$Variables$Mutation$WordUseCase(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$WordUseCase ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$stageId = stageId;
    final lOther$stageId = other.stageId;
    if (l$stageId != lOther$stageId) {
      return false;
    }
    final l$ref = ref;
    final lOther$ref = other.ref;
    if (l$ref != lOther$ref) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$stageId = stageId;
    final l$ref = ref;
    return Object.hashAll([
      l$stageId,
      l$ref,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$WordUseCase<TRes> {
  factory CopyWith$Variables$Mutation$WordUseCase(
    Variables$Mutation$WordUseCase instance,
    TRes Function(Variables$Mutation$WordUseCase) then,
  ) = _CopyWithImpl$Variables$Mutation$WordUseCase;

  factory CopyWith$Variables$Mutation$WordUseCase.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$WordUseCase;

  TRes call({
    String? stageId,
    String? ref,
  });
}

class _CopyWithImpl$Variables$Mutation$WordUseCase<TRes>
    implements CopyWith$Variables$Mutation$WordUseCase<TRes> {
  _CopyWithImpl$Variables$Mutation$WordUseCase(
    this._instance,
    this._then,
  );

  final Variables$Mutation$WordUseCase _instance;

  final TRes Function(Variables$Mutation$WordUseCase) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? stageId = _undefined,
    Object? ref = _undefined,
  }) =>
      _then(Variables$Mutation$WordUseCase._({
        ..._instance._$data,
        if (stageId != _undefined && stageId != null)
          'stageId': (stageId as String),
        if (ref != _undefined && ref != null) 'ref': (ref as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$WordUseCase<TRes>
    implements CopyWith$Variables$Mutation$WordUseCase<TRes> {
  _CopyWithStubImpl$Variables$Mutation$WordUseCase(this._res);

  TRes _res;

  call({
    String? stageId,
    String? ref,
  }) =>
      _res;
}

class Mutation$WordUseCase {
  Mutation$WordUseCase({
    required this.user,
    this.$__typename = 'Mutation',
  });

  factory Mutation$WordUseCase.fromJson(Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Mutation$WordUseCase(
      user:
          Mutation$WordUseCase$user.fromJson((l$user as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$WordUseCase$user user;

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
    if (other is! Mutation$WordUseCase || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Mutation$WordUseCase on Mutation$WordUseCase {
  CopyWith$Mutation$WordUseCase<Mutation$WordUseCase> get copyWith =>
      CopyWith$Mutation$WordUseCase(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$WordUseCase<TRes> {
  factory CopyWith$Mutation$WordUseCase(
    Mutation$WordUseCase instance,
    TRes Function(Mutation$WordUseCase) then,
  ) = _CopyWithImpl$Mutation$WordUseCase;

  factory CopyWith$Mutation$WordUseCase.stub(TRes res) =
      _CopyWithStubImpl$Mutation$WordUseCase;

  TRes call({
    Mutation$WordUseCase$user? user,
    String? $__typename,
  });
  CopyWith$Mutation$WordUseCase$user<TRes> get user;
}

class _CopyWithImpl$Mutation$WordUseCase<TRes>
    implements CopyWith$Mutation$WordUseCase<TRes> {
  _CopyWithImpl$Mutation$WordUseCase(
    this._instance,
    this._then,
  );

  final Mutation$WordUseCase _instance;

  final TRes Function(Mutation$WordUseCase) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$WordUseCase(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Mutation$WordUseCase$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$WordUseCase$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Mutation$WordUseCase$user(local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Mutation$WordUseCase<TRes>
    implements CopyWith$Mutation$WordUseCase<TRes> {
  _CopyWithStubImpl$Mutation$WordUseCase(this._res);

  TRes _res;

  call({
    Mutation$WordUseCase$user? user,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$WordUseCase$user<TRes> get user =>
      CopyWith$Mutation$WordUseCase$user.stub(_res);
}

const documentNodeMutationWordUseCase = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'WordUseCase'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'stageId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'ref')),
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
            name: NameNode(value: 'word_use_case'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'stageId'),
                value: VariableNode(name: NameNode(value: 'stageId')),
              ),
              ArgumentNode(
                name: NameNode(value: 'ref'),
                value: VariableNode(name: NameNode(value: 'ref')),
              ),
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
Mutation$WordUseCase _parserFn$Mutation$WordUseCase(
        Map<String, dynamic> data) =>
    Mutation$WordUseCase.fromJson(data);
typedef OnMutationCompleted$Mutation$WordUseCase = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$WordUseCase?,
);

class Options$Mutation$WordUseCase
    extends graphql.MutationOptions<Mutation$WordUseCase> {
  Options$Mutation$WordUseCase({
    String? operationName,
    required Variables$Mutation$WordUseCase variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$WordUseCase? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$WordUseCase? onCompleted,
    graphql.OnMutationUpdate<Mutation$WordUseCase>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$WordUseCase(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationWordUseCase,
          parserFn: _parserFn$Mutation$WordUseCase,
        );

  final OnMutationCompleted$Mutation$WordUseCase? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$WordUseCase
    extends graphql.WatchQueryOptions<Mutation$WordUseCase> {
  WatchOptions$Mutation$WordUseCase({
    String? operationName,
    required Variables$Mutation$WordUseCase variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$WordUseCase? typedOptimisticResult,
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
          document: documentNodeMutationWordUseCase,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$WordUseCase,
        );
}

extension ClientExtension$Mutation$WordUseCase on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$WordUseCase>> mutate$WordUseCase(
          Options$Mutation$WordUseCase options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$WordUseCase> watchMutation$WordUseCase(
          WatchOptions$Mutation$WordUseCase options) =>
      this.watchMutation(options);
}

class Mutation$WordUseCase$HookResult {
  Mutation$WordUseCase$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$WordUseCase runMutation;

  final graphql.QueryResult<Mutation$WordUseCase> result;
}

Mutation$WordUseCase$HookResult useMutation$WordUseCase(
    [WidgetOptions$Mutation$WordUseCase? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$WordUseCase());
  return Mutation$WordUseCase$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$WordUseCase> useWatchMutation$WordUseCase(
        WatchOptions$Mutation$WordUseCase options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$WordUseCase
    extends graphql.MutationOptions<Mutation$WordUseCase> {
  WidgetOptions$Mutation$WordUseCase({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$WordUseCase? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$WordUseCase? onCompleted,
    graphql.OnMutationUpdate<Mutation$WordUseCase>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$WordUseCase(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationWordUseCase,
          parserFn: _parserFn$Mutation$WordUseCase,
        );

  final OnMutationCompleted$Mutation$WordUseCase? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$WordUseCase
    = graphql.MultiSourceResult<Mutation$WordUseCase> Function(
  Variables$Mutation$WordUseCase, {
  Object? optimisticResult,
  Mutation$WordUseCase? typedOptimisticResult,
});
typedef Builder$Mutation$WordUseCase = widgets.Widget Function(
  RunMutation$Mutation$WordUseCase,
  graphql.QueryResult<Mutation$WordUseCase>?,
);

class Mutation$WordUseCase$Widget
    extends graphql_flutter.Mutation<Mutation$WordUseCase> {
  Mutation$WordUseCase$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$WordUseCase? options,
    required Builder$Mutation$WordUseCase builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$WordUseCase(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$WordUseCase$user {
  Mutation$WordUseCase$user({
    required this.word_use_case,
    this.$__typename = 'UserMutation',
  });

  factory Mutation$WordUseCase$user.fromJson(Map<String, dynamic> json) {
    final l$word_use_case = json['word_use_case'];
    final l$$__typename = json['__typename'];
    return Mutation$WordUseCase$user(
      word_use_case:
          Fragment$UserDoc.fromJson((l$word_use_case as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$UserDoc word_use_case;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$word_use_case = word_use_case;
    _resultData['word_use_case'] = l$word_use_case.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$word_use_case = word_use_case;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$word_use_case,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$WordUseCase$user ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$word_use_case = word_use_case;
    final lOther$word_use_case = other.word_use_case;
    if (l$word_use_case != lOther$word_use_case) {
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

extension UtilityExtension$Mutation$WordUseCase$user
    on Mutation$WordUseCase$user {
  CopyWith$Mutation$WordUseCase$user<Mutation$WordUseCase$user> get copyWith =>
      CopyWith$Mutation$WordUseCase$user(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$WordUseCase$user<TRes> {
  factory CopyWith$Mutation$WordUseCase$user(
    Mutation$WordUseCase$user instance,
    TRes Function(Mutation$WordUseCase$user) then,
  ) = _CopyWithImpl$Mutation$WordUseCase$user;

  factory CopyWith$Mutation$WordUseCase$user.stub(TRes res) =
      _CopyWithStubImpl$Mutation$WordUseCase$user;

  TRes call({
    Fragment$UserDoc? word_use_case,
    String? $__typename,
  });
  CopyWith$Fragment$UserDoc<TRes> get word_use_case;
}

class _CopyWithImpl$Mutation$WordUseCase$user<TRes>
    implements CopyWith$Mutation$WordUseCase$user<TRes> {
  _CopyWithImpl$Mutation$WordUseCase$user(
    this._instance,
    this._then,
  );

  final Mutation$WordUseCase$user _instance;

  final TRes Function(Mutation$WordUseCase$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? word_use_case = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$WordUseCase$user(
        word_use_case: word_use_case == _undefined || word_use_case == null
            ? _instance.word_use_case
            : (word_use_case as Fragment$UserDoc),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$UserDoc<TRes> get word_use_case {
    final local$word_use_case = _instance.word_use_case;
    return CopyWith$Fragment$UserDoc(
        local$word_use_case, (e) => call(word_use_case: e));
  }
}

class _CopyWithStubImpl$Mutation$WordUseCase$user<TRes>
    implements CopyWith$Mutation$WordUseCase$user<TRes> {
  _CopyWithStubImpl$Mutation$WordUseCase$user(this._res);

  TRes _res;

  call({
    Fragment$UserDoc? word_use_case,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$UserDoc<TRes> get word_use_case =>
      CopyWith$Fragment$UserDoc.stub(_res);
}

class Variables$Mutation$TranslateSentence {
  factory Variables$Mutation$TranslateSentence({
    required String stageId,
    required String ref,
  }) =>
      Variables$Mutation$TranslateSentence._({
        r'stageId': stageId,
        r'ref': ref,
      });

  Variables$Mutation$TranslateSentence._(this._$data);

  factory Variables$Mutation$TranslateSentence.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$stageId = data['stageId'];
    result$data['stageId'] = (l$stageId as String);
    final l$ref = data['ref'];
    result$data['ref'] = (l$ref as String);
    return Variables$Mutation$TranslateSentence._(result$data);
  }

  Map<String, dynamic> _$data;

  String get stageId => (_$data['stageId'] as String);

  String get ref => (_$data['ref'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$stageId = stageId;
    result$data['stageId'] = l$stageId;
    final l$ref = ref;
    result$data['ref'] = l$ref;
    return result$data;
  }

  CopyWith$Variables$Mutation$TranslateSentence<
          Variables$Mutation$TranslateSentence>
      get copyWith => CopyWith$Variables$Mutation$TranslateSentence(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$TranslateSentence ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$stageId = stageId;
    final lOther$stageId = other.stageId;
    if (l$stageId != lOther$stageId) {
      return false;
    }
    final l$ref = ref;
    final lOther$ref = other.ref;
    if (l$ref != lOther$ref) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$stageId = stageId;
    final l$ref = ref;
    return Object.hashAll([
      l$stageId,
      l$ref,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$TranslateSentence<TRes> {
  factory CopyWith$Variables$Mutation$TranslateSentence(
    Variables$Mutation$TranslateSentence instance,
    TRes Function(Variables$Mutation$TranslateSentence) then,
  ) = _CopyWithImpl$Variables$Mutation$TranslateSentence;

  factory CopyWith$Variables$Mutation$TranslateSentence.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$TranslateSentence;

  TRes call({
    String? stageId,
    String? ref,
  });
}

class _CopyWithImpl$Variables$Mutation$TranslateSentence<TRes>
    implements CopyWith$Variables$Mutation$TranslateSentence<TRes> {
  _CopyWithImpl$Variables$Mutation$TranslateSentence(
    this._instance,
    this._then,
  );

  final Variables$Mutation$TranslateSentence _instance;

  final TRes Function(Variables$Mutation$TranslateSentence) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? stageId = _undefined,
    Object? ref = _undefined,
  }) =>
      _then(Variables$Mutation$TranslateSentence._({
        ..._instance._$data,
        if (stageId != _undefined && stageId != null)
          'stageId': (stageId as String),
        if (ref != _undefined && ref != null) 'ref': (ref as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$TranslateSentence<TRes>
    implements CopyWith$Variables$Mutation$TranslateSentence<TRes> {
  _CopyWithStubImpl$Variables$Mutation$TranslateSentence(this._res);

  TRes _res;

  call({
    String? stageId,
    String? ref,
  }) =>
      _res;
}

class Mutation$TranslateSentence {
  Mutation$TranslateSentence({
    required this.user,
    this.$__typename = 'Mutation',
  });

  factory Mutation$TranslateSentence.fromJson(Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Mutation$TranslateSentence(
      user: Mutation$TranslateSentence$user.fromJson(
          (l$user as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$TranslateSentence$user user;

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
    if (other is! Mutation$TranslateSentence ||
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

extension UtilityExtension$Mutation$TranslateSentence
    on Mutation$TranslateSentence {
  CopyWith$Mutation$TranslateSentence<Mutation$TranslateSentence>
      get copyWith => CopyWith$Mutation$TranslateSentence(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$TranslateSentence<TRes> {
  factory CopyWith$Mutation$TranslateSentence(
    Mutation$TranslateSentence instance,
    TRes Function(Mutation$TranslateSentence) then,
  ) = _CopyWithImpl$Mutation$TranslateSentence;

  factory CopyWith$Mutation$TranslateSentence.stub(TRes res) =
      _CopyWithStubImpl$Mutation$TranslateSentence;

  TRes call({
    Mutation$TranslateSentence$user? user,
    String? $__typename,
  });
  CopyWith$Mutation$TranslateSentence$user<TRes> get user;
}

class _CopyWithImpl$Mutation$TranslateSentence<TRes>
    implements CopyWith$Mutation$TranslateSentence<TRes> {
  _CopyWithImpl$Mutation$TranslateSentence(
    this._instance,
    this._then,
  );

  final Mutation$TranslateSentence _instance;

  final TRes Function(Mutation$TranslateSentence) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$TranslateSentence(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Mutation$TranslateSentence$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$TranslateSentence$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Mutation$TranslateSentence$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Mutation$TranslateSentence<TRes>
    implements CopyWith$Mutation$TranslateSentence<TRes> {
  _CopyWithStubImpl$Mutation$TranslateSentence(this._res);

  TRes _res;

  call({
    Mutation$TranslateSentence$user? user,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$TranslateSentence$user<TRes> get user =>
      CopyWith$Mutation$TranslateSentence$user.stub(_res);
}

const documentNodeMutationTranslateSentence = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'TranslateSentence'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'stageId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'ref')),
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
            name: NameNode(value: 'translate_sentence'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'stageId'),
                value: VariableNode(name: NameNode(value: 'stageId')),
              ),
              ArgumentNode(
                name: NameNode(value: 'ref'),
                value: VariableNode(name: NameNode(value: 'ref')),
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
Mutation$TranslateSentence _parserFn$Mutation$TranslateSentence(
        Map<String, dynamic> data) =>
    Mutation$TranslateSentence.fromJson(data);
typedef OnMutationCompleted$Mutation$TranslateSentence = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$TranslateSentence?,
);

class Options$Mutation$TranslateSentence
    extends graphql.MutationOptions<Mutation$TranslateSentence> {
  Options$Mutation$TranslateSentence({
    String? operationName,
    required Variables$Mutation$TranslateSentence variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$TranslateSentence? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$TranslateSentence? onCompleted,
    graphql.OnMutationUpdate<Mutation$TranslateSentence>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$TranslateSentence(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationTranslateSentence,
          parserFn: _parserFn$Mutation$TranslateSentence,
        );

  final OnMutationCompleted$Mutation$TranslateSentence? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$TranslateSentence
    extends graphql.WatchQueryOptions<Mutation$TranslateSentence> {
  WatchOptions$Mutation$TranslateSentence({
    String? operationName,
    required Variables$Mutation$TranslateSentence variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$TranslateSentence? typedOptimisticResult,
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
          document: documentNodeMutationTranslateSentence,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$TranslateSentence,
        );
}

extension ClientExtension$Mutation$TranslateSentence on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$TranslateSentence>>
      mutate$TranslateSentence(
              Options$Mutation$TranslateSentence options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$TranslateSentence>
      watchMutation$TranslateSentence(
              WatchOptions$Mutation$TranslateSentence options) =>
          this.watchMutation(options);
}

class Mutation$TranslateSentence$HookResult {
  Mutation$TranslateSentence$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$TranslateSentence runMutation;

  final graphql.QueryResult<Mutation$TranslateSentence> result;
}

Mutation$TranslateSentence$HookResult useMutation$TranslateSentence(
    [WidgetOptions$Mutation$TranslateSentence? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$TranslateSentence());
  return Mutation$TranslateSentence$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$TranslateSentence>
    useWatchMutation$TranslateSentence(
            WatchOptions$Mutation$TranslateSentence options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$TranslateSentence
    extends graphql.MutationOptions<Mutation$TranslateSentence> {
  WidgetOptions$Mutation$TranslateSentence({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$TranslateSentence? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$TranslateSentence? onCompleted,
    graphql.OnMutationUpdate<Mutation$TranslateSentence>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$TranslateSentence(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationTranslateSentence,
          parserFn: _parserFn$Mutation$TranslateSentence,
        );

  final OnMutationCompleted$Mutation$TranslateSentence? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$TranslateSentence
    = graphql.MultiSourceResult<Mutation$TranslateSentence> Function(
  Variables$Mutation$TranslateSentence, {
  Object? optimisticResult,
  Mutation$TranslateSentence? typedOptimisticResult,
});
typedef Builder$Mutation$TranslateSentence = widgets.Widget Function(
  RunMutation$Mutation$TranslateSentence,
  graphql.QueryResult<Mutation$TranslateSentence>?,
);

class Mutation$TranslateSentence$Widget
    extends graphql_flutter.Mutation<Mutation$TranslateSentence> {
  Mutation$TranslateSentence$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$TranslateSentence? options,
    required Builder$Mutation$TranslateSentence builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$TranslateSentence(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$TranslateSentence$user {
  Mutation$TranslateSentence$user({
    required this.translate_sentence,
    this.$__typename = 'UserMutation',
  });

  factory Mutation$TranslateSentence$user.fromJson(Map<String, dynamic> json) {
    final l$translate_sentence = json['translate_sentence'];
    final l$$__typename = json['__typename'];
    return Mutation$TranslateSentence$user(
      translate_sentence: (l$translate_sentence as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String translate_sentence;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$translate_sentence = translate_sentence;
    _resultData['translate_sentence'] = l$translate_sentence;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$translate_sentence = translate_sentence;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$translate_sentence,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$TranslateSentence$user ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$translate_sentence = translate_sentence;
    final lOther$translate_sentence = other.translate_sentence;
    if (l$translate_sentence != lOther$translate_sentence) {
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

extension UtilityExtension$Mutation$TranslateSentence$user
    on Mutation$TranslateSentence$user {
  CopyWith$Mutation$TranslateSentence$user<Mutation$TranslateSentence$user>
      get copyWith => CopyWith$Mutation$TranslateSentence$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$TranslateSentence$user<TRes> {
  factory CopyWith$Mutation$TranslateSentence$user(
    Mutation$TranslateSentence$user instance,
    TRes Function(Mutation$TranslateSentence$user) then,
  ) = _CopyWithImpl$Mutation$TranslateSentence$user;

  factory CopyWith$Mutation$TranslateSentence$user.stub(TRes res) =
      _CopyWithStubImpl$Mutation$TranslateSentence$user;

  TRes call({
    String? translate_sentence,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$TranslateSentence$user<TRes>
    implements CopyWith$Mutation$TranslateSentence$user<TRes> {
  _CopyWithImpl$Mutation$TranslateSentence$user(
    this._instance,
    this._then,
  );

  final Mutation$TranslateSentence$user _instance;

  final TRes Function(Mutation$TranslateSentence$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? translate_sentence = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$TranslateSentence$user(
        translate_sentence:
            translate_sentence == _undefined || translate_sentence == null
                ? _instance.translate_sentence
                : (translate_sentence as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$TranslateSentence$user<TRes>
    implements CopyWith$Mutation$TranslateSentence$user<TRes> {
  _CopyWithStubImpl$Mutation$TranslateSentence$user(this._res);

  TRes _res;

  call({
    String? translate_sentence,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$TranslateWord {
  factory Variables$Mutation$TranslateWord({
    required String stageId,
    required String ref,
  }) =>
      Variables$Mutation$TranslateWord._({
        r'stageId': stageId,
        r'ref': ref,
      });

  Variables$Mutation$TranslateWord._(this._$data);

  factory Variables$Mutation$TranslateWord.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$stageId = data['stageId'];
    result$data['stageId'] = (l$stageId as String);
    final l$ref = data['ref'];
    result$data['ref'] = (l$ref as String);
    return Variables$Mutation$TranslateWord._(result$data);
  }

  Map<String, dynamic> _$data;

  String get stageId => (_$data['stageId'] as String);

  String get ref => (_$data['ref'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$stageId = stageId;
    result$data['stageId'] = l$stageId;
    final l$ref = ref;
    result$data['ref'] = l$ref;
    return result$data;
  }

  CopyWith$Variables$Mutation$TranslateWord<Variables$Mutation$TranslateWord>
      get copyWith => CopyWith$Variables$Mutation$TranslateWord(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$TranslateWord ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$stageId = stageId;
    final lOther$stageId = other.stageId;
    if (l$stageId != lOther$stageId) {
      return false;
    }
    final l$ref = ref;
    final lOther$ref = other.ref;
    if (l$ref != lOther$ref) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$stageId = stageId;
    final l$ref = ref;
    return Object.hashAll([
      l$stageId,
      l$ref,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$TranslateWord<TRes> {
  factory CopyWith$Variables$Mutation$TranslateWord(
    Variables$Mutation$TranslateWord instance,
    TRes Function(Variables$Mutation$TranslateWord) then,
  ) = _CopyWithImpl$Variables$Mutation$TranslateWord;

  factory CopyWith$Variables$Mutation$TranslateWord.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$TranslateWord;

  TRes call({
    String? stageId,
    String? ref,
  });
}

class _CopyWithImpl$Variables$Mutation$TranslateWord<TRes>
    implements CopyWith$Variables$Mutation$TranslateWord<TRes> {
  _CopyWithImpl$Variables$Mutation$TranslateWord(
    this._instance,
    this._then,
  );

  final Variables$Mutation$TranslateWord _instance;

  final TRes Function(Variables$Mutation$TranslateWord) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? stageId = _undefined,
    Object? ref = _undefined,
  }) =>
      _then(Variables$Mutation$TranslateWord._({
        ..._instance._$data,
        if (stageId != _undefined && stageId != null)
          'stageId': (stageId as String),
        if (ref != _undefined && ref != null) 'ref': (ref as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$TranslateWord<TRes>
    implements CopyWith$Variables$Mutation$TranslateWord<TRes> {
  _CopyWithStubImpl$Variables$Mutation$TranslateWord(this._res);

  TRes _res;

  call({
    String? stageId,
    String? ref,
  }) =>
      _res;
}

class Mutation$TranslateWord {
  Mutation$TranslateWord({
    required this.user,
    this.$__typename = 'Mutation',
  });

  factory Mutation$TranslateWord.fromJson(Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Mutation$TranslateWord(
      user: Mutation$TranslateWord$user.fromJson(
          (l$user as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$TranslateWord$user user;

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
    if (other is! Mutation$TranslateWord || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Mutation$TranslateWord on Mutation$TranslateWord {
  CopyWith$Mutation$TranslateWord<Mutation$TranslateWord> get copyWith =>
      CopyWith$Mutation$TranslateWord(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$TranslateWord<TRes> {
  factory CopyWith$Mutation$TranslateWord(
    Mutation$TranslateWord instance,
    TRes Function(Mutation$TranslateWord) then,
  ) = _CopyWithImpl$Mutation$TranslateWord;

  factory CopyWith$Mutation$TranslateWord.stub(TRes res) =
      _CopyWithStubImpl$Mutation$TranslateWord;

  TRes call({
    Mutation$TranslateWord$user? user,
    String? $__typename,
  });
  CopyWith$Mutation$TranslateWord$user<TRes> get user;
}

class _CopyWithImpl$Mutation$TranslateWord<TRes>
    implements CopyWith$Mutation$TranslateWord<TRes> {
  _CopyWithImpl$Mutation$TranslateWord(
    this._instance,
    this._then,
  );

  final Mutation$TranslateWord _instance;

  final TRes Function(Mutation$TranslateWord) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$TranslateWord(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Mutation$TranslateWord$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$TranslateWord$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Mutation$TranslateWord$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Mutation$TranslateWord<TRes>
    implements CopyWith$Mutation$TranslateWord<TRes> {
  _CopyWithStubImpl$Mutation$TranslateWord(this._res);

  TRes _res;

  call({
    Mutation$TranslateWord$user? user,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$TranslateWord$user<TRes> get user =>
      CopyWith$Mutation$TranslateWord$user.stub(_res);
}

const documentNodeMutationTranslateWord = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'TranslateWord'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'stageId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'ref')),
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
            name: NameNode(value: 'translate_word'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'stageId'),
                value: VariableNode(name: NameNode(value: 'stageId')),
              ),
              ArgumentNode(
                name: NameNode(value: 'ref'),
                value: VariableNode(name: NameNode(value: 'ref')),
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
Mutation$TranslateWord _parserFn$Mutation$TranslateWord(
        Map<String, dynamic> data) =>
    Mutation$TranslateWord.fromJson(data);
typedef OnMutationCompleted$Mutation$TranslateWord = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$TranslateWord?,
);

class Options$Mutation$TranslateWord
    extends graphql.MutationOptions<Mutation$TranslateWord> {
  Options$Mutation$TranslateWord({
    String? operationName,
    required Variables$Mutation$TranslateWord variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$TranslateWord? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$TranslateWord? onCompleted,
    graphql.OnMutationUpdate<Mutation$TranslateWord>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$TranslateWord(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationTranslateWord,
          parserFn: _parserFn$Mutation$TranslateWord,
        );

  final OnMutationCompleted$Mutation$TranslateWord? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$TranslateWord
    extends graphql.WatchQueryOptions<Mutation$TranslateWord> {
  WatchOptions$Mutation$TranslateWord({
    String? operationName,
    required Variables$Mutation$TranslateWord variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$TranslateWord? typedOptimisticResult,
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
          document: documentNodeMutationTranslateWord,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$TranslateWord,
        );
}

extension ClientExtension$Mutation$TranslateWord on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$TranslateWord>> mutate$TranslateWord(
          Options$Mutation$TranslateWord options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$TranslateWord> watchMutation$TranslateWord(
          WatchOptions$Mutation$TranslateWord options) =>
      this.watchMutation(options);
}

class Mutation$TranslateWord$HookResult {
  Mutation$TranslateWord$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$TranslateWord runMutation;

  final graphql.QueryResult<Mutation$TranslateWord> result;
}

Mutation$TranslateWord$HookResult useMutation$TranslateWord(
    [WidgetOptions$Mutation$TranslateWord? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$TranslateWord());
  return Mutation$TranslateWord$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$TranslateWord> useWatchMutation$TranslateWord(
        WatchOptions$Mutation$TranslateWord options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$TranslateWord
    extends graphql.MutationOptions<Mutation$TranslateWord> {
  WidgetOptions$Mutation$TranslateWord({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$TranslateWord? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$TranslateWord? onCompleted,
    graphql.OnMutationUpdate<Mutation$TranslateWord>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$TranslateWord(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationTranslateWord,
          parserFn: _parserFn$Mutation$TranslateWord,
        );

  final OnMutationCompleted$Mutation$TranslateWord? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$TranslateWord
    = graphql.MultiSourceResult<Mutation$TranslateWord> Function(
  Variables$Mutation$TranslateWord, {
  Object? optimisticResult,
  Mutation$TranslateWord? typedOptimisticResult,
});
typedef Builder$Mutation$TranslateWord = widgets.Widget Function(
  RunMutation$Mutation$TranslateWord,
  graphql.QueryResult<Mutation$TranslateWord>?,
);

class Mutation$TranslateWord$Widget
    extends graphql_flutter.Mutation<Mutation$TranslateWord> {
  Mutation$TranslateWord$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$TranslateWord? options,
    required Builder$Mutation$TranslateWord builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$TranslateWord(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$TranslateWord$user {
  Mutation$TranslateWord$user({
    required this.translate_word,
    this.$__typename = 'UserMutation',
  });

  factory Mutation$TranslateWord$user.fromJson(Map<String, dynamic> json) {
    final l$translate_word = json['translate_word'];
    final l$$__typename = json['__typename'];
    return Mutation$TranslateWord$user(
      translate_word: (l$translate_word as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String translate_word;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$translate_word = translate_word;
    _resultData['translate_word'] = l$translate_word;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$translate_word = translate_word;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$translate_word,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$TranslateWord$user ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$translate_word = translate_word;
    final lOther$translate_word = other.translate_word;
    if (l$translate_word != lOther$translate_word) {
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

extension UtilityExtension$Mutation$TranslateWord$user
    on Mutation$TranslateWord$user {
  CopyWith$Mutation$TranslateWord$user<Mutation$TranslateWord$user>
      get copyWith => CopyWith$Mutation$TranslateWord$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$TranslateWord$user<TRes> {
  factory CopyWith$Mutation$TranslateWord$user(
    Mutation$TranslateWord$user instance,
    TRes Function(Mutation$TranslateWord$user) then,
  ) = _CopyWithImpl$Mutation$TranslateWord$user;

  factory CopyWith$Mutation$TranslateWord$user.stub(TRes res) =
      _CopyWithStubImpl$Mutation$TranslateWord$user;

  TRes call({
    String? translate_word,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$TranslateWord$user<TRes>
    implements CopyWith$Mutation$TranslateWord$user<TRes> {
  _CopyWithImpl$Mutation$TranslateWord$user(
    this._instance,
    this._then,
  );

  final Mutation$TranslateWord$user _instance;

  final TRes Function(Mutation$TranslateWord$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? translate_word = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$TranslateWord$user(
        translate_word: translate_word == _undefined || translate_word == null
            ? _instance.translate_word
            : (translate_word as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$TranslateWord$user<TRes>
    implements CopyWith$Mutation$TranslateWord$user<TRes> {
  _CopyWithStubImpl$Mutation$TranslateWord$user(this._res);

  TRes _res;

  call({
    String? translate_word,
    String? $__typename,
  }) =>
      _res;
}
