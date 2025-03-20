import '../schema.graphqls.dart';
import 'package:api/api.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Fragment$PageInfo {
  Fragment$PageInfo({
    required this.hasNextPage,
    this.nextCursor,
    this.$__typename = 'PageInfo',
  });

  factory Fragment$PageInfo.fromJson(Map<String, dynamic> json) {
    final l$hasNextPage = json['hasNextPage'];
    final l$nextCursor = json['nextCursor'];
    final l$$__typename = json['__typename'];
    return Fragment$PageInfo(
      hasNextPage: (l$hasNextPage as bool),
      nextCursor: (l$nextCursor as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool hasNextPage;

  final String? nextCursor;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$hasNextPage = hasNextPage;
    _resultData['hasNextPage'] = l$hasNextPage;
    final l$nextCursor = nextCursor;
    _resultData['nextCursor'] = l$nextCursor;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$hasNextPage = hasNextPage;
    final l$nextCursor = nextCursor;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$hasNextPage,
      l$nextCursor,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$PageInfo || runtimeType != other.runtimeType) {
      return false;
    }
    final l$hasNextPage = hasNextPage;
    final lOther$hasNextPage = other.hasNextPage;
    if (l$hasNextPage != lOther$hasNextPage) {
      return false;
    }
    final l$nextCursor = nextCursor;
    final lOther$nextCursor = other.nextCursor;
    if (l$nextCursor != lOther$nextCursor) {
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

extension UtilityExtension$Fragment$PageInfo on Fragment$PageInfo {
  CopyWith$Fragment$PageInfo<Fragment$PageInfo> get copyWith =>
      CopyWith$Fragment$PageInfo(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$PageInfo<TRes> {
  factory CopyWith$Fragment$PageInfo(
    Fragment$PageInfo instance,
    TRes Function(Fragment$PageInfo) then,
  ) = _CopyWithImpl$Fragment$PageInfo;

  factory CopyWith$Fragment$PageInfo.stub(TRes res) =
      _CopyWithStubImpl$Fragment$PageInfo;

  TRes call({
    bool? hasNextPage,
    String? nextCursor,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$PageInfo<TRes>
    implements CopyWith$Fragment$PageInfo<TRes> {
  _CopyWithImpl$Fragment$PageInfo(
    this._instance,
    this._then,
  );

  final Fragment$PageInfo _instance;

  final TRes Function(Fragment$PageInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? hasNextPage = _undefined,
    Object? nextCursor = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$PageInfo(
        hasNextPage: hasNextPage == _undefined || hasNextPage == null
            ? _instance.hasNextPage
            : (hasNextPage as bool),
        nextCursor: nextCursor == _undefined
            ? _instance.nextCursor
            : (nextCursor as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$PageInfo<TRes>
    implements CopyWith$Fragment$PageInfo<TRes> {
  _CopyWithStubImpl$Fragment$PageInfo(this._res);

  TRes _res;

  call({
    bool? hasNextPage,
    String? nextCursor,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionPageInfo = FragmentDefinitionNode(
  name: NameNode(value: 'PageInfo'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'PageInfo'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'hasNextPage'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'nextCursor'),
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
);
const documentNodeFragmentPageInfo = DocumentNode(definitions: [
  fragmentDefinitionPageInfo,
]);

extension ClientExtension$Fragment$PageInfo on graphql.GraphQLClient {
  void writeFragment$PageInfo({
    required Fragment$PageInfo data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'PageInfo',
            document: documentNodeFragmentPageInfo,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$PageInfo? readFragment$PageInfo({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'PageInfo',
          document: documentNodeFragmentPageInfo,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$PageInfo.fromJson(result);
  }
}

class Fragment$AuthInfo {
  Fragment$AuthInfo({
    required this.verified,
    this.token,
    this.v_session,
    this.$__typename = 'AuthInfo',
  });

  factory Fragment$AuthInfo.fromJson(Map<String, dynamic> json) {
    final l$verified = json['verified'];
    final l$token = json['token'];
    final l$v_session = json['v_session'];
    final l$$__typename = json['__typename'];
    return Fragment$AuthInfo(
      verified: (l$verified as bool),
      token: (l$token as String?),
      v_session: (l$v_session as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool verified;

  final String? token;

  final String? v_session;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$verified = verified;
    _resultData['verified'] = l$verified;
    final l$token = token;
    _resultData['token'] = l$token;
    final l$v_session = v_session;
    _resultData['v_session'] = l$v_session;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$verified = verified;
    final l$token = token;
    final l$v_session = v_session;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$verified,
      l$token,
      l$v_session,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$AuthInfo || runtimeType != other.runtimeType) {
      return false;
    }
    final l$verified = verified;
    final lOther$verified = other.verified;
    if (l$verified != lOther$verified) {
      return false;
    }
    final l$token = token;
    final lOther$token = other.token;
    if (l$token != lOther$token) {
      return false;
    }
    final l$v_session = v_session;
    final lOther$v_session = other.v_session;
    if (l$v_session != lOther$v_session) {
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

extension UtilityExtension$Fragment$AuthInfo on Fragment$AuthInfo {
  CopyWith$Fragment$AuthInfo<Fragment$AuthInfo> get copyWith =>
      CopyWith$Fragment$AuthInfo(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$AuthInfo<TRes> {
  factory CopyWith$Fragment$AuthInfo(
    Fragment$AuthInfo instance,
    TRes Function(Fragment$AuthInfo) then,
  ) = _CopyWithImpl$Fragment$AuthInfo;

  factory CopyWith$Fragment$AuthInfo.stub(TRes res) =
      _CopyWithStubImpl$Fragment$AuthInfo;

  TRes call({
    bool? verified,
    String? token,
    String? v_session,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$AuthInfo<TRes>
    implements CopyWith$Fragment$AuthInfo<TRes> {
  _CopyWithImpl$Fragment$AuthInfo(
    this._instance,
    this._then,
  );

  final Fragment$AuthInfo _instance;

  final TRes Function(Fragment$AuthInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? verified = _undefined,
    Object? token = _undefined,
    Object? v_session = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$AuthInfo(
        verified: verified == _undefined || verified == null
            ? _instance.verified
            : (verified as bool),
        token: token == _undefined ? _instance.token : (token as String?),
        v_session: v_session == _undefined
            ? _instance.v_session
            : (v_session as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$AuthInfo<TRes>
    implements CopyWith$Fragment$AuthInfo<TRes> {
  _CopyWithStubImpl$Fragment$AuthInfo(this._res);

  TRes _res;

  call({
    bool? verified,
    String? token,
    String? v_session,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionAuthInfo = FragmentDefinitionNode(
  name: NameNode(value: 'AuthInfo'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'AuthInfo'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'verified'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'token'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'v_session'),
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
);
const documentNodeFragmentAuthInfo = DocumentNode(definitions: [
  fragmentDefinitionAuthInfo,
]);

extension ClientExtension$Fragment$AuthInfo on graphql.GraphQLClient {
  void writeFragment$AuthInfo({
    required Fragment$AuthInfo data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'AuthInfo',
            document: documentNodeFragmentAuthInfo,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$AuthInfo? readFragment$AuthInfo({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'AuthInfo',
          document: documentNodeFragmentAuthInfo,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$AuthInfo.fromJson(result);
  }
}

class Fragment$PublicUser {
  Fragment$PublicUser({
    required this.id,
    required this.name,
    required this.avatar,
    this.$__typename = 'User',
  });

  factory Fragment$PublicUser.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$avatar = json['avatar'];
    final l$$__typename = json['__typename'];
    return Fragment$PublicUser(
      id: (l$id as String),
      name: (l$name as String),
      avatar: avatarFromJson(l$avatar),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final Avatar avatar;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$avatar = avatar;
    _resultData['avatar'] = avatarToJson(l$avatar);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$avatar = avatar;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$avatar,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$PublicUser || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$avatar = avatar;
    final lOther$avatar = other.avatar;
    if (l$avatar != lOther$avatar) {
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

extension UtilityExtension$Fragment$PublicUser on Fragment$PublicUser {
  CopyWith$Fragment$PublicUser<Fragment$PublicUser> get copyWith =>
      CopyWith$Fragment$PublicUser(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$PublicUser<TRes> {
  factory CopyWith$Fragment$PublicUser(
    Fragment$PublicUser instance,
    TRes Function(Fragment$PublicUser) then,
  ) = _CopyWithImpl$Fragment$PublicUser;

  factory CopyWith$Fragment$PublicUser.stub(TRes res) =
      _CopyWithStubImpl$Fragment$PublicUser;

  TRes call({
    String? id,
    String? name,
    Avatar? avatar,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$PublicUser<TRes>
    implements CopyWith$Fragment$PublicUser<TRes> {
  _CopyWithImpl$Fragment$PublicUser(
    this._instance,
    this._then,
  );

  final Fragment$PublicUser _instance;

  final TRes Function(Fragment$PublicUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? avatar = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$PublicUser(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        avatar: avatar == _undefined || avatar == null
            ? _instance.avatar
            : (avatar as Avatar),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$PublicUser<TRes>
    implements CopyWith$Fragment$PublicUser<TRes> {
  _CopyWithStubImpl$Fragment$PublicUser(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    Avatar? avatar,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionPublicUser = FragmentDefinitionNode(
  name: NameNode(value: 'PublicUser'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'User'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'id'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'name'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'avatar'),
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
);
const documentNodeFragmentPublicUser = DocumentNode(definitions: [
  fragmentDefinitionPublicUser,
]);

extension ClientExtension$Fragment$PublicUser on graphql.GraphQLClient {
  void writeFragment$PublicUser({
    required Fragment$PublicUser data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'PublicUser',
            document: documentNodeFragmentPublicUser,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$PublicUser? readFragment$PublicUser({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'PublicUser',
          document: documentNodeFragmentPublicUser,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$PublicUser.fromJson(result);
  }
}

class Fragment$MeAdmin {
  Fragment$MeAdmin({
    required this.id,
    this.$__typename = 'Admin',
  });

  factory Fragment$MeAdmin.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Fragment$MeAdmin(
      id: (l$id as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$MeAdmin || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Fragment$MeAdmin on Fragment$MeAdmin {
  CopyWith$Fragment$MeAdmin<Fragment$MeAdmin> get copyWith =>
      CopyWith$Fragment$MeAdmin(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$MeAdmin<TRes> {
  factory CopyWith$Fragment$MeAdmin(
    Fragment$MeAdmin instance,
    TRes Function(Fragment$MeAdmin) then,
  ) = _CopyWithImpl$Fragment$MeAdmin;

  factory CopyWith$Fragment$MeAdmin.stub(TRes res) =
      _CopyWithStubImpl$Fragment$MeAdmin;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$MeAdmin<TRes>
    implements CopyWith$Fragment$MeAdmin<TRes> {
  _CopyWithImpl$Fragment$MeAdmin(
    this._instance,
    this._then,
  );

  final Fragment$MeAdmin _instance;

  final TRes Function(Fragment$MeAdmin) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$MeAdmin(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$MeAdmin<TRes>
    implements CopyWith$Fragment$MeAdmin<TRes> {
  _CopyWithStubImpl$Fragment$MeAdmin(this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionMeAdmin = FragmentDefinitionNode(
  name: NameNode(value: 'MeAdmin'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'Admin'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'id'),
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
);
const documentNodeFragmentMeAdmin = DocumentNode(definitions: [
  fragmentDefinitionMeAdmin,
]);

extension ClientExtension$Fragment$MeAdmin on graphql.GraphQLClient {
  void writeFragment$MeAdmin({
    required Fragment$MeAdmin data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'MeAdmin',
            document: documentNodeFragmentMeAdmin,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$MeAdmin? readFragment$MeAdmin({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'MeAdmin',
          document: documentNodeFragmentMeAdmin,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$MeAdmin.fromJson(result);
  }
}

class Fragment$Journey {
  Fragment$Journey({
    required this.id,
    required this.name,
    required this.avatar,
    required this.from,
    required this.to,
    this.lastStudyDate,
    required this.createdAt,
    required this.updatedAt,
    this.$__typename = 'Journey',
  });

  factory Fragment$Journey.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$avatar = json['avatar'];
    final l$from = json['from'];
    final l$to = json['to'];
    final l$lastStudyDate = json['lastStudyDate'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$$__typename = json['__typename'];
    return Fragment$Journey(
      id: (l$id as String),
      name: (l$name as String),
      avatar: (l$avatar as String),
      from: (l$from as String),
      to: (l$to as String),
      lastStudyDate:
          l$lastStudyDate == null ? null : dateTimeFromJson(l$lastStudyDate),
      createdAt: dateTimeFromJson(l$createdAt),
      updatedAt: dateTimeFromJson(l$updatedAt),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String avatar;

  final String from;

  final String to;

  final DateTime? lastStudyDate;

  final DateTime createdAt;

  final DateTime updatedAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$avatar = avatar;
    _resultData['avatar'] = l$avatar;
    final l$from = from;
    _resultData['from'] = l$from;
    final l$to = to;
    _resultData['to'] = l$to;
    final l$lastStudyDate = lastStudyDate;
    _resultData['lastStudyDate'] =
        l$lastStudyDate == null ? null : dateTimeToJson(l$lastStudyDate);
    final l$createdAt = createdAt;
    _resultData['createdAt'] = dateTimeToJson(l$createdAt);
    final l$updatedAt = updatedAt;
    _resultData['updatedAt'] = dateTimeToJson(l$updatedAt);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$avatar = avatar;
    final l$from = from;
    final l$to = to;
    final l$lastStudyDate = lastStudyDate;
    final l$createdAt = createdAt;
    final l$updatedAt = updatedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$avatar,
      l$from,
      l$to,
      l$lastStudyDate,
      l$createdAt,
      l$updatedAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$Journey || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$avatar = avatar;
    final lOther$avatar = other.avatar;
    if (l$avatar != lOther$avatar) {
      return false;
    }
    final l$from = from;
    final lOther$from = other.from;
    if (l$from != lOther$from) {
      return false;
    }
    final l$to = to;
    final lOther$to = other.to;
    if (l$to != lOther$to) {
      return false;
    }
    final l$lastStudyDate = lastStudyDate;
    final lOther$lastStudyDate = other.lastStudyDate;
    if (l$lastStudyDate != lOther$lastStudyDate) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$updatedAt = updatedAt;
    final lOther$updatedAt = other.updatedAt;
    if (l$updatedAt != lOther$updatedAt) {
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

extension UtilityExtension$Fragment$Journey on Fragment$Journey {
  CopyWith$Fragment$Journey<Fragment$Journey> get copyWith =>
      CopyWith$Fragment$Journey(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$Journey<TRes> {
  factory CopyWith$Fragment$Journey(
    Fragment$Journey instance,
    TRes Function(Fragment$Journey) then,
  ) = _CopyWithImpl$Fragment$Journey;

  factory CopyWith$Fragment$Journey.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Journey;

  TRes call({
    String? id,
    String? name,
    String? avatar,
    String? from,
    String? to,
    DateTime? lastStudyDate,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$Journey<TRes>
    implements CopyWith$Fragment$Journey<TRes> {
  _CopyWithImpl$Fragment$Journey(
    this._instance,
    this._then,
  );

  final Fragment$Journey _instance;

  final TRes Function(Fragment$Journey) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? avatar = _undefined,
    Object? from = _undefined,
    Object? to = _undefined,
    Object? lastStudyDate = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Journey(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        avatar: avatar == _undefined || avatar == null
            ? _instance.avatar
            : (avatar as String),
        from: from == _undefined || from == null
            ? _instance.from
            : (from as String),
        to: to == _undefined || to == null ? _instance.to : (to as String),
        lastStudyDate: lastStudyDate == _undefined
            ? _instance.lastStudyDate
            : (lastStudyDate as DateTime?),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as DateTime),
        updatedAt: updatedAt == _undefined || updatedAt == null
            ? _instance.updatedAt
            : (updatedAt as DateTime),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$Journey<TRes>
    implements CopyWith$Fragment$Journey<TRes> {
  _CopyWithStubImpl$Fragment$Journey(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? avatar,
    String? from,
    String? to,
    DateTime? lastStudyDate,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionJourney = FragmentDefinitionNode(
  name: NameNode(value: 'Journey'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'Journey'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'id'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'name'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'avatar'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'from'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'to'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'lastStudyDate'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'updatedAt'),
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
);
const documentNodeFragmentJourney = DocumentNode(definitions: [
  fragmentDefinitionJourney,
]);

extension ClientExtension$Fragment$Journey on graphql.GraphQLClient {
  void writeFragment$Journey({
    required Fragment$Journey data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'Journey',
            document: documentNodeFragmentJourney,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$Journey? readFragment$Journey({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'Journey',
          document: documentNodeFragmentJourney,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$Journey.fromJson(result);
  }
}

class Fragment$Levels {
  Fragment$Levels({
    required this.listening,
    required this.reading,
    required this.speaking,
    required this.writing,
    required this.grammar,
    required this.vocabulary,
    this.$__typename = 'Levels',
  });

  factory Fragment$Levels.fromJson(Map<String, dynamic> json) {
    final l$listening = json['listening'];
    final l$reading = json['reading'];
    final l$speaking = json['speaking'];
    final l$writing = json['writing'];
    final l$grammar = json['grammar'];
    final l$vocabulary = json['vocabulary'];
    final l$$__typename = json['__typename'];
    return Fragment$Levels(
      listening: (l$listening as int),
      reading: (l$reading as int),
      speaking: (l$speaking as int),
      writing: (l$writing as int),
      grammar: (l$grammar as int),
      vocabulary: (l$vocabulary as int),
      $__typename: (l$$__typename as String),
    );
  }

  final int listening;

  final int reading;

  final int speaking;

  final int writing;

  final int grammar;

  final int vocabulary;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$listening = listening;
    _resultData['listening'] = l$listening;
    final l$reading = reading;
    _resultData['reading'] = l$reading;
    final l$speaking = speaking;
    _resultData['speaking'] = l$speaking;
    final l$writing = writing;
    _resultData['writing'] = l$writing;
    final l$grammar = grammar;
    _resultData['grammar'] = l$grammar;
    final l$vocabulary = vocabulary;
    _resultData['vocabulary'] = l$vocabulary;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$listening = listening;
    final l$reading = reading;
    final l$speaking = speaking;
    final l$writing = writing;
    final l$grammar = grammar;
    final l$vocabulary = vocabulary;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$listening,
      l$reading,
      l$speaking,
      l$writing,
      l$grammar,
      l$vocabulary,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$Levels || runtimeType != other.runtimeType) {
      return false;
    }
    final l$listening = listening;
    final lOther$listening = other.listening;
    if (l$listening != lOther$listening) {
      return false;
    }
    final l$reading = reading;
    final lOther$reading = other.reading;
    if (l$reading != lOther$reading) {
      return false;
    }
    final l$speaking = speaking;
    final lOther$speaking = other.speaking;
    if (l$speaking != lOther$speaking) {
      return false;
    }
    final l$writing = writing;
    final lOther$writing = other.writing;
    if (l$writing != lOther$writing) {
      return false;
    }
    final l$grammar = grammar;
    final lOther$grammar = other.grammar;
    if (l$grammar != lOther$grammar) {
      return false;
    }
    final l$vocabulary = vocabulary;
    final lOther$vocabulary = other.vocabulary;
    if (l$vocabulary != lOther$vocabulary) {
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

extension UtilityExtension$Fragment$Levels on Fragment$Levels {
  CopyWith$Fragment$Levels<Fragment$Levels> get copyWith =>
      CopyWith$Fragment$Levels(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$Levels<TRes> {
  factory CopyWith$Fragment$Levels(
    Fragment$Levels instance,
    TRes Function(Fragment$Levels) then,
  ) = _CopyWithImpl$Fragment$Levels;

  factory CopyWith$Fragment$Levels.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Levels;

  TRes call({
    int? listening,
    int? reading,
    int? speaking,
    int? writing,
    int? grammar,
    int? vocabulary,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$Levels<TRes>
    implements CopyWith$Fragment$Levels<TRes> {
  _CopyWithImpl$Fragment$Levels(
    this._instance,
    this._then,
  );

  final Fragment$Levels _instance;

  final TRes Function(Fragment$Levels) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? listening = _undefined,
    Object? reading = _undefined,
    Object? speaking = _undefined,
    Object? writing = _undefined,
    Object? grammar = _undefined,
    Object? vocabulary = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Levels(
        listening: listening == _undefined || listening == null
            ? _instance.listening
            : (listening as int),
        reading: reading == _undefined || reading == null
            ? _instance.reading
            : (reading as int),
        speaking: speaking == _undefined || speaking == null
            ? _instance.speaking
            : (speaking as int),
        writing: writing == _undefined || writing == null
            ? _instance.writing
            : (writing as int),
        grammar: grammar == _undefined || grammar == null
            ? _instance.grammar
            : (grammar as int),
        vocabulary: vocabulary == _undefined || vocabulary == null
            ? _instance.vocabulary
            : (vocabulary as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$Levels<TRes>
    implements CopyWith$Fragment$Levels<TRes> {
  _CopyWithStubImpl$Fragment$Levels(this._res);

  TRes _res;

  call({
    int? listening,
    int? reading,
    int? speaking,
    int? writing,
    int? grammar,
    int? vocabulary,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionLevels = FragmentDefinitionNode(
  name: NameNode(value: 'Levels'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'Levels'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'listening'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'reading'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'speaking'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'writing'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'grammar'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'vocabulary'),
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
);
const documentNodeFragmentLevels = DocumentNode(definitions: [
  fragmentDefinitionLevels,
]);

extension ClientExtension$Fragment$Levels on graphql.GraphQLClient {
  void writeFragment$Levels({
    required Fragment$Levels data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'Levels',
            document: documentNodeFragmentLevels,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$Levels? readFragment$Levels({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'Levels',
          document: documentNodeFragmentLevels,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$Levels.fromJson(result);
  }
}

class Fragment$Stage {
  Fragment$Stage({
    required this.id,
    this.name,
    this.description,
    this.imageId,
    required this.status,
    this.levelsOnStart,
    this.levelsOnFinish,
    this.notes,
    this.$__typename = 'Stage',
  });

  factory Fragment$Stage.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$imageId = json['imageId'];
    final l$status = json['status'];
    final l$levelsOnStart = json['levelsOnStart'];
    final l$levelsOnFinish = json['levelsOnFinish'];
    final l$notes = json['notes'];
    final l$$__typename = json['__typename'];
    return Fragment$Stage(
      id: (l$id as String),
      name: (l$name as String?),
      description: (l$description as String?),
      imageId: (l$imageId as String?),
      status: fromJson$Enum$StageStatus((l$status as String)),
      levelsOnStart: l$levelsOnStart == null
          ? null
          : Fragment$Levels.fromJson((l$levelsOnStart as Map<String, dynamic>)),
      levelsOnFinish: l$levelsOnFinish == null
          ? null
          : Fragment$Levels.fromJson(
              (l$levelsOnFinish as Map<String, dynamic>)),
      notes: (l$notes as List<dynamic>?)?.map((e) => (e as String)).toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? name;

  final String? description;

  final String? imageId;

  final Enum$StageStatus status;

  final Fragment$Levels? levelsOnStart;

  final Fragment$Levels? levelsOnFinish;

  final List<String>? notes;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$imageId = imageId;
    _resultData['imageId'] = l$imageId;
    final l$status = status;
    _resultData['status'] = toJson$Enum$StageStatus(l$status);
    final l$levelsOnStart = levelsOnStart;
    _resultData['levelsOnStart'] = l$levelsOnStart?.toJson();
    final l$levelsOnFinish = levelsOnFinish;
    _resultData['levelsOnFinish'] = l$levelsOnFinish?.toJson();
    final l$notes = notes;
    _resultData['notes'] = l$notes?.map((e) => e).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$description = description;
    final l$imageId = imageId;
    final l$status = status;
    final l$levelsOnStart = levelsOnStart;
    final l$levelsOnFinish = levelsOnFinish;
    final l$notes = notes;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$description,
      l$imageId,
      l$status,
      l$levelsOnStart,
      l$levelsOnFinish,
      l$notes == null ? null : Object.hashAll(l$notes.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$Stage || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$imageId = imageId;
    final lOther$imageId = other.imageId;
    if (l$imageId != lOther$imageId) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$levelsOnStart = levelsOnStart;
    final lOther$levelsOnStart = other.levelsOnStart;
    if (l$levelsOnStart != lOther$levelsOnStart) {
      return false;
    }
    final l$levelsOnFinish = levelsOnFinish;
    final lOther$levelsOnFinish = other.levelsOnFinish;
    if (l$levelsOnFinish != lOther$levelsOnFinish) {
      return false;
    }
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (l$notes != null && lOther$notes != null) {
      if (l$notes.length != lOther$notes.length) {
        return false;
      }
      for (int i = 0; i < l$notes.length; i++) {
        final l$notes$entry = l$notes[i];
        final lOther$notes$entry = lOther$notes[i];
        if (l$notes$entry != lOther$notes$entry) {
          return false;
        }
      }
    } else if (l$notes != lOther$notes) {
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

extension UtilityExtension$Fragment$Stage on Fragment$Stage {
  CopyWith$Fragment$Stage<Fragment$Stage> get copyWith =>
      CopyWith$Fragment$Stage(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$Stage<TRes> {
  factory CopyWith$Fragment$Stage(
    Fragment$Stage instance,
    TRes Function(Fragment$Stage) then,
  ) = _CopyWithImpl$Fragment$Stage;

  factory CopyWith$Fragment$Stage.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Stage;

  TRes call({
    String? id,
    String? name,
    String? description,
    String? imageId,
    Enum$StageStatus? status,
    Fragment$Levels? levelsOnStart,
    Fragment$Levels? levelsOnFinish,
    List<String>? notes,
    String? $__typename,
  });
  CopyWith$Fragment$Levels<TRes> get levelsOnStart;
  CopyWith$Fragment$Levels<TRes> get levelsOnFinish;
}

class _CopyWithImpl$Fragment$Stage<TRes>
    implements CopyWith$Fragment$Stage<TRes> {
  _CopyWithImpl$Fragment$Stage(
    this._instance,
    this._then,
  );

  final Fragment$Stage _instance;

  final TRes Function(Fragment$Stage) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? imageId = _undefined,
    Object? status = _undefined,
    Object? levelsOnStart = _undefined,
    Object? levelsOnFinish = _undefined,
    Object? notes = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Stage(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined ? _instance.name : (name as String?),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        imageId:
            imageId == _undefined ? _instance.imageId : (imageId as String?),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as Enum$StageStatus),
        levelsOnStart: levelsOnStart == _undefined
            ? _instance.levelsOnStart
            : (levelsOnStart as Fragment$Levels?),
        levelsOnFinish: levelsOnFinish == _undefined
            ? _instance.levelsOnFinish
            : (levelsOnFinish as Fragment$Levels?),
        notes: notes == _undefined ? _instance.notes : (notes as List<String>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$Levels<TRes> get levelsOnStart {
    final local$levelsOnStart = _instance.levelsOnStart;
    return local$levelsOnStart == null
        ? CopyWith$Fragment$Levels.stub(_then(_instance))
        : CopyWith$Fragment$Levels(
            local$levelsOnStart, (e) => call(levelsOnStart: e));
  }

  CopyWith$Fragment$Levels<TRes> get levelsOnFinish {
    final local$levelsOnFinish = _instance.levelsOnFinish;
    return local$levelsOnFinish == null
        ? CopyWith$Fragment$Levels.stub(_then(_instance))
        : CopyWith$Fragment$Levels(
            local$levelsOnFinish, (e) => call(levelsOnFinish: e));
  }
}

class _CopyWithStubImpl$Fragment$Stage<TRes>
    implements CopyWith$Fragment$Stage<TRes> {
  _CopyWithStubImpl$Fragment$Stage(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? description,
    String? imageId,
    Enum$StageStatus? status,
    Fragment$Levels? levelsOnStart,
    Fragment$Levels? levelsOnFinish,
    List<String>? notes,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$Levels<TRes> get levelsOnStart =>
      CopyWith$Fragment$Levels.stub(_res);

  CopyWith$Fragment$Levels<TRes> get levelsOnFinish =>
      CopyWith$Fragment$Levels.stub(_res);
}

const fragmentDefinitionStage = FragmentDefinitionNode(
  name: NameNode(value: 'Stage'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'Stage'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'id'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'name'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'description'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'imageId'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'status'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'levelsOnStart'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FragmentSpreadNode(
          name: NameNode(value: 'Levels'),
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
      name: NameNode(value: 'levelsOnFinish'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FragmentSpreadNode(
          name: NameNode(value: 'Levels'),
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
      name: NameNode(value: 'notes'),
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
);
const documentNodeFragmentStage = DocumentNode(definitions: [
  fragmentDefinitionStage,
  fragmentDefinitionLevels,
]);

extension ClientExtension$Fragment$Stage on graphql.GraphQLClient {
  void writeFragment$Stage({
    required Fragment$Stage data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'Stage',
            document: documentNodeFragmentStage,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$Stage? readFragment$Stage({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'Stage',
          document: documentNodeFragmentStage,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$Stage.fromJson(result);
  }
}

class Fragment$StagePartMaterial {
  Fragment$StagePartMaterial({
    required this.type,
    required this.material_ID,
    this.$__typename = 'StageMaterialPart',
  });

  factory Fragment$StagePartMaterial.fromJson(Map<String, dynamic> json) {
    final l$type = json['type'];
    final l$material_ID = json['material_ID'];
    final l$$__typename = json['__typename'];
    return Fragment$StagePartMaterial(
      type: fromJson$Enum$MaterialType((l$type as String)),
      material_ID: (l$material_ID as String),
      $__typename: (l$$__typename as String),
    );
  }

  final Enum$MaterialType type;

  final String material_ID;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$type = type;
    _resultData['type'] = toJson$Enum$MaterialType(l$type);
    final l$material_ID = material_ID;
    _resultData['material_ID'] = l$material_ID;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$type = type;
    final l$material_ID = material_ID;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$type,
      l$material_ID,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$StagePartMaterial ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$material_ID = material_ID;
    final lOther$material_ID = other.material_ID;
    if (l$material_ID != lOther$material_ID) {
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

extension UtilityExtension$Fragment$StagePartMaterial
    on Fragment$StagePartMaterial {
  CopyWith$Fragment$StagePartMaterial<Fragment$StagePartMaterial>
      get copyWith => CopyWith$Fragment$StagePartMaterial(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$StagePartMaterial<TRes> {
  factory CopyWith$Fragment$StagePartMaterial(
    Fragment$StagePartMaterial instance,
    TRes Function(Fragment$StagePartMaterial) then,
  ) = _CopyWithImpl$Fragment$StagePartMaterial;

  factory CopyWith$Fragment$StagePartMaterial.stub(TRes res) =
      _CopyWithStubImpl$Fragment$StagePartMaterial;

  TRes call({
    Enum$MaterialType? type,
    String? material_ID,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$StagePartMaterial<TRes>
    implements CopyWith$Fragment$StagePartMaterial<TRes> {
  _CopyWithImpl$Fragment$StagePartMaterial(
    this._instance,
    this._then,
  );

  final Fragment$StagePartMaterial _instance;

  final TRes Function(Fragment$StagePartMaterial) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? type = _undefined,
    Object? material_ID = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$StagePartMaterial(
        type: type == _undefined || type == null
            ? _instance.type
            : (type as Enum$MaterialType),
        material_ID: material_ID == _undefined || material_ID == null
            ? _instance.material_ID
            : (material_ID as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$StagePartMaterial<TRes>
    implements CopyWith$Fragment$StagePartMaterial<TRes> {
  _CopyWithStubImpl$Fragment$StagePartMaterial(this._res);

  TRes _res;

  call({
    Enum$MaterialType? type,
    String? material_ID,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionStagePartMaterial = FragmentDefinitionNode(
  name: NameNode(value: 'StagePartMaterial'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'StageMaterialPart'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'type'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'material_ID'),
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
);
const documentNodeFragmentStagePartMaterial = DocumentNode(definitions: [
  fragmentDefinitionStagePartMaterial,
]);

extension ClientExtension$Fragment$StagePartMaterial on graphql.GraphQLClient {
  void writeFragment$StagePartMaterial({
    required Fragment$StagePartMaterial data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'StagePartMaterial',
            document: documentNodeFragmentStagePartMaterial,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$StagePartMaterial? readFragment$StagePartMaterial({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'StagePartMaterial',
          document: documentNodeFragmentStagePartMaterial,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$StagePartMaterial.fromJson(result);
  }
}

class Fragment$StagePartDocumentation {
  Fragment$StagePartDocumentation({
    required this.title,
    required this.ref_ID,
    this.$__typename = 'StageDocumentationPart',
  });

  factory Fragment$StagePartDocumentation.fromJson(Map<String, dynamic> json) {
    final l$title = json['title'];
    final l$ref_ID = json['ref_ID'];
    final l$$__typename = json['__typename'];
    return Fragment$StagePartDocumentation(
      title: (l$title as String),
      ref_ID: (l$ref_ID as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String title;

  final String ref_ID;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$title = title;
    _resultData['title'] = l$title;
    final l$ref_ID = ref_ID;
    _resultData['ref_ID'] = l$ref_ID;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$ref_ID = ref_ID;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$title,
      l$ref_ID,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$StagePartDocumentation ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$ref_ID = ref_ID;
    final lOther$ref_ID = other.ref_ID;
    if (l$ref_ID != lOther$ref_ID) {
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

extension UtilityExtension$Fragment$StagePartDocumentation
    on Fragment$StagePartDocumentation {
  CopyWith$Fragment$StagePartDocumentation<Fragment$StagePartDocumentation>
      get copyWith => CopyWith$Fragment$StagePartDocumentation(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$StagePartDocumentation<TRes> {
  factory CopyWith$Fragment$StagePartDocumentation(
    Fragment$StagePartDocumentation instance,
    TRes Function(Fragment$StagePartDocumentation) then,
  ) = _CopyWithImpl$Fragment$StagePartDocumentation;

  factory CopyWith$Fragment$StagePartDocumentation.stub(TRes res) =
      _CopyWithStubImpl$Fragment$StagePartDocumentation;

  TRes call({
    String? title,
    String? ref_ID,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$StagePartDocumentation<TRes>
    implements CopyWith$Fragment$StagePartDocumentation<TRes> {
  _CopyWithImpl$Fragment$StagePartDocumentation(
    this._instance,
    this._then,
  );

  final Fragment$StagePartDocumentation _instance;

  final TRes Function(Fragment$StagePartDocumentation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? title = _undefined,
    Object? ref_ID = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$StagePartDocumentation(
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        ref_ID: ref_ID == _undefined || ref_ID == null
            ? _instance.ref_ID
            : (ref_ID as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$StagePartDocumentation<TRes>
    implements CopyWith$Fragment$StagePartDocumentation<TRes> {
  _CopyWithStubImpl$Fragment$StagePartDocumentation(this._res);

  TRes _res;

  call({
    String? title,
    String? ref_ID,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionStagePartDocumentation = FragmentDefinitionNode(
  name: NameNode(value: 'StagePartDocumentation'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'StageDocumentationPart'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'title'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'ref_ID'),
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
);
const documentNodeFragmentStagePartDocumentation = DocumentNode(definitions: [
  fragmentDefinitionStagePartDocumentation,
]);

extension ClientExtension$Fragment$StagePartDocumentation
    on graphql.GraphQLClient {
  void writeFragment$StagePartDocumentation({
    required Fragment$StagePartDocumentation data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'StagePartDocumentation',
            document: documentNodeFragmentStagePartDocumentation,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$StagePartDocumentation? readFragment$StagePartDocumentation({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'StagePartDocumentation',
          document: documentNodeFragmentStagePartDocumentation,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Fragment$StagePartDocumentation.fromJson(result);
  }
}

class Fragment$StageSentence {
  Fragment$StageSentence({
    required this.sentence,
    this.ref_ID,
    this.practices,
    this.use_cases,
    this.$__typename = 'StageSentence',
  });

  factory Fragment$StageSentence.fromJson(Map<String, dynamic> json) {
    final l$sentence = json['sentence'];
    final l$ref_ID = json['ref_ID'];
    final l$practices = json['practices'];
    final l$use_cases = json['use_cases'];
    final l$$__typename = json['__typename'];
    return Fragment$StageSentence(
      sentence: (l$sentence as String),
      ref_ID: (l$ref_ID as String?),
      practices:
          (l$practices as List<dynamic>?)?.map((e) => (e as String)).toList(),
      use_cases:
          (l$use_cases as List<dynamic>?)?.map((e) => (e as String)).toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String sentence;

  final String? ref_ID;

  final List<String>? practices;

  final List<String>? use_cases;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$sentence = sentence;
    _resultData['sentence'] = l$sentence;
    final l$ref_ID = ref_ID;
    _resultData['ref_ID'] = l$ref_ID;
    final l$practices = practices;
    _resultData['practices'] = l$practices?.map((e) => e).toList();
    final l$use_cases = use_cases;
    _resultData['use_cases'] = l$use_cases?.map((e) => e).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$sentence = sentence;
    final l$ref_ID = ref_ID;
    final l$practices = practices;
    final l$use_cases = use_cases;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$sentence,
      l$ref_ID,
      l$practices == null ? null : Object.hashAll(l$practices.map((v) => v)),
      l$use_cases == null ? null : Object.hashAll(l$use_cases.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$StageSentence || runtimeType != other.runtimeType) {
      return false;
    }
    final l$sentence = sentence;
    final lOther$sentence = other.sentence;
    if (l$sentence != lOther$sentence) {
      return false;
    }
    final l$ref_ID = ref_ID;
    final lOther$ref_ID = other.ref_ID;
    if (l$ref_ID != lOther$ref_ID) {
      return false;
    }
    final l$practices = practices;
    final lOther$practices = other.practices;
    if (l$practices != null && lOther$practices != null) {
      if (l$practices.length != lOther$practices.length) {
        return false;
      }
      for (int i = 0; i < l$practices.length; i++) {
        final l$practices$entry = l$practices[i];
        final lOther$practices$entry = lOther$practices[i];
        if (l$practices$entry != lOther$practices$entry) {
          return false;
        }
      }
    } else if (l$practices != lOther$practices) {
      return false;
    }
    final l$use_cases = use_cases;
    final lOther$use_cases = other.use_cases;
    if (l$use_cases != null && lOther$use_cases != null) {
      if (l$use_cases.length != lOther$use_cases.length) {
        return false;
      }
      for (int i = 0; i < l$use_cases.length; i++) {
        final l$use_cases$entry = l$use_cases[i];
        final lOther$use_cases$entry = lOther$use_cases[i];
        if (l$use_cases$entry != lOther$use_cases$entry) {
          return false;
        }
      }
    } else if (l$use_cases != lOther$use_cases) {
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

extension UtilityExtension$Fragment$StageSentence on Fragment$StageSentence {
  CopyWith$Fragment$StageSentence<Fragment$StageSentence> get copyWith =>
      CopyWith$Fragment$StageSentence(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$StageSentence<TRes> {
  factory CopyWith$Fragment$StageSentence(
    Fragment$StageSentence instance,
    TRes Function(Fragment$StageSentence) then,
  ) = _CopyWithImpl$Fragment$StageSentence;

  factory CopyWith$Fragment$StageSentence.stub(TRes res) =
      _CopyWithStubImpl$Fragment$StageSentence;

  TRes call({
    String? sentence,
    String? ref_ID,
    List<String>? practices,
    List<String>? use_cases,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$StageSentence<TRes>
    implements CopyWith$Fragment$StageSentence<TRes> {
  _CopyWithImpl$Fragment$StageSentence(
    this._instance,
    this._then,
  );

  final Fragment$StageSentence _instance;

  final TRes Function(Fragment$StageSentence) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? sentence = _undefined,
    Object? ref_ID = _undefined,
    Object? practices = _undefined,
    Object? use_cases = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$StageSentence(
        sentence: sentence == _undefined || sentence == null
            ? _instance.sentence
            : (sentence as String),
        ref_ID: ref_ID == _undefined ? _instance.ref_ID : (ref_ID as String?),
        practices: practices == _undefined
            ? _instance.practices
            : (practices as List<String>?),
        use_cases: use_cases == _undefined
            ? _instance.use_cases
            : (use_cases as List<String>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$StageSentence<TRes>
    implements CopyWith$Fragment$StageSentence<TRes> {
  _CopyWithStubImpl$Fragment$StageSentence(this._res);

  TRes _res;

  call({
    String? sentence,
    String? ref_ID,
    List<String>? practices,
    List<String>? use_cases,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionStageSentence = FragmentDefinitionNode(
  name: NameNode(value: 'StageSentence'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'StageSentence'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'sentence'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'ref_ID'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'practices'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'use_cases'),
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
);
const documentNodeFragmentStageSentence = DocumentNode(definitions: [
  fragmentDefinitionStageSentence,
]);

extension ClientExtension$Fragment$StageSentence on graphql.GraphQLClient {
  void writeFragment$StageSentence({
    required Fragment$StageSentence data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'StageSentence',
            document: documentNodeFragmentStageSentence,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$StageSentence? readFragment$StageSentence({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'StageSentence',
          document: documentNodeFragmentStageSentence,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$StageSentence.fromJson(result);
  }
}

class Fragment$StageWord {
  Fragment$StageWord({
    required this.word,
    this.ref_ID,
    this.category,
    this.practices,
    this.use_cases,
    this.$__typename = 'StageWord',
  });

  factory Fragment$StageWord.fromJson(Map<String, dynamic> json) {
    final l$word = json['word'];
    final l$ref_ID = json['ref_ID'];
    final l$category = json['category'];
    final l$practices = json['practices'];
    final l$use_cases = json['use_cases'];
    final l$$__typename = json['__typename'];
    return Fragment$StageWord(
      word: (l$word as String),
      ref_ID: (l$ref_ID as String?),
      category: (l$category as String?),
      practices:
          (l$practices as List<dynamic>?)?.map((e) => (e as String)).toList(),
      use_cases:
          (l$use_cases as List<dynamic>?)?.map((e) => (e as String)).toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String word;

  final String? ref_ID;

  final String? category;

  final List<String>? practices;

  final List<String>? use_cases;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$word = word;
    _resultData['word'] = l$word;
    final l$ref_ID = ref_ID;
    _resultData['ref_ID'] = l$ref_ID;
    final l$category = category;
    _resultData['category'] = l$category;
    final l$practices = practices;
    _resultData['practices'] = l$practices?.map((e) => e).toList();
    final l$use_cases = use_cases;
    _resultData['use_cases'] = l$use_cases?.map((e) => e).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$word = word;
    final l$ref_ID = ref_ID;
    final l$category = category;
    final l$practices = practices;
    final l$use_cases = use_cases;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$word,
      l$ref_ID,
      l$category,
      l$practices == null ? null : Object.hashAll(l$practices.map((v) => v)),
      l$use_cases == null ? null : Object.hashAll(l$use_cases.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$StageWord || runtimeType != other.runtimeType) {
      return false;
    }
    final l$word = word;
    final lOther$word = other.word;
    if (l$word != lOther$word) {
      return false;
    }
    final l$ref_ID = ref_ID;
    final lOther$ref_ID = other.ref_ID;
    if (l$ref_ID != lOther$ref_ID) {
      return false;
    }
    final l$category = category;
    final lOther$category = other.category;
    if (l$category != lOther$category) {
      return false;
    }
    final l$practices = practices;
    final lOther$practices = other.practices;
    if (l$practices != null && lOther$practices != null) {
      if (l$practices.length != lOther$practices.length) {
        return false;
      }
      for (int i = 0; i < l$practices.length; i++) {
        final l$practices$entry = l$practices[i];
        final lOther$practices$entry = lOther$practices[i];
        if (l$practices$entry != lOther$practices$entry) {
          return false;
        }
      }
    } else if (l$practices != lOther$practices) {
      return false;
    }
    final l$use_cases = use_cases;
    final lOther$use_cases = other.use_cases;
    if (l$use_cases != null && lOther$use_cases != null) {
      if (l$use_cases.length != lOther$use_cases.length) {
        return false;
      }
      for (int i = 0; i < l$use_cases.length; i++) {
        final l$use_cases$entry = l$use_cases[i];
        final lOther$use_cases$entry = lOther$use_cases[i];
        if (l$use_cases$entry != lOther$use_cases$entry) {
          return false;
        }
      }
    } else if (l$use_cases != lOther$use_cases) {
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

extension UtilityExtension$Fragment$StageWord on Fragment$StageWord {
  CopyWith$Fragment$StageWord<Fragment$StageWord> get copyWith =>
      CopyWith$Fragment$StageWord(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$StageWord<TRes> {
  factory CopyWith$Fragment$StageWord(
    Fragment$StageWord instance,
    TRes Function(Fragment$StageWord) then,
  ) = _CopyWithImpl$Fragment$StageWord;

  factory CopyWith$Fragment$StageWord.stub(TRes res) =
      _CopyWithStubImpl$Fragment$StageWord;

  TRes call({
    String? word,
    String? ref_ID,
    String? category,
    List<String>? practices,
    List<String>? use_cases,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$StageWord<TRes>
    implements CopyWith$Fragment$StageWord<TRes> {
  _CopyWithImpl$Fragment$StageWord(
    this._instance,
    this._then,
  );

  final Fragment$StageWord _instance;

  final TRes Function(Fragment$StageWord) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? word = _undefined,
    Object? ref_ID = _undefined,
    Object? category = _undefined,
    Object? practices = _undefined,
    Object? use_cases = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$StageWord(
        word: word == _undefined || word == null
            ? _instance.word
            : (word as String),
        ref_ID: ref_ID == _undefined ? _instance.ref_ID : (ref_ID as String?),
        category:
            category == _undefined ? _instance.category : (category as String?),
        practices: practices == _undefined
            ? _instance.practices
            : (practices as List<String>?),
        use_cases: use_cases == _undefined
            ? _instance.use_cases
            : (use_cases as List<String>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$StageWord<TRes>
    implements CopyWith$Fragment$StageWord<TRes> {
  _CopyWithStubImpl$Fragment$StageWord(this._res);

  TRes _res;

  call({
    String? word,
    String? ref_ID,
    String? category,
    List<String>? practices,
    List<String>? use_cases,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionStageWord = FragmentDefinitionNode(
  name: NameNode(value: 'StageWord'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'StageWord'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'word'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'ref_ID'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'category'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'practices'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'use_cases'),
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
);
const documentNodeFragmentStageWord = DocumentNode(definitions: [
  fragmentDefinitionStageWord,
]);

extension ClientExtension$Fragment$StageWord on graphql.GraphQLClient {
  void writeFragment$StageWord({
    required Fragment$StageWord data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'StageWord',
            document: documentNodeFragmentStageWord,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$StageWord? readFragment$StageWord({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'StageWord',
          document: documentNodeFragmentStageWord,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$StageWord.fromJson(result);
  }
}

class Fragment$StagePart {
  Fragment$StagePart({
    required this.id,
    required this.type,
    required this.explanation,
    this.material,
    this.documentation,
    this.sentences,
    this.words,
    this.$__typename = 'StagePart',
  });

  factory Fragment$StagePart.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$type = json['type'];
    final l$explanation = json['explanation'];
    final l$material = json['material'];
    final l$documentation = json['documentation'];
    final l$sentences = json['sentences'];
    final l$words = json['words'];
    final l$$__typename = json['__typename'];
    return Fragment$StagePart(
      id: (l$id as String),
      type: fromJson$Enum$StagePartType((l$type as String)),
      explanation: (l$explanation as String),
      material: l$material == null
          ? null
          : Fragment$StagePartMaterial.fromJson(
              (l$material as Map<String, dynamic>)),
      documentation: l$documentation == null
          ? null
          : Fragment$StagePartDocumentation.fromJson(
              (l$documentation as Map<String, dynamic>)),
      sentences: (l$sentences as List<dynamic>?)
          ?.map((e) =>
              Fragment$StageSentence.fromJson((e as Map<String, dynamic>)))
          .toList(),
      words: (l$words as List<dynamic>?)
          ?.map((e) => Fragment$StageWord.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$StagePartType type;

  final String explanation;

  final Fragment$StagePartMaterial? material;

  final Fragment$StagePartDocumentation? documentation;

  final List<Fragment$StageSentence>? sentences;

  final List<Fragment$StageWord>? words;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$type = type;
    _resultData['type'] = toJson$Enum$StagePartType(l$type);
    final l$explanation = explanation;
    _resultData['explanation'] = l$explanation;
    final l$material = material;
    _resultData['material'] = l$material?.toJson();
    final l$documentation = documentation;
    _resultData['documentation'] = l$documentation?.toJson();
    final l$sentences = sentences;
    _resultData['sentences'] = l$sentences?.map((e) => e.toJson()).toList();
    final l$words = words;
    _resultData['words'] = l$words?.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$type = type;
    final l$explanation = explanation;
    final l$material = material;
    final l$documentation = documentation;
    final l$sentences = sentences;
    final l$words = words;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$type,
      l$explanation,
      l$material,
      l$documentation,
      l$sentences == null ? null : Object.hashAll(l$sentences.map((v) => v)),
      l$words == null ? null : Object.hashAll(l$words.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$StagePart || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$explanation = explanation;
    final lOther$explanation = other.explanation;
    if (l$explanation != lOther$explanation) {
      return false;
    }
    final l$material = material;
    final lOther$material = other.material;
    if (l$material != lOther$material) {
      return false;
    }
    final l$documentation = documentation;
    final lOther$documentation = other.documentation;
    if (l$documentation != lOther$documentation) {
      return false;
    }
    final l$sentences = sentences;
    final lOther$sentences = other.sentences;
    if (l$sentences != null && lOther$sentences != null) {
      if (l$sentences.length != lOther$sentences.length) {
        return false;
      }
      for (int i = 0; i < l$sentences.length; i++) {
        final l$sentences$entry = l$sentences[i];
        final lOther$sentences$entry = lOther$sentences[i];
        if (l$sentences$entry != lOther$sentences$entry) {
          return false;
        }
      }
    } else if (l$sentences != lOther$sentences) {
      return false;
    }
    final l$words = words;
    final lOther$words = other.words;
    if (l$words != null && lOther$words != null) {
      if (l$words.length != lOther$words.length) {
        return false;
      }
      for (int i = 0; i < l$words.length; i++) {
        final l$words$entry = l$words[i];
        final lOther$words$entry = lOther$words[i];
        if (l$words$entry != lOther$words$entry) {
          return false;
        }
      }
    } else if (l$words != lOther$words) {
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

extension UtilityExtension$Fragment$StagePart on Fragment$StagePart {
  CopyWith$Fragment$StagePart<Fragment$StagePart> get copyWith =>
      CopyWith$Fragment$StagePart(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$StagePart<TRes> {
  factory CopyWith$Fragment$StagePart(
    Fragment$StagePart instance,
    TRes Function(Fragment$StagePart) then,
  ) = _CopyWithImpl$Fragment$StagePart;

  factory CopyWith$Fragment$StagePart.stub(TRes res) =
      _CopyWithStubImpl$Fragment$StagePart;

  TRes call({
    String? id,
    Enum$StagePartType? type,
    String? explanation,
    Fragment$StagePartMaterial? material,
    Fragment$StagePartDocumentation? documentation,
    List<Fragment$StageSentence>? sentences,
    List<Fragment$StageWord>? words,
    String? $__typename,
  });
  CopyWith$Fragment$StagePartMaterial<TRes> get material;
  CopyWith$Fragment$StagePartDocumentation<TRes> get documentation;
  TRes sentences(
      Iterable<Fragment$StageSentence>? Function(
              Iterable<
                  CopyWith$Fragment$StageSentence<Fragment$StageSentence>>?)
          _fn);
  TRes words(
      Iterable<Fragment$StageWord>? Function(
              Iterable<CopyWith$Fragment$StageWord<Fragment$StageWord>>?)
          _fn);
}

class _CopyWithImpl$Fragment$StagePart<TRes>
    implements CopyWith$Fragment$StagePart<TRes> {
  _CopyWithImpl$Fragment$StagePart(
    this._instance,
    this._then,
  );

  final Fragment$StagePart _instance;

  final TRes Function(Fragment$StagePart) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? type = _undefined,
    Object? explanation = _undefined,
    Object? material = _undefined,
    Object? documentation = _undefined,
    Object? sentences = _undefined,
    Object? words = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$StagePart(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        type: type == _undefined || type == null
            ? _instance.type
            : (type as Enum$StagePartType),
        explanation: explanation == _undefined || explanation == null
            ? _instance.explanation
            : (explanation as String),
        material: material == _undefined
            ? _instance.material
            : (material as Fragment$StagePartMaterial?),
        documentation: documentation == _undefined
            ? _instance.documentation
            : (documentation as Fragment$StagePartDocumentation?),
        sentences: sentences == _undefined
            ? _instance.sentences
            : (sentences as List<Fragment$StageSentence>?),
        words: words == _undefined
            ? _instance.words
            : (words as List<Fragment$StageWord>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$StagePartMaterial<TRes> get material {
    final local$material = _instance.material;
    return local$material == null
        ? CopyWith$Fragment$StagePartMaterial.stub(_then(_instance))
        : CopyWith$Fragment$StagePartMaterial(
            local$material, (e) => call(material: e));
  }

  CopyWith$Fragment$StagePartDocumentation<TRes> get documentation {
    final local$documentation = _instance.documentation;
    return local$documentation == null
        ? CopyWith$Fragment$StagePartDocumentation.stub(_then(_instance))
        : CopyWith$Fragment$StagePartDocumentation(
            local$documentation, (e) => call(documentation: e));
  }

  TRes sentences(
          Iterable<Fragment$StageSentence>? Function(
                  Iterable<
                      CopyWith$Fragment$StageSentence<Fragment$StageSentence>>?)
              _fn) =>
      call(
          sentences: _fn(
              _instance.sentences?.map((e) => CopyWith$Fragment$StageSentence(
                    e,
                    (i) => i,
                  )))?.toList());

  TRes words(
          Iterable<Fragment$StageWord>? Function(
                  Iterable<CopyWith$Fragment$StageWord<Fragment$StageWord>>?)
              _fn) =>
      call(
          words: _fn(_instance.words?.map((e) => CopyWith$Fragment$StageWord(
                e,
                (i) => i,
              )))?.toList());
}

class _CopyWithStubImpl$Fragment$StagePart<TRes>
    implements CopyWith$Fragment$StagePart<TRes> {
  _CopyWithStubImpl$Fragment$StagePart(this._res);

  TRes _res;

  call({
    String? id,
    Enum$StagePartType? type,
    String? explanation,
    Fragment$StagePartMaterial? material,
    Fragment$StagePartDocumentation? documentation,
    List<Fragment$StageSentence>? sentences,
    List<Fragment$StageWord>? words,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$StagePartMaterial<TRes> get material =>
      CopyWith$Fragment$StagePartMaterial.stub(_res);

  CopyWith$Fragment$StagePartDocumentation<TRes> get documentation =>
      CopyWith$Fragment$StagePartDocumentation.stub(_res);

  sentences(_fn) => _res;

  words(_fn) => _res;
}

const fragmentDefinitionStagePart = FragmentDefinitionNode(
  name: NameNode(value: 'StagePart'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'StagePart'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'id'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'type'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'explanation'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'material'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FragmentSpreadNode(
          name: NameNode(value: 'StagePartMaterial'),
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
      name: NameNode(value: 'documentation'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FragmentSpreadNode(
          name: NameNode(value: 'StagePartDocumentation'),
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
      name: NameNode(value: 'sentences'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FragmentSpreadNode(
          name: NameNode(value: 'StageSentence'),
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
      name: NameNode(value: 'words'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FragmentSpreadNode(
          name: NameNode(value: 'StageWord'),
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
);
const documentNodeFragmentStagePart = DocumentNode(definitions: [
  fragmentDefinitionStagePart,
  fragmentDefinitionStagePartMaterial,
  fragmentDefinitionStagePartDocumentation,
  fragmentDefinitionStageSentence,
  fragmentDefinitionStageWord,
]);

extension ClientExtension$Fragment$StagePart on graphql.GraphQLClient {
  void writeFragment$StagePart({
    required Fragment$StagePart data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'StagePart',
            document: documentNodeFragmentStagePart,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$StagePart? readFragment$StagePart({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'StagePart',
          document: documentNodeFragmentStagePart,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$StagePart.fromJson(result);
  }
}

class Fragment$DetailedStage implements Fragment$Stage {
  Fragment$DetailedStage({
    required this.id,
    this.name,
    this.description,
    this.imageId,
    required this.status,
    this.levelsOnStart,
    this.levelsOnFinish,
    this.notes,
    this.$__typename = 'Stage',
    required this.stagePart,
  });

  factory Fragment$DetailedStage.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$imageId = json['imageId'];
    final l$status = json['status'];
    final l$levelsOnStart = json['levelsOnStart'];
    final l$levelsOnFinish = json['levelsOnFinish'];
    final l$notes = json['notes'];
    final l$$__typename = json['__typename'];
    final l$stagePart = json['stagePart'];
    return Fragment$DetailedStage(
      id: (l$id as String),
      name: (l$name as String?),
      description: (l$description as String?),
      imageId: (l$imageId as String?),
      status: fromJson$Enum$StageStatus((l$status as String)),
      levelsOnStart: l$levelsOnStart == null
          ? null
          : Fragment$Levels.fromJson((l$levelsOnStart as Map<String, dynamic>)),
      levelsOnFinish: l$levelsOnFinish == null
          ? null
          : Fragment$Levels.fromJson(
              (l$levelsOnFinish as Map<String, dynamic>)),
      notes: (l$notes as List<dynamic>?)?.map((e) => (e as String)).toList(),
      $__typename: (l$$__typename as String),
      stagePart: Fragment$DetailedStage$stagePart.fromJson(
          (l$stagePart as Map<String, dynamic>)),
    );
  }

  final String id;

  final String? name;

  final String? description;

  final String? imageId;

  final Enum$StageStatus status;

  final Fragment$Levels? levelsOnStart;

  final Fragment$Levels? levelsOnFinish;

  final List<String>? notes;

  final String $__typename;

  final Fragment$DetailedStage$stagePart stagePart;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$imageId = imageId;
    _resultData['imageId'] = l$imageId;
    final l$status = status;
    _resultData['status'] = toJson$Enum$StageStatus(l$status);
    final l$levelsOnStart = levelsOnStart;
    _resultData['levelsOnStart'] = l$levelsOnStart?.toJson();
    final l$levelsOnFinish = levelsOnFinish;
    _resultData['levelsOnFinish'] = l$levelsOnFinish?.toJson();
    final l$notes = notes;
    _resultData['notes'] = l$notes?.map((e) => e).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$stagePart = stagePart;
    _resultData['stagePart'] = l$stagePart.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$description = description;
    final l$imageId = imageId;
    final l$status = status;
    final l$levelsOnStart = levelsOnStart;
    final l$levelsOnFinish = levelsOnFinish;
    final l$notes = notes;
    final l$$__typename = $__typename;
    final l$stagePart = stagePart;
    return Object.hashAll([
      l$id,
      l$name,
      l$description,
      l$imageId,
      l$status,
      l$levelsOnStart,
      l$levelsOnFinish,
      l$notes == null ? null : Object.hashAll(l$notes.map((v) => v)),
      l$$__typename,
      l$stagePart,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$DetailedStage || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$imageId = imageId;
    final lOther$imageId = other.imageId;
    if (l$imageId != lOther$imageId) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$levelsOnStart = levelsOnStart;
    final lOther$levelsOnStart = other.levelsOnStart;
    if (l$levelsOnStart != lOther$levelsOnStart) {
      return false;
    }
    final l$levelsOnFinish = levelsOnFinish;
    final lOther$levelsOnFinish = other.levelsOnFinish;
    if (l$levelsOnFinish != lOther$levelsOnFinish) {
      return false;
    }
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (l$notes != null && lOther$notes != null) {
      if (l$notes.length != lOther$notes.length) {
        return false;
      }
      for (int i = 0; i < l$notes.length; i++) {
        final l$notes$entry = l$notes[i];
        final lOther$notes$entry = lOther$notes[i];
        if (l$notes$entry != lOther$notes$entry) {
          return false;
        }
      }
    } else if (l$notes != lOther$notes) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$stagePart = stagePart;
    final lOther$stagePart = other.stagePart;
    if (l$stagePart != lOther$stagePart) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$DetailedStage on Fragment$DetailedStage {
  CopyWith$Fragment$DetailedStage<Fragment$DetailedStage> get copyWith =>
      CopyWith$Fragment$DetailedStage(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$DetailedStage<TRes> {
  factory CopyWith$Fragment$DetailedStage(
    Fragment$DetailedStage instance,
    TRes Function(Fragment$DetailedStage) then,
  ) = _CopyWithImpl$Fragment$DetailedStage;

  factory CopyWith$Fragment$DetailedStage.stub(TRes res) =
      _CopyWithStubImpl$Fragment$DetailedStage;

  TRes call({
    String? id,
    String? name,
    String? description,
    String? imageId,
    Enum$StageStatus? status,
    Fragment$Levels? levelsOnStart,
    Fragment$Levels? levelsOnFinish,
    List<String>? notes,
    String? $__typename,
    Fragment$DetailedStage$stagePart? stagePart,
  });
  CopyWith$Fragment$Levels<TRes> get levelsOnStart;
  CopyWith$Fragment$Levels<TRes> get levelsOnFinish;
  CopyWith$Fragment$DetailedStage$stagePart<TRes> get stagePart;
}

class _CopyWithImpl$Fragment$DetailedStage<TRes>
    implements CopyWith$Fragment$DetailedStage<TRes> {
  _CopyWithImpl$Fragment$DetailedStage(
    this._instance,
    this._then,
  );

  final Fragment$DetailedStage _instance;

  final TRes Function(Fragment$DetailedStage) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? imageId = _undefined,
    Object? status = _undefined,
    Object? levelsOnStart = _undefined,
    Object? levelsOnFinish = _undefined,
    Object? notes = _undefined,
    Object? $__typename = _undefined,
    Object? stagePart = _undefined,
  }) =>
      _then(Fragment$DetailedStage(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined ? _instance.name : (name as String?),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        imageId:
            imageId == _undefined ? _instance.imageId : (imageId as String?),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as Enum$StageStatus),
        levelsOnStart: levelsOnStart == _undefined
            ? _instance.levelsOnStart
            : (levelsOnStart as Fragment$Levels?),
        levelsOnFinish: levelsOnFinish == _undefined
            ? _instance.levelsOnFinish
            : (levelsOnFinish as Fragment$Levels?),
        notes: notes == _undefined ? _instance.notes : (notes as List<String>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        stagePart: stagePart == _undefined || stagePart == null
            ? _instance.stagePart
            : (stagePart as Fragment$DetailedStage$stagePart),
      ));

  CopyWith$Fragment$Levels<TRes> get levelsOnStart {
    final local$levelsOnStart = _instance.levelsOnStart;
    return local$levelsOnStart == null
        ? CopyWith$Fragment$Levels.stub(_then(_instance))
        : CopyWith$Fragment$Levels(
            local$levelsOnStart, (e) => call(levelsOnStart: e));
  }

  CopyWith$Fragment$Levels<TRes> get levelsOnFinish {
    final local$levelsOnFinish = _instance.levelsOnFinish;
    return local$levelsOnFinish == null
        ? CopyWith$Fragment$Levels.stub(_then(_instance))
        : CopyWith$Fragment$Levels(
            local$levelsOnFinish, (e) => call(levelsOnFinish: e));
  }

  CopyWith$Fragment$DetailedStage$stagePart<TRes> get stagePart {
    final local$stagePart = _instance.stagePart;
    return CopyWith$Fragment$DetailedStage$stagePart(
        local$stagePart, (e) => call(stagePart: e));
  }
}

class _CopyWithStubImpl$Fragment$DetailedStage<TRes>
    implements CopyWith$Fragment$DetailedStage<TRes> {
  _CopyWithStubImpl$Fragment$DetailedStage(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? description,
    String? imageId,
    Enum$StageStatus? status,
    Fragment$Levels? levelsOnStart,
    Fragment$Levels? levelsOnFinish,
    List<String>? notes,
    String? $__typename,
    Fragment$DetailedStage$stagePart? stagePart,
  }) =>
      _res;

  CopyWith$Fragment$Levels<TRes> get levelsOnStart =>
      CopyWith$Fragment$Levels.stub(_res);

  CopyWith$Fragment$Levels<TRes> get levelsOnFinish =>
      CopyWith$Fragment$Levels.stub(_res);

  CopyWith$Fragment$DetailedStage$stagePart<TRes> get stagePart =>
      CopyWith$Fragment$DetailedStage$stagePart.stub(_res);
}

const fragmentDefinitionDetailedStage = FragmentDefinitionNode(
  name: NameNode(value: 'DetailedStage'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'Stage'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FragmentSpreadNode(
      name: NameNode(value: 'Stage'),
      directives: [],
    ),
    FieldNode(
      name: NameNode(value: 'stagePart'),
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
              name: NameNode(value: 'StagePart'),
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
);
const documentNodeFragmentDetailedStage = DocumentNode(definitions: [
  fragmentDefinitionDetailedStage,
  fragmentDefinitionStage,
  fragmentDefinitionLevels,
  fragmentDefinitionStagePart,
  fragmentDefinitionStagePartMaterial,
  fragmentDefinitionStagePartDocumentation,
  fragmentDefinitionStageSentence,
  fragmentDefinitionStageWord,
]);

extension ClientExtension$Fragment$DetailedStage on graphql.GraphQLClient {
  void writeFragment$DetailedStage({
    required Fragment$DetailedStage data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'DetailedStage',
            document: documentNodeFragmentDetailedStage,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$DetailedStage? readFragment$DetailedStage({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'DetailedStage',
          document: documentNodeFragmentDetailedStage,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$DetailedStage.fromJson(result);
  }
}

class Fragment$DetailedStage$stagePart {
  Fragment$DetailedStage$stagePart({
    required this.items,
    this.$__typename = 'StagePartConnection',
  });

  factory Fragment$DetailedStage$stagePart.fromJson(Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Fragment$DetailedStage$stagePart(
      items: (l$items as List<dynamic>)
          .map((e) => Fragment$StagePart.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$StagePart> items;

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
    if (other is! Fragment$DetailedStage$stagePart ||
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

extension UtilityExtension$Fragment$DetailedStage$stagePart
    on Fragment$DetailedStage$stagePart {
  CopyWith$Fragment$DetailedStage$stagePart<Fragment$DetailedStage$stagePart>
      get copyWith => CopyWith$Fragment$DetailedStage$stagePart(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$DetailedStage$stagePart<TRes> {
  factory CopyWith$Fragment$DetailedStage$stagePart(
    Fragment$DetailedStage$stagePart instance,
    TRes Function(Fragment$DetailedStage$stagePart) then,
  ) = _CopyWithImpl$Fragment$DetailedStage$stagePart;

  factory CopyWith$Fragment$DetailedStage$stagePart.stub(TRes res) =
      _CopyWithStubImpl$Fragment$DetailedStage$stagePart;

  TRes call({
    List<Fragment$StagePart>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$StagePart> Function(
              Iterable<CopyWith$Fragment$StagePart<Fragment$StagePart>>)
          _fn);
}

class _CopyWithImpl$Fragment$DetailedStage$stagePart<TRes>
    implements CopyWith$Fragment$DetailedStage$stagePart<TRes> {
  _CopyWithImpl$Fragment$DetailedStage$stagePart(
    this._instance,
    this._then,
  );

  final Fragment$DetailedStage$stagePart _instance;

  final TRes Function(Fragment$DetailedStage$stagePart) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$DetailedStage$stagePart(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$StagePart>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes items(
          Iterable<Fragment$StagePart> Function(
                  Iterable<CopyWith$Fragment$StagePart<Fragment$StagePart>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) => CopyWith$Fragment$StagePart(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Fragment$DetailedStage$stagePart<TRes>
    implements CopyWith$Fragment$DetailedStage$stagePart<TRes> {
  _CopyWithStubImpl$Fragment$DetailedStage$stagePart(this._res);

  TRes _res;

  call({
    List<Fragment$StagePart>? items,
    String? $__typename,
  }) =>
      _res;

  items(_fn) => _res;
}

class Fragment$Material {
  Fragment$Material({
    required this.id,
    required this.stage_ID,
    required this.part_ID,
    this.type,
    required this.genStatus,
    required this.compStatus,
    required this.convStatus,
    required this.feedbackStatus,
    required this.createdAt,
    this.completedAt,
    required this.unseenAiFeedbacks,
    this.details,
    this.$__typename = 'Material',
  });

  factory Fragment$Material.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$stage_ID = json['stage_ID'];
    final l$part_ID = json['part_ID'];
    final l$type = json['type'];
    final l$genStatus = json['genStatus'];
    final l$compStatus = json['compStatus'];
    final l$convStatus = json['convStatus'];
    final l$feedbackStatus = json['feedbackStatus'];
    final l$createdAt = json['createdAt'];
    final l$completedAt = json['completedAt'];
    final l$unseenAiFeedbacks = json['unseenAiFeedbacks'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Fragment$Material(
      id: (l$id as String),
      stage_ID: (l$stage_ID as String),
      part_ID: (l$part_ID as String),
      type: l$type == null
          ? null
          : fromJson$Enum$MaterialType((l$type as String)),
      genStatus: fromJson$Enum$MaterialGenStatus((l$genStatus as String)),
      compStatus: fromJson$Enum$MaterialCompStatus((l$compStatus as String)),
      convStatus: fromJson$Enum$MaterialConvStatus((l$convStatus as String)),
      feedbackStatus:
          fromJson$Enum$MaterialFeedbackStatus((l$feedbackStatus as String)),
      createdAt: dateTimeFromJson(l$createdAt),
      completedAt:
          l$completedAt == null ? null : dateTimeFromJson(l$completedAt),
      unseenAiFeedbacks: (l$unseenAiFeedbacks as int),
      details: l$details == null
          ? null
          : Fragment$MiniDetails.fromJson((l$details as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String stage_ID;

  final String part_ID;

  final Enum$MaterialType? type;

  final Enum$MaterialGenStatus genStatus;

  final Enum$MaterialCompStatus compStatus;

  final Enum$MaterialConvStatus convStatus;

  final Enum$MaterialFeedbackStatus feedbackStatus;

  final DateTime createdAt;

  final DateTime? completedAt;

  final int unseenAiFeedbacks;

  final Fragment$MiniDetails? details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$stage_ID = stage_ID;
    _resultData['stage_ID'] = l$stage_ID;
    final l$part_ID = part_ID;
    _resultData['part_ID'] = l$part_ID;
    final l$type = type;
    _resultData['type'] =
        l$type == null ? null : toJson$Enum$MaterialType(l$type);
    final l$genStatus = genStatus;
    _resultData['genStatus'] = toJson$Enum$MaterialGenStatus(l$genStatus);
    final l$compStatus = compStatus;
    _resultData['compStatus'] = toJson$Enum$MaterialCompStatus(l$compStatus);
    final l$convStatus = convStatus;
    _resultData['convStatus'] = toJson$Enum$MaterialConvStatus(l$convStatus);
    final l$feedbackStatus = feedbackStatus;
    _resultData['feedbackStatus'] =
        toJson$Enum$MaterialFeedbackStatus(l$feedbackStatus);
    final l$createdAt = createdAt;
    _resultData['createdAt'] = dateTimeToJson(l$createdAt);
    final l$completedAt = completedAt;
    _resultData['completedAt'] =
        l$completedAt == null ? null : dateTimeToJson(l$completedAt);
    final l$unseenAiFeedbacks = unseenAiFeedbacks;
    _resultData['unseenAiFeedbacks'] = l$unseenAiFeedbacks;
    final l$details = details;
    _resultData['details'] = l$details?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$stage_ID = stage_ID;
    final l$part_ID = part_ID;
    final l$type = type;
    final l$genStatus = genStatus;
    final l$compStatus = compStatus;
    final l$convStatus = convStatus;
    final l$feedbackStatus = feedbackStatus;
    final l$createdAt = createdAt;
    final l$completedAt = completedAt;
    final l$unseenAiFeedbacks = unseenAiFeedbacks;
    final l$details = details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$stage_ID,
      l$part_ID,
      l$type,
      l$genStatus,
      l$compStatus,
      l$convStatus,
      l$feedbackStatus,
      l$createdAt,
      l$completedAt,
      l$unseenAiFeedbacks,
      l$details,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$Material || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$stage_ID = stage_ID;
    final lOther$stage_ID = other.stage_ID;
    if (l$stage_ID != lOther$stage_ID) {
      return false;
    }
    final l$part_ID = part_ID;
    final lOther$part_ID = other.part_ID;
    if (l$part_ID != lOther$part_ID) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$genStatus = genStatus;
    final lOther$genStatus = other.genStatus;
    if (l$genStatus != lOther$genStatus) {
      return false;
    }
    final l$compStatus = compStatus;
    final lOther$compStatus = other.compStatus;
    if (l$compStatus != lOther$compStatus) {
      return false;
    }
    final l$convStatus = convStatus;
    final lOther$convStatus = other.convStatus;
    if (l$convStatus != lOther$convStatus) {
      return false;
    }
    final l$feedbackStatus = feedbackStatus;
    final lOther$feedbackStatus = other.feedbackStatus;
    if (l$feedbackStatus != lOther$feedbackStatus) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$completedAt = completedAt;
    final lOther$completedAt = other.completedAt;
    if (l$completedAt != lOther$completedAt) {
      return false;
    }
    final l$unseenAiFeedbacks = unseenAiFeedbacks;
    final lOther$unseenAiFeedbacks = other.unseenAiFeedbacks;
    if (l$unseenAiFeedbacks != lOther$unseenAiFeedbacks) {
      return false;
    }
    final l$details = details;
    final lOther$details = other.details;
    if (l$details != lOther$details) {
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

extension UtilityExtension$Fragment$Material on Fragment$Material {
  CopyWith$Fragment$Material<Fragment$Material> get copyWith =>
      CopyWith$Fragment$Material(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$Material<TRes> {
  factory CopyWith$Fragment$Material(
    Fragment$Material instance,
    TRes Function(Fragment$Material) then,
  ) = _CopyWithImpl$Fragment$Material;

  factory CopyWith$Fragment$Material.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Material;

  TRes call({
    String? id,
    String? stage_ID,
    String? part_ID,
    Enum$MaterialType? type,
    Enum$MaterialGenStatus? genStatus,
    Enum$MaterialCompStatus? compStatus,
    Enum$MaterialConvStatus? convStatus,
    Enum$MaterialFeedbackStatus? feedbackStatus,
    DateTime? createdAt,
    DateTime? completedAt,
    int? unseenAiFeedbacks,
    Fragment$MiniDetails? details,
    String? $__typename,
  });
  CopyWith$Fragment$MiniDetails<TRes> get details;
}

class _CopyWithImpl$Fragment$Material<TRes>
    implements CopyWith$Fragment$Material<TRes> {
  _CopyWithImpl$Fragment$Material(
    this._instance,
    this._then,
  );

  final Fragment$Material _instance;

  final TRes Function(Fragment$Material) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? stage_ID = _undefined,
    Object? part_ID = _undefined,
    Object? type = _undefined,
    Object? genStatus = _undefined,
    Object? compStatus = _undefined,
    Object? convStatus = _undefined,
    Object? feedbackStatus = _undefined,
    Object? createdAt = _undefined,
    Object? completedAt = _undefined,
    Object? unseenAiFeedbacks = _undefined,
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Material(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        stage_ID: stage_ID == _undefined || stage_ID == null
            ? _instance.stage_ID
            : (stage_ID as String),
        part_ID: part_ID == _undefined || part_ID == null
            ? _instance.part_ID
            : (part_ID as String),
        type:
            type == _undefined ? _instance.type : (type as Enum$MaterialType?),
        genStatus: genStatus == _undefined || genStatus == null
            ? _instance.genStatus
            : (genStatus as Enum$MaterialGenStatus),
        compStatus: compStatus == _undefined || compStatus == null
            ? _instance.compStatus
            : (compStatus as Enum$MaterialCompStatus),
        convStatus: convStatus == _undefined || convStatus == null
            ? _instance.convStatus
            : (convStatus as Enum$MaterialConvStatus),
        feedbackStatus: feedbackStatus == _undefined || feedbackStatus == null
            ? _instance.feedbackStatus
            : (feedbackStatus as Enum$MaterialFeedbackStatus),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as DateTime),
        completedAt: completedAt == _undefined
            ? _instance.completedAt
            : (completedAt as DateTime?),
        unseenAiFeedbacks:
            unseenAiFeedbacks == _undefined || unseenAiFeedbacks == null
                ? _instance.unseenAiFeedbacks
                : (unseenAiFeedbacks as int),
        details: details == _undefined
            ? _instance.details
            : (details as Fragment$MiniDetails?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$MiniDetails<TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Fragment$MiniDetails.stub(_then(_instance))
        : CopyWith$Fragment$MiniDetails(local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Fragment$Material<TRes>
    implements CopyWith$Fragment$Material<TRes> {
  _CopyWithStubImpl$Fragment$Material(this._res);

  TRes _res;

  call({
    String? id,
    String? stage_ID,
    String? part_ID,
    Enum$MaterialType? type,
    Enum$MaterialGenStatus? genStatus,
    Enum$MaterialCompStatus? compStatus,
    Enum$MaterialConvStatus? convStatus,
    Enum$MaterialFeedbackStatus? feedbackStatus,
    DateTime? createdAt,
    DateTime? completedAt,
    int? unseenAiFeedbacks,
    Fragment$MiniDetails? details,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$MiniDetails<TRes> get details =>
      CopyWith$Fragment$MiniDetails.stub(_res);
}

const fragmentDefinitionMaterial = FragmentDefinitionNode(
  name: NameNode(value: 'Material'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'Material'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'id'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'stage_ID'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'part_ID'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'type'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'genStatus'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'compStatus'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'convStatus'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'feedbackStatus'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'completedAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'unseenAiFeedbacks'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'details'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FragmentSpreadNode(
          name: NameNode(value: 'MiniDetails'),
          directives: [],
        )
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
);
const documentNodeFragmentMaterial = DocumentNode(definitions: [
  fragmentDefinitionMaterial,
  fragmentDefinitionMiniDetails,
]);

extension ClientExtension$Fragment$Material on graphql.GraphQLClient {
  void writeFragment$Material({
    required Fragment$Material data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'Material',
            document: documentNodeFragmentMaterial,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$Material? readFragment$Material({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'Material',
          document: documentNodeFragmentMaterial,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$Material.fromJson(result);
  }
}

class Fragment$MiniDetails {
  Fragment$MiniDetails({
    required this.type,
    required this.title,
    required this.description,
    required this.$__typename,
  });

  factory Fragment$MiniDetails.fromJson(Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "StoryDetails":
        return Fragment$MiniDetails$$StoryDetails.fromJson(json);

      case "QuizDetails":
        return Fragment$MiniDetails$$QuizDetails.fromJson(json);

      case "ConversationDetails":
        return Fragment$MiniDetails$$ConversationDetails.fromJson(json);

      default:
        final l$type = json['type'];
        final l$title = json['title'];
        final l$description = json['description'];
        final l$$__typename = json['__typename'];
        return Fragment$MiniDetails(
          type: fromJson$Enum$MaterialType((l$type as String)),
          title: (l$title as String),
          description: (l$description as String),
          $__typename: (l$$__typename as String),
        );
    }
  }

  final Enum$MaterialType type;

  final String title;

  final String description;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$type = type;
    _resultData['type'] = toJson$Enum$MaterialType(l$type);
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$type = type;
    final l$title = title;
    final l$description = description;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$type,
      l$title,
      l$description,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$MiniDetails || runtimeType != other.runtimeType) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
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

extension UtilityExtension$Fragment$MiniDetails on Fragment$MiniDetails {
  CopyWith$Fragment$MiniDetails<Fragment$MiniDetails> get copyWith =>
      CopyWith$Fragment$MiniDetails(
        this,
        (i) => i,
      );
  _T when<_T>({
    required _T Function(Fragment$MiniDetails$$StoryDetails) storyDetails,
    required _T Function(Fragment$MiniDetails$$QuizDetails) quizDetails,
    required _T Function(Fragment$MiniDetails$$ConversationDetails)
        conversationDetails,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "StoryDetails":
        return storyDetails(this as Fragment$MiniDetails$$StoryDetails);

      case "QuizDetails":
        return quizDetails(this as Fragment$MiniDetails$$QuizDetails);

      case "ConversationDetails":
        return conversationDetails(
            this as Fragment$MiniDetails$$ConversationDetails);

      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(Fragment$MiniDetails$$StoryDetails)? storyDetails,
    _T Function(Fragment$MiniDetails$$QuizDetails)? quizDetails,
    _T Function(Fragment$MiniDetails$$ConversationDetails)? conversationDetails,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "StoryDetails":
        if (storyDetails != null) {
          return storyDetails(this as Fragment$MiniDetails$$StoryDetails);
        } else {
          return orElse();
        }

      case "QuizDetails":
        if (quizDetails != null) {
          return quizDetails(this as Fragment$MiniDetails$$QuizDetails);
        } else {
          return orElse();
        }

      case "ConversationDetails":
        if (conversationDetails != null) {
          return conversationDetails(
              this as Fragment$MiniDetails$$ConversationDetails);
        } else {
          return orElse();
        }

      default:
        return orElse();
    }
  }
}

abstract class CopyWith$Fragment$MiniDetails<TRes> {
  factory CopyWith$Fragment$MiniDetails(
    Fragment$MiniDetails instance,
    TRes Function(Fragment$MiniDetails) then,
  ) = _CopyWithImpl$Fragment$MiniDetails;

  factory CopyWith$Fragment$MiniDetails.stub(TRes res) =
      _CopyWithStubImpl$Fragment$MiniDetails;

  TRes call({
    Enum$MaterialType? type,
    String? title,
    String? description,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$MiniDetails<TRes>
    implements CopyWith$Fragment$MiniDetails<TRes> {
  _CopyWithImpl$Fragment$MiniDetails(
    this._instance,
    this._then,
  );

  final Fragment$MiniDetails _instance;

  final TRes Function(Fragment$MiniDetails) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? type = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$MiniDetails(
        type: type == _undefined || type == null
            ? _instance.type
            : (type as Enum$MaterialType),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        description: description == _undefined || description == null
            ? _instance.description
            : (description as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$MiniDetails<TRes>
    implements CopyWith$Fragment$MiniDetails<TRes> {
  _CopyWithStubImpl$Fragment$MiniDetails(this._res);

  TRes _res;

  call({
    Enum$MaterialType? type,
    String? title,
    String? description,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionMiniDetails = FragmentDefinitionNode(
  name: NameNode(value: 'MiniDetails'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'MaterialDetails'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'type'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'title'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'description'),
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
);
const documentNodeFragmentMiniDetails = DocumentNode(definitions: [
  fragmentDefinitionMiniDetails,
]);

extension ClientExtension$Fragment$MiniDetails on graphql.GraphQLClient {
  void writeFragment$MiniDetails({
    required Fragment$MiniDetails data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'MiniDetails',
            document: documentNodeFragmentMiniDetails,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$MiniDetails? readFragment$MiniDetails({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'MiniDetails',
          document: documentNodeFragmentMiniDetails,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$MiniDetails.fromJson(result);
  }
}

class Fragment$MiniDetails$$StoryDetails implements Fragment$MiniDetails {
  Fragment$MiniDetails$$StoryDetails({
    required this.type,
    required this.title,
    required this.description,
    this.$__typename = 'StoryDetails',
  });

  factory Fragment$MiniDetails$$StoryDetails.fromJson(
      Map<String, dynamic> json) {
    final l$type = json['type'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$$__typename = json['__typename'];
    return Fragment$MiniDetails$$StoryDetails(
      type: fromJson$Enum$MaterialType((l$type as String)),
      title: (l$title as String),
      description: (l$description as String),
      $__typename: (l$$__typename as String),
    );
  }

  final Enum$MaterialType type;

  final String title;

  final String description;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$type = type;
    _resultData['type'] = toJson$Enum$MaterialType(l$type);
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$type = type;
    final l$title = title;
    final l$description = description;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$type,
      l$title,
      l$description,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$MiniDetails$$StoryDetails ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
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

extension UtilityExtension$Fragment$MiniDetails$$StoryDetails
    on Fragment$MiniDetails$$StoryDetails {
  CopyWith$Fragment$MiniDetails$$StoryDetails<
          Fragment$MiniDetails$$StoryDetails>
      get copyWith => CopyWith$Fragment$MiniDetails$$StoryDetails(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$MiniDetails$$StoryDetails<TRes> {
  factory CopyWith$Fragment$MiniDetails$$StoryDetails(
    Fragment$MiniDetails$$StoryDetails instance,
    TRes Function(Fragment$MiniDetails$$StoryDetails) then,
  ) = _CopyWithImpl$Fragment$MiniDetails$$StoryDetails;

  factory CopyWith$Fragment$MiniDetails$$StoryDetails.stub(TRes res) =
      _CopyWithStubImpl$Fragment$MiniDetails$$StoryDetails;

  TRes call({
    Enum$MaterialType? type,
    String? title,
    String? description,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$MiniDetails$$StoryDetails<TRes>
    implements CopyWith$Fragment$MiniDetails$$StoryDetails<TRes> {
  _CopyWithImpl$Fragment$MiniDetails$$StoryDetails(
    this._instance,
    this._then,
  );

  final Fragment$MiniDetails$$StoryDetails _instance;

  final TRes Function(Fragment$MiniDetails$$StoryDetails) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? type = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$MiniDetails$$StoryDetails(
        type: type == _undefined || type == null
            ? _instance.type
            : (type as Enum$MaterialType),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        description: description == _undefined || description == null
            ? _instance.description
            : (description as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$MiniDetails$$StoryDetails<TRes>
    implements CopyWith$Fragment$MiniDetails$$StoryDetails<TRes> {
  _CopyWithStubImpl$Fragment$MiniDetails$$StoryDetails(this._res);

  TRes _res;

  call({
    Enum$MaterialType? type,
    String? title,
    String? description,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$MiniDetails$$QuizDetails implements Fragment$MiniDetails {
  Fragment$MiniDetails$$QuizDetails({
    required this.type,
    required this.title,
    required this.description,
    this.$__typename = 'QuizDetails',
  });

  factory Fragment$MiniDetails$$QuizDetails.fromJson(
      Map<String, dynamic> json) {
    final l$type = json['type'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$$__typename = json['__typename'];
    return Fragment$MiniDetails$$QuizDetails(
      type: fromJson$Enum$MaterialType((l$type as String)),
      title: (l$title as String),
      description: (l$description as String),
      $__typename: (l$$__typename as String),
    );
  }

  final Enum$MaterialType type;

  final String title;

  final String description;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$type = type;
    _resultData['type'] = toJson$Enum$MaterialType(l$type);
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$type = type;
    final l$title = title;
    final l$description = description;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$type,
      l$title,
      l$description,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$MiniDetails$$QuizDetails ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
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

extension UtilityExtension$Fragment$MiniDetails$$QuizDetails
    on Fragment$MiniDetails$$QuizDetails {
  CopyWith$Fragment$MiniDetails$$QuizDetails<Fragment$MiniDetails$$QuizDetails>
      get copyWith => CopyWith$Fragment$MiniDetails$$QuizDetails(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$MiniDetails$$QuizDetails<TRes> {
  factory CopyWith$Fragment$MiniDetails$$QuizDetails(
    Fragment$MiniDetails$$QuizDetails instance,
    TRes Function(Fragment$MiniDetails$$QuizDetails) then,
  ) = _CopyWithImpl$Fragment$MiniDetails$$QuizDetails;

  factory CopyWith$Fragment$MiniDetails$$QuizDetails.stub(TRes res) =
      _CopyWithStubImpl$Fragment$MiniDetails$$QuizDetails;

  TRes call({
    Enum$MaterialType? type,
    String? title,
    String? description,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$MiniDetails$$QuizDetails<TRes>
    implements CopyWith$Fragment$MiniDetails$$QuizDetails<TRes> {
  _CopyWithImpl$Fragment$MiniDetails$$QuizDetails(
    this._instance,
    this._then,
  );

  final Fragment$MiniDetails$$QuizDetails _instance;

  final TRes Function(Fragment$MiniDetails$$QuizDetails) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? type = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$MiniDetails$$QuizDetails(
        type: type == _undefined || type == null
            ? _instance.type
            : (type as Enum$MaterialType),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        description: description == _undefined || description == null
            ? _instance.description
            : (description as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$MiniDetails$$QuizDetails<TRes>
    implements CopyWith$Fragment$MiniDetails$$QuizDetails<TRes> {
  _CopyWithStubImpl$Fragment$MiniDetails$$QuizDetails(this._res);

  TRes _res;

  call({
    Enum$MaterialType? type,
    String? title,
    String? description,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$MiniDetails$$ConversationDetails
    implements Fragment$MiniDetails {
  Fragment$MiniDetails$$ConversationDetails({
    required this.type,
    required this.title,
    required this.description,
    this.$__typename = 'ConversationDetails',
  });

  factory Fragment$MiniDetails$$ConversationDetails.fromJson(
      Map<String, dynamic> json) {
    final l$type = json['type'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$$__typename = json['__typename'];
    return Fragment$MiniDetails$$ConversationDetails(
      type: fromJson$Enum$MaterialType((l$type as String)),
      title: (l$title as String),
      description: (l$description as String),
      $__typename: (l$$__typename as String),
    );
  }

  final Enum$MaterialType type;

  final String title;

  final String description;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$type = type;
    _resultData['type'] = toJson$Enum$MaterialType(l$type);
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$type = type;
    final l$title = title;
    final l$description = description;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$type,
      l$title,
      l$description,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$MiniDetails$$ConversationDetails ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
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

extension UtilityExtension$Fragment$MiniDetails$$ConversationDetails
    on Fragment$MiniDetails$$ConversationDetails {
  CopyWith$Fragment$MiniDetails$$ConversationDetails<
          Fragment$MiniDetails$$ConversationDetails>
      get copyWith => CopyWith$Fragment$MiniDetails$$ConversationDetails(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$MiniDetails$$ConversationDetails<TRes> {
  factory CopyWith$Fragment$MiniDetails$$ConversationDetails(
    Fragment$MiniDetails$$ConversationDetails instance,
    TRes Function(Fragment$MiniDetails$$ConversationDetails) then,
  ) = _CopyWithImpl$Fragment$MiniDetails$$ConversationDetails;

  factory CopyWith$Fragment$MiniDetails$$ConversationDetails.stub(TRes res) =
      _CopyWithStubImpl$Fragment$MiniDetails$$ConversationDetails;

  TRes call({
    Enum$MaterialType? type,
    String? title,
    String? description,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$MiniDetails$$ConversationDetails<TRes>
    implements CopyWith$Fragment$MiniDetails$$ConversationDetails<TRes> {
  _CopyWithImpl$Fragment$MiniDetails$$ConversationDetails(
    this._instance,
    this._then,
  );

  final Fragment$MiniDetails$$ConversationDetails _instance;

  final TRes Function(Fragment$MiniDetails$$ConversationDetails) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? type = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$MiniDetails$$ConversationDetails(
        type: type == _undefined || type == null
            ? _instance.type
            : (type as Enum$MaterialType),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        description: description == _undefined || description == null
            ? _instance.description
            : (description as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$MiniDetails$$ConversationDetails<TRes>
    implements CopyWith$Fragment$MiniDetails$$ConversationDetails<TRes> {
  _CopyWithStubImpl$Fragment$MiniDetails$$ConversationDetails(this._res);

  TRes _res;

  call({
    Enum$MaterialType? type,
    String? title,
    String? description,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$MaterialStatusses {
  Fragment$MaterialStatusses({
    required this.genStatus,
    required this.compStatus,
    required this.convStatus,
    required this.feedbackStatus,
    this.$__typename = 'Material',
  });

  factory Fragment$MaterialStatusses.fromJson(Map<String, dynamic> json) {
    final l$genStatus = json['genStatus'];
    final l$compStatus = json['compStatus'];
    final l$convStatus = json['convStatus'];
    final l$feedbackStatus = json['feedbackStatus'];
    final l$$__typename = json['__typename'];
    return Fragment$MaterialStatusses(
      genStatus: fromJson$Enum$MaterialGenStatus((l$genStatus as String)),
      compStatus: fromJson$Enum$MaterialCompStatus((l$compStatus as String)),
      convStatus: fromJson$Enum$MaterialConvStatus((l$convStatus as String)),
      feedbackStatus:
          fromJson$Enum$MaterialFeedbackStatus((l$feedbackStatus as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final Enum$MaterialGenStatus genStatus;

  final Enum$MaterialCompStatus compStatus;

  final Enum$MaterialConvStatus convStatus;

  final Enum$MaterialFeedbackStatus feedbackStatus;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$genStatus = genStatus;
    _resultData['genStatus'] = toJson$Enum$MaterialGenStatus(l$genStatus);
    final l$compStatus = compStatus;
    _resultData['compStatus'] = toJson$Enum$MaterialCompStatus(l$compStatus);
    final l$convStatus = convStatus;
    _resultData['convStatus'] = toJson$Enum$MaterialConvStatus(l$convStatus);
    final l$feedbackStatus = feedbackStatus;
    _resultData['feedbackStatus'] =
        toJson$Enum$MaterialFeedbackStatus(l$feedbackStatus);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$genStatus = genStatus;
    final l$compStatus = compStatus;
    final l$convStatus = convStatus;
    final l$feedbackStatus = feedbackStatus;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$genStatus,
      l$compStatus,
      l$convStatus,
      l$feedbackStatus,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$MaterialStatusses ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$genStatus = genStatus;
    final lOther$genStatus = other.genStatus;
    if (l$genStatus != lOther$genStatus) {
      return false;
    }
    final l$compStatus = compStatus;
    final lOther$compStatus = other.compStatus;
    if (l$compStatus != lOther$compStatus) {
      return false;
    }
    final l$convStatus = convStatus;
    final lOther$convStatus = other.convStatus;
    if (l$convStatus != lOther$convStatus) {
      return false;
    }
    final l$feedbackStatus = feedbackStatus;
    final lOther$feedbackStatus = other.feedbackStatus;
    if (l$feedbackStatus != lOther$feedbackStatus) {
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

extension UtilityExtension$Fragment$MaterialStatusses
    on Fragment$MaterialStatusses {
  CopyWith$Fragment$MaterialStatusses<Fragment$MaterialStatusses>
      get copyWith => CopyWith$Fragment$MaterialStatusses(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$MaterialStatusses<TRes> {
  factory CopyWith$Fragment$MaterialStatusses(
    Fragment$MaterialStatusses instance,
    TRes Function(Fragment$MaterialStatusses) then,
  ) = _CopyWithImpl$Fragment$MaterialStatusses;

  factory CopyWith$Fragment$MaterialStatusses.stub(TRes res) =
      _CopyWithStubImpl$Fragment$MaterialStatusses;

  TRes call({
    Enum$MaterialGenStatus? genStatus,
    Enum$MaterialCompStatus? compStatus,
    Enum$MaterialConvStatus? convStatus,
    Enum$MaterialFeedbackStatus? feedbackStatus,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$MaterialStatusses<TRes>
    implements CopyWith$Fragment$MaterialStatusses<TRes> {
  _CopyWithImpl$Fragment$MaterialStatusses(
    this._instance,
    this._then,
  );

  final Fragment$MaterialStatusses _instance;

  final TRes Function(Fragment$MaterialStatusses) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? genStatus = _undefined,
    Object? compStatus = _undefined,
    Object? convStatus = _undefined,
    Object? feedbackStatus = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$MaterialStatusses(
        genStatus: genStatus == _undefined || genStatus == null
            ? _instance.genStatus
            : (genStatus as Enum$MaterialGenStatus),
        compStatus: compStatus == _undefined || compStatus == null
            ? _instance.compStatus
            : (compStatus as Enum$MaterialCompStatus),
        convStatus: convStatus == _undefined || convStatus == null
            ? _instance.convStatus
            : (convStatus as Enum$MaterialConvStatus),
        feedbackStatus: feedbackStatus == _undefined || feedbackStatus == null
            ? _instance.feedbackStatus
            : (feedbackStatus as Enum$MaterialFeedbackStatus),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$MaterialStatusses<TRes>
    implements CopyWith$Fragment$MaterialStatusses<TRes> {
  _CopyWithStubImpl$Fragment$MaterialStatusses(this._res);

  TRes _res;

  call({
    Enum$MaterialGenStatus? genStatus,
    Enum$MaterialCompStatus? compStatus,
    Enum$MaterialConvStatus? convStatus,
    Enum$MaterialFeedbackStatus? feedbackStatus,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionMaterialStatusses = FragmentDefinitionNode(
  name: NameNode(value: 'MaterialStatusses'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'Material'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'genStatus'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'compStatus'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'convStatus'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'feedbackStatus'),
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
);
const documentNodeFragmentMaterialStatusses = DocumentNode(definitions: [
  fragmentDefinitionMaterialStatusses,
]);

extension ClientExtension$Fragment$MaterialStatusses on graphql.GraphQLClient {
  void writeFragment$MaterialStatusses({
    required Fragment$MaterialStatusses data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'MaterialStatusses',
            document: documentNodeFragmentMaterialStatusses,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$MaterialStatusses? readFragment$MaterialStatusses({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'MaterialStatusses',
          document: documentNodeFragmentMaterialStatusses,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$MaterialStatusses.fromJson(result);
  }
}

class Fragment$AIFeedbackPart {
  Fragment$AIFeedbackPart({
    required this.type,
    required this.text,
    this.$__typename = 'AIFeedbackPart',
  });

  factory Fragment$AIFeedbackPart.fromJson(Map<String, dynamic> json) {
    final l$type = json['type'];
    final l$text = json['text'];
    final l$$__typename = json['__typename'];
    return Fragment$AIFeedbackPart(
      type: fromJson$Enum$AIFeedbackPartType((l$type as String)),
      text: (l$text as String),
      $__typename: (l$$__typename as String),
    );
  }

  final Enum$AIFeedbackPartType type;

  final String text;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$type = type;
    _resultData['type'] = toJson$Enum$AIFeedbackPartType(l$type);
    final l$text = text;
    _resultData['text'] = l$text;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$type = type;
    final l$text = text;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$type,
      l$text,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$AIFeedbackPart || runtimeType != other.runtimeType) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$text = text;
    final lOther$text = other.text;
    if (l$text != lOther$text) {
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

extension UtilityExtension$Fragment$AIFeedbackPart on Fragment$AIFeedbackPart {
  CopyWith$Fragment$AIFeedbackPart<Fragment$AIFeedbackPart> get copyWith =>
      CopyWith$Fragment$AIFeedbackPart(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$AIFeedbackPart<TRes> {
  factory CopyWith$Fragment$AIFeedbackPart(
    Fragment$AIFeedbackPart instance,
    TRes Function(Fragment$AIFeedbackPart) then,
  ) = _CopyWithImpl$Fragment$AIFeedbackPart;

  factory CopyWith$Fragment$AIFeedbackPart.stub(TRes res) =
      _CopyWithStubImpl$Fragment$AIFeedbackPart;

  TRes call({
    Enum$AIFeedbackPartType? type,
    String? text,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$AIFeedbackPart<TRes>
    implements CopyWith$Fragment$AIFeedbackPart<TRes> {
  _CopyWithImpl$Fragment$AIFeedbackPart(
    this._instance,
    this._then,
  );

  final Fragment$AIFeedbackPart _instance;

  final TRes Function(Fragment$AIFeedbackPart) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? type = _undefined,
    Object? text = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$AIFeedbackPart(
        type: type == _undefined || type == null
            ? _instance.type
            : (type as Enum$AIFeedbackPartType),
        text: text == _undefined || text == null
            ? _instance.text
            : (text as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$AIFeedbackPart<TRes>
    implements CopyWith$Fragment$AIFeedbackPart<TRes> {
  _CopyWithStubImpl$Fragment$AIFeedbackPart(this._res);

  TRes _res;

  call({
    Enum$AIFeedbackPartType? type,
    String? text,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionAIFeedbackPart = FragmentDefinitionNode(
  name: NameNode(value: 'AIFeedbackPart'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'AIFeedbackPart'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'type'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'text'),
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
);
const documentNodeFragmentAIFeedbackPart = DocumentNode(definitions: [
  fragmentDefinitionAIFeedbackPart,
]);

extension ClientExtension$Fragment$AIFeedbackPart on graphql.GraphQLClient {
  void writeFragment$AIFeedbackPart({
    required Fragment$AIFeedbackPart data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'AIFeedbackPart',
            document: documentNodeFragmentAIFeedbackPart,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$AIFeedbackPart? readFragment$AIFeedbackPart({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'AIFeedbackPart',
          document: documentNodeFragmentAIFeedbackPart,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$AIFeedbackPart.fromJson(result);
  }
}

class Fragment$AIFeedbackInterface {
  Fragment$AIFeedbackInterface({
    required this.type,
    this.question,
    this.turnIndex,
    required this.parts,
    this.$__typename = 'AIFeedbackInterface',
  });

  factory Fragment$AIFeedbackInterface.fromJson(Map<String, dynamic> json) {
    final l$type = json['type'];
    final l$question = json['question'];
    final l$turnIndex = json['turnIndex'];
    final l$parts = json['parts'];
    final l$$__typename = json['__typename'];
    return Fragment$AIFeedbackInterface(
      type: fromJson$Enum$AIFeedbackType((l$type as String)),
      question: (l$question as String?),
      turnIndex: (l$turnIndex as int?),
      parts: (l$parts as List<dynamic>)
          .map((e) =>
              Fragment$AIFeedbackPart.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final Enum$AIFeedbackType type;

  final String? question;

  final int? turnIndex;

  final List<Fragment$AIFeedbackPart> parts;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$type = type;
    _resultData['type'] = toJson$Enum$AIFeedbackType(l$type);
    final l$question = question;
    _resultData['question'] = l$question;
    final l$turnIndex = turnIndex;
    _resultData['turnIndex'] = l$turnIndex;
    final l$parts = parts;
    _resultData['parts'] = l$parts.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$type = type;
    final l$question = question;
    final l$turnIndex = turnIndex;
    final l$parts = parts;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$type,
      l$question,
      l$turnIndex,
      Object.hashAll(l$parts.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$AIFeedbackInterface ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$question = question;
    final lOther$question = other.question;
    if (l$question != lOther$question) {
      return false;
    }
    final l$turnIndex = turnIndex;
    final lOther$turnIndex = other.turnIndex;
    if (l$turnIndex != lOther$turnIndex) {
      return false;
    }
    final l$parts = parts;
    final lOther$parts = other.parts;
    if (l$parts.length != lOther$parts.length) {
      return false;
    }
    for (int i = 0; i < l$parts.length; i++) {
      final l$parts$entry = l$parts[i];
      final lOther$parts$entry = lOther$parts[i];
      if (l$parts$entry != lOther$parts$entry) {
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

extension UtilityExtension$Fragment$AIFeedbackInterface
    on Fragment$AIFeedbackInterface {
  CopyWith$Fragment$AIFeedbackInterface<Fragment$AIFeedbackInterface>
      get copyWith => CopyWith$Fragment$AIFeedbackInterface(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$AIFeedbackInterface<TRes> {
  factory CopyWith$Fragment$AIFeedbackInterface(
    Fragment$AIFeedbackInterface instance,
    TRes Function(Fragment$AIFeedbackInterface) then,
  ) = _CopyWithImpl$Fragment$AIFeedbackInterface;

  factory CopyWith$Fragment$AIFeedbackInterface.stub(TRes res) =
      _CopyWithStubImpl$Fragment$AIFeedbackInterface;

  TRes call({
    Enum$AIFeedbackType? type,
    String? question,
    int? turnIndex,
    List<Fragment$AIFeedbackPart>? parts,
    String? $__typename,
  });
  TRes parts(
      Iterable<Fragment$AIFeedbackPart> Function(
              Iterable<
                  CopyWith$Fragment$AIFeedbackPart<Fragment$AIFeedbackPart>>)
          _fn);
}

class _CopyWithImpl$Fragment$AIFeedbackInterface<TRes>
    implements CopyWith$Fragment$AIFeedbackInterface<TRes> {
  _CopyWithImpl$Fragment$AIFeedbackInterface(
    this._instance,
    this._then,
  );

  final Fragment$AIFeedbackInterface _instance;

  final TRes Function(Fragment$AIFeedbackInterface) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? type = _undefined,
    Object? question = _undefined,
    Object? turnIndex = _undefined,
    Object? parts = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$AIFeedbackInterface(
        type: type == _undefined || type == null
            ? _instance.type
            : (type as Enum$AIFeedbackType),
        question:
            question == _undefined ? _instance.question : (question as String?),
        turnIndex:
            turnIndex == _undefined ? _instance.turnIndex : (turnIndex as int?),
        parts: parts == _undefined || parts == null
            ? _instance.parts
            : (parts as List<Fragment$AIFeedbackPart>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes parts(
          Iterable<Fragment$AIFeedbackPart> Function(
                  Iterable<
                      CopyWith$Fragment$AIFeedbackPart<
                          Fragment$AIFeedbackPart>>)
              _fn) =>
      call(
          parts:
              _fn(_instance.parts.map((e) => CopyWith$Fragment$AIFeedbackPart(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Fragment$AIFeedbackInterface<TRes>
    implements CopyWith$Fragment$AIFeedbackInterface<TRes> {
  _CopyWithStubImpl$Fragment$AIFeedbackInterface(this._res);

  TRes _res;

  call({
    Enum$AIFeedbackType? type,
    String? question,
    int? turnIndex,
    List<Fragment$AIFeedbackPart>? parts,
    String? $__typename,
  }) =>
      _res;

  parts(_fn) => _res;
}

const fragmentDefinitionAIFeedbackInterface = FragmentDefinitionNode(
  name: NameNode(value: 'AIFeedbackInterface'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'AIFeedbackInterface'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'type'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'question'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'turnIndex'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'parts'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FragmentSpreadNode(
          name: NameNode(value: 'AIFeedbackPart'),
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
);
const documentNodeFragmentAIFeedbackInterface = DocumentNode(definitions: [
  fragmentDefinitionAIFeedbackInterface,
  fragmentDefinitionAIFeedbackPart,
]);

extension ClientExtension$Fragment$AIFeedbackInterface
    on graphql.GraphQLClient {
  void writeFragment$AIFeedbackInterface({
    required Fragment$AIFeedbackInterface data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'AIFeedbackInterface',
            document: documentNodeFragmentAIFeedbackInterface,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$AIFeedbackInterface? readFragment$AIFeedbackInterface({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'AIFeedbackInterface',
          document: documentNodeFragmentAIFeedbackInterface,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Fragment$AIFeedbackInterface.fromJson(result);
  }
}

class Fragment$AIFeedback {
  Fragment$AIFeedback({
    required this.id,
    required this.createdAt,
    required this.feedback,
    this.material_ID,
    required this.user_ID,
    required this.seen,
    this.$__typename = 'AIFeedback',
  });

  factory Fragment$AIFeedback.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$createdAt = json['createdAt'];
    final l$feedback = json['feedback'];
    final l$material_ID = json['material_ID'];
    final l$user_ID = json['user_ID'];
    final l$seen = json['seen'];
    final l$$__typename = json['__typename'];
    return Fragment$AIFeedback(
      id: (l$id as String),
      createdAt: dateTimeFromJson(l$createdAt),
      feedback: Fragment$AIFeedbackInterface.fromJson(
          (l$feedback as Map<String, dynamic>)),
      material_ID: (l$material_ID as String?),
      user_ID: (l$user_ID as String),
      seen: (l$seen as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final DateTime createdAt;

  final Fragment$AIFeedbackInterface feedback;

  final String? material_ID;

  final String user_ID;

  final bool seen;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = dateTimeToJson(l$createdAt);
    final l$feedback = feedback;
    _resultData['feedback'] = l$feedback.toJson();
    final l$material_ID = material_ID;
    _resultData['material_ID'] = l$material_ID;
    final l$user_ID = user_ID;
    _resultData['user_ID'] = l$user_ID;
    final l$seen = seen;
    _resultData['seen'] = l$seen;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$createdAt = createdAt;
    final l$feedback = feedback;
    final l$material_ID = material_ID;
    final l$user_ID = user_ID;
    final l$seen = seen;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$createdAt,
      l$feedback,
      l$material_ID,
      l$user_ID,
      l$seen,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$AIFeedback || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$feedback = feedback;
    final lOther$feedback = other.feedback;
    if (l$feedback != lOther$feedback) {
      return false;
    }
    final l$material_ID = material_ID;
    final lOther$material_ID = other.material_ID;
    if (l$material_ID != lOther$material_ID) {
      return false;
    }
    final l$user_ID = user_ID;
    final lOther$user_ID = other.user_ID;
    if (l$user_ID != lOther$user_ID) {
      return false;
    }
    final l$seen = seen;
    final lOther$seen = other.seen;
    if (l$seen != lOther$seen) {
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

extension UtilityExtension$Fragment$AIFeedback on Fragment$AIFeedback {
  CopyWith$Fragment$AIFeedback<Fragment$AIFeedback> get copyWith =>
      CopyWith$Fragment$AIFeedback(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$AIFeedback<TRes> {
  factory CopyWith$Fragment$AIFeedback(
    Fragment$AIFeedback instance,
    TRes Function(Fragment$AIFeedback) then,
  ) = _CopyWithImpl$Fragment$AIFeedback;

  factory CopyWith$Fragment$AIFeedback.stub(TRes res) =
      _CopyWithStubImpl$Fragment$AIFeedback;

  TRes call({
    String? id,
    DateTime? createdAt,
    Fragment$AIFeedbackInterface? feedback,
    String? material_ID,
    String? user_ID,
    bool? seen,
    String? $__typename,
  });
  CopyWith$Fragment$AIFeedbackInterface<TRes> get feedback;
}

class _CopyWithImpl$Fragment$AIFeedback<TRes>
    implements CopyWith$Fragment$AIFeedback<TRes> {
  _CopyWithImpl$Fragment$AIFeedback(
    this._instance,
    this._then,
  );

  final Fragment$AIFeedback _instance;

  final TRes Function(Fragment$AIFeedback) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? createdAt = _undefined,
    Object? feedback = _undefined,
    Object? material_ID = _undefined,
    Object? user_ID = _undefined,
    Object? seen = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$AIFeedback(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as DateTime),
        feedback: feedback == _undefined || feedback == null
            ? _instance.feedback
            : (feedback as Fragment$AIFeedbackInterface),
        material_ID: material_ID == _undefined
            ? _instance.material_ID
            : (material_ID as String?),
        user_ID: user_ID == _undefined || user_ID == null
            ? _instance.user_ID
            : (user_ID as String),
        seen: seen == _undefined || seen == null
            ? _instance.seen
            : (seen as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$AIFeedbackInterface<TRes> get feedback {
    final local$feedback = _instance.feedback;
    return CopyWith$Fragment$AIFeedbackInterface(
        local$feedback, (e) => call(feedback: e));
  }
}

class _CopyWithStubImpl$Fragment$AIFeedback<TRes>
    implements CopyWith$Fragment$AIFeedback<TRes> {
  _CopyWithStubImpl$Fragment$AIFeedback(this._res);

  TRes _res;

  call({
    String? id,
    DateTime? createdAt,
    Fragment$AIFeedbackInterface? feedback,
    String? material_ID,
    String? user_ID,
    bool? seen,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$AIFeedbackInterface<TRes> get feedback =>
      CopyWith$Fragment$AIFeedbackInterface.stub(_res);
}

const fragmentDefinitionAIFeedback = FragmentDefinitionNode(
  name: NameNode(value: 'AIFeedback'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'AIFeedback'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'id'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'feedback'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FragmentSpreadNode(
          name: NameNode(value: 'AIFeedbackInterface'),
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
      name: NameNode(value: 'material_ID'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'user_ID'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'seen'),
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
);
const documentNodeFragmentAIFeedback = DocumentNode(definitions: [
  fragmentDefinitionAIFeedback,
  fragmentDefinitionAIFeedbackInterface,
  fragmentDefinitionAIFeedbackPart,
]);

extension ClientExtension$Fragment$AIFeedback on graphql.GraphQLClient {
  void writeFragment$AIFeedback({
    required Fragment$AIFeedback data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'AIFeedback',
            document: documentNodeFragmentAIFeedback,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$AIFeedback? readFragment$AIFeedback({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'AIFeedback',
          document: documentNodeFragmentAIFeedback,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$AIFeedback.fromJson(result);
  }
}

class Fragment$UserAnswer {
  Fragment$UserAnswer({
    required this.id,
    required this.createdAt,
    required this.answers,
    this.$__typename = 'UserAnswer',
  });

  factory Fragment$UserAnswer.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$createdAt = json['createdAt'];
    final l$answers = json['answers'];
    final l$$__typename = json['__typename'];
    return Fragment$UserAnswer(
      id: (l$id as String),
      createdAt: dateTimeFromJson(l$createdAt),
      answers: jsonFromString(l$answers),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final DateTime createdAt;

  final dynamic answers;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = dateTimeToJson(l$createdAt);
    final l$answers = answers;
    _resultData['answers'] = jsonToString(l$answers);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$createdAt = createdAt;
    final l$answers = answers;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$createdAt,
      l$answers,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$UserAnswer || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$answers = answers;
    final lOther$answers = other.answers;
    if (l$answers != lOther$answers) {
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

extension UtilityExtension$Fragment$UserAnswer on Fragment$UserAnswer {
  CopyWith$Fragment$UserAnswer<Fragment$UserAnswer> get copyWith =>
      CopyWith$Fragment$UserAnswer(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$UserAnswer<TRes> {
  factory CopyWith$Fragment$UserAnswer(
    Fragment$UserAnswer instance,
    TRes Function(Fragment$UserAnswer) then,
  ) = _CopyWithImpl$Fragment$UserAnswer;

  factory CopyWith$Fragment$UserAnswer.stub(TRes res) =
      _CopyWithStubImpl$Fragment$UserAnswer;

  TRes call({
    String? id,
    DateTime? createdAt,
    dynamic? answers,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$UserAnswer<TRes>
    implements CopyWith$Fragment$UserAnswer<TRes> {
  _CopyWithImpl$Fragment$UserAnswer(
    this._instance,
    this._then,
  );

  final Fragment$UserAnswer _instance;

  final TRes Function(Fragment$UserAnswer) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? createdAt = _undefined,
    Object? answers = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$UserAnswer(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as DateTime),
        answers: answers == _undefined || answers == null
            ? _instance.answers
            : (answers as dynamic),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$UserAnswer<TRes>
    implements CopyWith$Fragment$UserAnswer<TRes> {
  _CopyWithStubImpl$Fragment$UserAnswer(this._res);

  TRes _res;

  call({
    String? id,
    DateTime? createdAt,
    dynamic? answers,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionUserAnswer = FragmentDefinitionNode(
  name: NameNode(value: 'UserAnswer'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'UserAnswer'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'id'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'answers'),
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
);
const documentNodeFragmentUserAnswer = DocumentNode(definitions: [
  fragmentDefinitionUserAnswer,
]);

extension ClientExtension$Fragment$UserAnswer on graphql.GraphQLClient {
  void writeFragment$UserAnswer({
    required Fragment$UserAnswer data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'UserAnswer',
            document: documentNodeFragmentUserAnswer,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$UserAnswer? readFragment$UserAnswer({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'UserAnswer',
          document: documentNodeFragmentUserAnswer,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$UserAnswer.fromJson(result);
  }
}

class Fragment$DetailedMaterial implements Fragment$Material {
  Fragment$DetailedMaterial({
    required this.id,
    required this.stage_ID,
    required this.part_ID,
    this.type,
    required this.genStatus,
    required this.compStatus,
    required this.convStatus,
    required this.feedbackStatus,
    required this.createdAt,
    this.completedAt,
    required this.unseenAiFeedbacks,
    this.details,
    this.$__typename = 'Material',
    this.answer,
    required this.aiFeedbacks,
    required this.turns,
  });

  factory Fragment$DetailedMaterial.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$stage_ID = json['stage_ID'];
    final l$part_ID = json['part_ID'];
    final l$type = json['type'];
    final l$genStatus = json['genStatus'];
    final l$compStatus = json['compStatus'];
    final l$convStatus = json['convStatus'];
    final l$feedbackStatus = json['feedbackStatus'];
    final l$createdAt = json['createdAt'];
    final l$completedAt = json['completedAt'];
    final l$unseenAiFeedbacks = json['unseenAiFeedbacks'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    final l$answer = json['answer'];
    final l$aiFeedbacks = json['aiFeedbacks'];
    final l$turns = json['turns'];
    return Fragment$DetailedMaterial(
      id: (l$id as String),
      stage_ID: (l$stage_ID as String),
      part_ID: (l$part_ID as String),
      type: l$type == null
          ? null
          : fromJson$Enum$MaterialType((l$type as String)),
      genStatus: fromJson$Enum$MaterialGenStatus((l$genStatus as String)),
      compStatus: fromJson$Enum$MaterialCompStatus((l$compStatus as String)),
      convStatus: fromJson$Enum$MaterialConvStatus((l$convStatus as String)),
      feedbackStatus:
          fromJson$Enum$MaterialFeedbackStatus((l$feedbackStatus as String)),
      createdAt: dateTimeFromJson(l$createdAt),
      completedAt:
          l$completedAt == null ? null : dateTimeFromJson(l$completedAt),
      unseenAiFeedbacks: (l$unseenAiFeedbacks as int),
      details: l$details == null
          ? null
          : Fragment$DetailedMaterial$details.fromJson(
              (l$details as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
      answer: l$answer == null
          ? null
          : Fragment$UserAnswer.fromJson((l$answer as Map<String, dynamic>)),
      aiFeedbacks: Fragment$DetailedMaterial$aiFeedbacks.fromJson(
          (l$aiFeedbacks as Map<String, dynamic>)),
      turns: Fragment$DetailedMaterial$turns.fromJson(
          (l$turns as Map<String, dynamic>)),
    );
  }

  final String id;

  final String stage_ID;

  final String part_ID;

  final Enum$MaterialType? type;

  final Enum$MaterialGenStatus genStatus;

  final Enum$MaterialCompStatus compStatus;

  final Enum$MaterialConvStatus convStatus;

  final Enum$MaterialFeedbackStatus feedbackStatus;

  final DateTime createdAt;

  final DateTime? completedAt;

  final int unseenAiFeedbacks;

  final Fragment$DetailedMaterial$details? details;

  final String $__typename;

  final Fragment$UserAnswer? answer;

  final Fragment$DetailedMaterial$aiFeedbacks aiFeedbacks;

  final Fragment$DetailedMaterial$turns turns;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$stage_ID = stage_ID;
    _resultData['stage_ID'] = l$stage_ID;
    final l$part_ID = part_ID;
    _resultData['part_ID'] = l$part_ID;
    final l$type = type;
    _resultData['type'] =
        l$type == null ? null : toJson$Enum$MaterialType(l$type);
    final l$genStatus = genStatus;
    _resultData['genStatus'] = toJson$Enum$MaterialGenStatus(l$genStatus);
    final l$compStatus = compStatus;
    _resultData['compStatus'] = toJson$Enum$MaterialCompStatus(l$compStatus);
    final l$convStatus = convStatus;
    _resultData['convStatus'] = toJson$Enum$MaterialConvStatus(l$convStatus);
    final l$feedbackStatus = feedbackStatus;
    _resultData['feedbackStatus'] =
        toJson$Enum$MaterialFeedbackStatus(l$feedbackStatus);
    final l$createdAt = createdAt;
    _resultData['createdAt'] = dateTimeToJson(l$createdAt);
    final l$completedAt = completedAt;
    _resultData['completedAt'] =
        l$completedAt == null ? null : dateTimeToJson(l$completedAt);
    final l$unseenAiFeedbacks = unseenAiFeedbacks;
    _resultData['unseenAiFeedbacks'] = l$unseenAiFeedbacks;
    final l$details = details;
    _resultData['details'] = l$details?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$answer = answer;
    _resultData['answer'] = l$answer?.toJson();
    final l$aiFeedbacks = aiFeedbacks;
    _resultData['aiFeedbacks'] = l$aiFeedbacks.toJson();
    final l$turns = turns;
    _resultData['turns'] = l$turns.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$stage_ID = stage_ID;
    final l$part_ID = part_ID;
    final l$type = type;
    final l$genStatus = genStatus;
    final l$compStatus = compStatus;
    final l$convStatus = convStatus;
    final l$feedbackStatus = feedbackStatus;
    final l$createdAt = createdAt;
    final l$completedAt = completedAt;
    final l$unseenAiFeedbacks = unseenAiFeedbacks;
    final l$details = details;
    final l$$__typename = $__typename;
    final l$answer = answer;
    final l$aiFeedbacks = aiFeedbacks;
    final l$turns = turns;
    return Object.hashAll([
      l$id,
      l$stage_ID,
      l$part_ID,
      l$type,
      l$genStatus,
      l$compStatus,
      l$convStatus,
      l$feedbackStatus,
      l$createdAt,
      l$completedAt,
      l$unseenAiFeedbacks,
      l$details,
      l$$__typename,
      l$answer,
      l$aiFeedbacks,
      l$turns,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$DetailedMaterial ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$stage_ID = stage_ID;
    final lOther$stage_ID = other.stage_ID;
    if (l$stage_ID != lOther$stage_ID) {
      return false;
    }
    final l$part_ID = part_ID;
    final lOther$part_ID = other.part_ID;
    if (l$part_ID != lOther$part_ID) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$genStatus = genStatus;
    final lOther$genStatus = other.genStatus;
    if (l$genStatus != lOther$genStatus) {
      return false;
    }
    final l$compStatus = compStatus;
    final lOther$compStatus = other.compStatus;
    if (l$compStatus != lOther$compStatus) {
      return false;
    }
    final l$convStatus = convStatus;
    final lOther$convStatus = other.convStatus;
    if (l$convStatus != lOther$convStatus) {
      return false;
    }
    final l$feedbackStatus = feedbackStatus;
    final lOther$feedbackStatus = other.feedbackStatus;
    if (l$feedbackStatus != lOther$feedbackStatus) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$completedAt = completedAt;
    final lOther$completedAt = other.completedAt;
    if (l$completedAt != lOther$completedAt) {
      return false;
    }
    final l$unseenAiFeedbacks = unseenAiFeedbacks;
    final lOther$unseenAiFeedbacks = other.unseenAiFeedbacks;
    if (l$unseenAiFeedbacks != lOther$unseenAiFeedbacks) {
      return false;
    }
    final l$details = details;
    final lOther$details = other.details;
    if (l$details != lOther$details) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$answer = answer;
    final lOther$answer = other.answer;
    if (l$answer != lOther$answer) {
      return false;
    }
    final l$aiFeedbacks = aiFeedbacks;
    final lOther$aiFeedbacks = other.aiFeedbacks;
    if (l$aiFeedbacks != lOther$aiFeedbacks) {
      return false;
    }
    final l$turns = turns;
    final lOther$turns = other.turns;
    if (l$turns != lOther$turns) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$DetailedMaterial
    on Fragment$DetailedMaterial {
  CopyWith$Fragment$DetailedMaterial<Fragment$DetailedMaterial> get copyWith =>
      CopyWith$Fragment$DetailedMaterial(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$DetailedMaterial<TRes> {
  factory CopyWith$Fragment$DetailedMaterial(
    Fragment$DetailedMaterial instance,
    TRes Function(Fragment$DetailedMaterial) then,
  ) = _CopyWithImpl$Fragment$DetailedMaterial;

  factory CopyWith$Fragment$DetailedMaterial.stub(TRes res) =
      _CopyWithStubImpl$Fragment$DetailedMaterial;

  TRes call({
    String? id,
    String? stage_ID,
    String? part_ID,
    Enum$MaterialType? type,
    Enum$MaterialGenStatus? genStatus,
    Enum$MaterialCompStatus? compStatus,
    Enum$MaterialConvStatus? convStatus,
    Enum$MaterialFeedbackStatus? feedbackStatus,
    DateTime? createdAt,
    DateTime? completedAt,
    int? unseenAiFeedbacks,
    Fragment$DetailedMaterial$details? details,
    String? $__typename,
    Fragment$UserAnswer? answer,
    Fragment$DetailedMaterial$aiFeedbacks? aiFeedbacks,
    Fragment$DetailedMaterial$turns? turns,
  });
  CopyWith$Fragment$DetailedMaterial$details<TRes> get details;
  CopyWith$Fragment$UserAnswer<TRes> get answer;
  CopyWith$Fragment$DetailedMaterial$aiFeedbacks<TRes> get aiFeedbacks;
  CopyWith$Fragment$DetailedMaterial$turns<TRes> get turns;
}

class _CopyWithImpl$Fragment$DetailedMaterial<TRes>
    implements CopyWith$Fragment$DetailedMaterial<TRes> {
  _CopyWithImpl$Fragment$DetailedMaterial(
    this._instance,
    this._then,
  );

  final Fragment$DetailedMaterial _instance;

  final TRes Function(Fragment$DetailedMaterial) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? stage_ID = _undefined,
    Object? part_ID = _undefined,
    Object? type = _undefined,
    Object? genStatus = _undefined,
    Object? compStatus = _undefined,
    Object? convStatus = _undefined,
    Object? feedbackStatus = _undefined,
    Object? createdAt = _undefined,
    Object? completedAt = _undefined,
    Object? unseenAiFeedbacks = _undefined,
    Object? details = _undefined,
    Object? $__typename = _undefined,
    Object? answer = _undefined,
    Object? aiFeedbacks = _undefined,
    Object? turns = _undefined,
  }) =>
      _then(Fragment$DetailedMaterial(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        stage_ID: stage_ID == _undefined || stage_ID == null
            ? _instance.stage_ID
            : (stage_ID as String),
        part_ID: part_ID == _undefined || part_ID == null
            ? _instance.part_ID
            : (part_ID as String),
        type:
            type == _undefined ? _instance.type : (type as Enum$MaterialType?),
        genStatus: genStatus == _undefined || genStatus == null
            ? _instance.genStatus
            : (genStatus as Enum$MaterialGenStatus),
        compStatus: compStatus == _undefined || compStatus == null
            ? _instance.compStatus
            : (compStatus as Enum$MaterialCompStatus),
        convStatus: convStatus == _undefined || convStatus == null
            ? _instance.convStatus
            : (convStatus as Enum$MaterialConvStatus),
        feedbackStatus: feedbackStatus == _undefined || feedbackStatus == null
            ? _instance.feedbackStatus
            : (feedbackStatus as Enum$MaterialFeedbackStatus),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as DateTime),
        completedAt: completedAt == _undefined
            ? _instance.completedAt
            : (completedAt as DateTime?),
        unseenAiFeedbacks:
            unseenAiFeedbacks == _undefined || unseenAiFeedbacks == null
                ? _instance.unseenAiFeedbacks
                : (unseenAiFeedbacks as int),
        details: details == _undefined
            ? _instance.details
            : (details as Fragment$DetailedMaterial$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        answer: answer == _undefined
            ? _instance.answer
            : (answer as Fragment$UserAnswer?),
        aiFeedbacks: aiFeedbacks == _undefined || aiFeedbacks == null
            ? _instance.aiFeedbacks
            : (aiFeedbacks as Fragment$DetailedMaterial$aiFeedbacks),
        turns: turns == _undefined || turns == null
            ? _instance.turns
            : (turns as Fragment$DetailedMaterial$turns),
      ));

  CopyWith$Fragment$DetailedMaterial$details<TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Fragment$DetailedMaterial$details.stub(_then(_instance))
        : CopyWith$Fragment$DetailedMaterial$details(
            local$details, (e) => call(details: e));
  }

  CopyWith$Fragment$UserAnswer<TRes> get answer {
    final local$answer = _instance.answer;
    return local$answer == null
        ? CopyWith$Fragment$UserAnswer.stub(_then(_instance))
        : CopyWith$Fragment$UserAnswer(local$answer, (e) => call(answer: e));
  }

  CopyWith$Fragment$DetailedMaterial$aiFeedbacks<TRes> get aiFeedbacks {
    final local$aiFeedbacks = _instance.aiFeedbacks;
    return CopyWith$Fragment$DetailedMaterial$aiFeedbacks(
        local$aiFeedbacks, (e) => call(aiFeedbacks: e));
  }

  CopyWith$Fragment$DetailedMaterial$turns<TRes> get turns {
    final local$turns = _instance.turns;
    return CopyWith$Fragment$DetailedMaterial$turns(
        local$turns, (e) => call(turns: e));
  }
}

class _CopyWithStubImpl$Fragment$DetailedMaterial<TRes>
    implements CopyWith$Fragment$DetailedMaterial<TRes> {
  _CopyWithStubImpl$Fragment$DetailedMaterial(this._res);

  TRes _res;

  call({
    String? id,
    String? stage_ID,
    String? part_ID,
    Enum$MaterialType? type,
    Enum$MaterialGenStatus? genStatus,
    Enum$MaterialCompStatus? compStatus,
    Enum$MaterialConvStatus? convStatus,
    Enum$MaterialFeedbackStatus? feedbackStatus,
    DateTime? createdAt,
    DateTime? completedAt,
    int? unseenAiFeedbacks,
    Fragment$DetailedMaterial$details? details,
    String? $__typename,
    Fragment$UserAnswer? answer,
    Fragment$DetailedMaterial$aiFeedbacks? aiFeedbacks,
    Fragment$DetailedMaterial$turns? turns,
  }) =>
      _res;

  CopyWith$Fragment$DetailedMaterial$details<TRes> get details =>
      CopyWith$Fragment$DetailedMaterial$details.stub(_res);

  CopyWith$Fragment$UserAnswer<TRes> get answer =>
      CopyWith$Fragment$UserAnswer.stub(_res);

  CopyWith$Fragment$DetailedMaterial$aiFeedbacks<TRes> get aiFeedbacks =>
      CopyWith$Fragment$DetailedMaterial$aiFeedbacks.stub(_res);

  CopyWith$Fragment$DetailedMaterial$turns<TRes> get turns =>
      CopyWith$Fragment$DetailedMaterial$turns.stub(_res);
}

const fragmentDefinitionDetailedMaterial = FragmentDefinitionNode(
  name: NameNode(value: 'DetailedMaterial'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'Material'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FragmentSpreadNode(
      name: NameNode(value: 'Material'),
      directives: [],
    ),
    FieldNode(
      name: NameNode(value: 'details'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FragmentSpreadNode(
          name: NameNode(value: 'MaterialDetails'),
          directives: [],
        )
      ]),
    ),
    FieldNode(
      name: NameNode(value: 'answer'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FragmentSpreadNode(
          name: NameNode(value: 'UserAnswer'),
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
      name: NameNode(value: 'aiFeedbacks'),
      alias: null,
      arguments: [
        ArgumentNode(
          name: NameNode(value: 'pagination'),
          value: ObjectValueNode(fields: [
            ObjectFieldNode(
              name: NameNode(value: 'limit'),
              value: IntValueNode(value: '1000'),
            )
          ]),
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
      name: NameNode(value: 'turns'),
      alias: null,
      arguments: [
        ArgumentNode(
          name: NameNode(value: 'pagination'),
          value: ObjectValueNode(fields: [
            ObjectFieldNode(
              name: NameNode(value: 'limit'),
              value: IntValueNode(value: '1000'),
            )
          ]),
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
);
const documentNodeFragmentDetailedMaterial = DocumentNode(definitions: [
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

extension ClientExtension$Fragment$DetailedMaterial on graphql.GraphQLClient {
  void writeFragment$DetailedMaterial({
    required Fragment$DetailedMaterial data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'DetailedMaterial',
            document: documentNodeFragmentDetailedMaterial,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$DetailedMaterial? readFragment$DetailedMaterial({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'DetailedMaterial',
          document: documentNodeFragmentDetailedMaterial,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$DetailedMaterial.fromJson(result);
  }
}

class Fragment$DetailedMaterial$details
    implements Fragment$MiniDetails, Fragment$MaterialDetails {
  Fragment$DetailedMaterial$details({
    required this.type,
    required this.title,
    required this.description,
    required this.$__typename,
  });

  factory Fragment$DetailedMaterial$details.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "StoryDetails":
        return Fragment$DetailedMaterial$details$$StoryDetails.fromJson(json);

      case "QuizDetails":
        return Fragment$DetailedMaterial$details$$QuizDetails.fromJson(json);

      case "ConversationDetails":
        return Fragment$DetailedMaterial$details$$ConversationDetails.fromJson(
            json);

      default:
        final l$type = json['type'];
        final l$title = json['title'];
        final l$description = json['description'];
        final l$$__typename = json['__typename'];
        return Fragment$DetailedMaterial$details(
          type: fromJson$Enum$MaterialType((l$type as String)),
          title: (l$title as String),
          description: (l$description as String),
          $__typename: (l$$__typename as String),
        );
    }
  }

  final Enum$MaterialType type;

  final String title;

  final String description;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$type = type;
    _resultData['type'] = toJson$Enum$MaterialType(l$type);
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$type = type;
    final l$title = title;
    final l$description = description;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$type,
      l$title,
      l$description,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$DetailedMaterial$details ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
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

extension UtilityExtension$Fragment$DetailedMaterial$details
    on Fragment$DetailedMaterial$details {
  CopyWith$Fragment$DetailedMaterial$details<Fragment$DetailedMaterial$details>
      get copyWith => CopyWith$Fragment$DetailedMaterial$details(
            this,
            (i) => i,
          );
  _T when<_T>({
    required _T Function(Fragment$DetailedMaterial$details$$StoryDetails)
        storyDetails,
    required _T Function(Fragment$DetailedMaterial$details$$QuizDetails)
        quizDetails,
    required _T Function(Fragment$DetailedMaterial$details$$ConversationDetails)
        conversationDetails,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "StoryDetails":
        return storyDetails(
            this as Fragment$DetailedMaterial$details$$StoryDetails);

      case "QuizDetails":
        return quizDetails(
            this as Fragment$DetailedMaterial$details$$QuizDetails);

      case "ConversationDetails":
        return conversationDetails(
            this as Fragment$DetailedMaterial$details$$ConversationDetails);

      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(Fragment$DetailedMaterial$details$$StoryDetails)? storyDetails,
    _T Function(Fragment$DetailedMaterial$details$$QuizDetails)? quizDetails,
    _T Function(Fragment$DetailedMaterial$details$$ConversationDetails)?
        conversationDetails,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "StoryDetails":
        if (storyDetails != null) {
          return storyDetails(
              this as Fragment$DetailedMaterial$details$$StoryDetails);
        } else {
          return orElse();
        }

      case "QuizDetails":
        if (quizDetails != null) {
          return quizDetails(
              this as Fragment$DetailedMaterial$details$$QuizDetails);
        } else {
          return orElse();
        }

      case "ConversationDetails":
        if (conversationDetails != null) {
          return conversationDetails(
              this as Fragment$DetailedMaterial$details$$ConversationDetails);
        } else {
          return orElse();
        }

      default:
        return orElse();
    }
  }
}

abstract class CopyWith$Fragment$DetailedMaterial$details<TRes> {
  factory CopyWith$Fragment$DetailedMaterial$details(
    Fragment$DetailedMaterial$details instance,
    TRes Function(Fragment$DetailedMaterial$details) then,
  ) = _CopyWithImpl$Fragment$DetailedMaterial$details;

  factory CopyWith$Fragment$DetailedMaterial$details.stub(TRes res) =
      _CopyWithStubImpl$Fragment$DetailedMaterial$details;

  TRes call({
    Enum$MaterialType? type,
    String? title,
    String? description,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$DetailedMaterial$details<TRes>
    implements CopyWith$Fragment$DetailedMaterial$details<TRes> {
  _CopyWithImpl$Fragment$DetailedMaterial$details(
    this._instance,
    this._then,
  );

  final Fragment$DetailedMaterial$details _instance;

  final TRes Function(Fragment$DetailedMaterial$details) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? type = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$DetailedMaterial$details(
        type: type == _undefined || type == null
            ? _instance.type
            : (type as Enum$MaterialType),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        description: description == _undefined || description == null
            ? _instance.description
            : (description as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$DetailedMaterial$details<TRes>
    implements CopyWith$Fragment$DetailedMaterial$details<TRes> {
  _CopyWithStubImpl$Fragment$DetailedMaterial$details(this._res);

  TRes _res;

  call({
    Enum$MaterialType? type,
    String? title,
    String? description,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$DetailedMaterial$details$$StoryDetails
    implements
        Fragment$MiniDetails$$StoryDetails,
        Fragment$MaterialDetails$$StoryDetails,
        Fragment$StoryDetails,
        Fragment$DetailedMaterial$details {
  Fragment$DetailedMaterial$details$$StoryDetails({
    required this.type,
    required this.title,
    required this.description,
    this.$__typename = 'StoryDetails',
    required this.parts,
  });

  factory Fragment$DetailedMaterial$details$$StoryDetails.fromJson(
      Map<String, dynamic> json) {
    final l$type = json['type'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$$__typename = json['__typename'];
    final l$parts = json['parts'];
    return Fragment$DetailedMaterial$details$$StoryDetails(
      type: fromJson$Enum$MaterialType((l$type as String)),
      title: (l$title as String),
      description: (l$description as String),
      $__typename: (l$$__typename as String),
      parts: (l$parts as List<dynamic>)
          .map((e) => Fragment$StoryPart.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  final Enum$MaterialType type;

  final String title;

  final String description;

  final String $__typename;

  final List<Fragment$StoryPart> parts;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$type = type;
    _resultData['type'] = toJson$Enum$MaterialType(l$type);
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$parts = parts;
    _resultData['parts'] = l$parts.map((e) => e.toJson()).toList();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$type = type;
    final l$title = title;
    final l$description = description;
    final l$$__typename = $__typename;
    final l$parts = parts;
    return Object.hashAll([
      l$type,
      l$title,
      l$description,
      l$$__typename,
      Object.hashAll(l$parts.map((v) => v)),
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$DetailedMaterial$details$$StoryDetails ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$parts = parts;
    final lOther$parts = other.parts;
    if (l$parts.length != lOther$parts.length) {
      return false;
    }
    for (int i = 0; i < l$parts.length; i++) {
      final l$parts$entry = l$parts[i];
      final lOther$parts$entry = lOther$parts[i];
      if (l$parts$entry != lOther$parts$entry) {
        return false;
      }
    }
    return true;
  }
}

extension UtilityExtension$Fragment$DetailedMaterial$details$$StoryDetails
    on Fragment$DetailedMaterial$details$$StoryDetails {
  CopyWith$Fragment$DetailedMaterial$details$$StoryDetails<
          Fragment$DetailedMaterial$details$$StoryDetails>
      get copyWith => CopyWith$Fragment$DetailedMaterial$details$$StoryDetails(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$DetailedMaterial$details$$StoryDetails<TRes> {
  factory CopyWith$Fragment$DetailedMaterial$details$$StoryDetails(
    Fragment$DetailedMaterial$details$$StoryDetails instance,
    TRes Function(Fragment$DetailedMaterial$details$$StoryDetails) then,
  ) = _CopyWithImpl$Fragment$DetailedMaterial$details$$StoryDetails;

  factory CopyWith$Fragment$DetailedMaterial$details$$StoryDetails.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$DetailedMaterial$details$$StoryDetails;

  TRes call({
    Enum$MaterialType? type,
    String? title,
    String? description,
    String? $__typename,
    List<Fragment$StoryPart>? parts,
  });
  TRes parts(
      Iterable<Fragment$StoryPart> Function(
              Iterable<CopyWith$Fragment$StoryPart<Fragment$StoryPart>>)
          _fn);
}

class _CopyWithImpl$Fragment$DetailedMaterial$details$$StoryDetails<TRes>
    implements CopyWith$Fragment$DetailedMaterial$details$$StoryDetails<TRes> {
  _CopyWithImpl$Fragment$DetailedMaterial$details$$StoryDetails(
    this._instance,
    this._then,
  );

  final Fragment$DetailedMaterial$details$$StoryDetails _instance;

  final TRes Function(Fragment$DetailedMaterial$details$$StoryDetails) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? type = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? $__typename = _undefined,
    Object? parts = _undefined,
  }) =>
      _then(Fragment$DetailedMaterial$details$$StoryDetails(
        type: type == _undefined || type == null
            ? _instance.type
            : (type as Enum$MaterialType),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        description: description == _undefined || description == null
            ? _instance.description
            : (description as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        parts: parts == _undefined || parts == null
            ? _instance.parts
            : (parts as List<Fragment$StoryPart>),
      ));

  TRes parts(
          Iterable<Fragment$StoryPart> Function(
                  Iterable<CopyWith$Fragment$StoryPart<Fragment$StoryPart>>)
              _fn) =>
      call(
          parts: _fn(_instance.parts.map((e) => CopyWith$Fragment$StoryPart(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Fragment$DetailedMaterial$details$$StoryDetails<TRes>
    implements CopyWith$Fragment$DetailedMaterial$details$$StoryDetails<TRes> {
  _CopyWithStubImpl$Fragment$DetailedMaterial$details$$StoryDetails(this._res);

  TRes _res;

  call({
    Enum$MaterialType? type,
    String? title,
    String? description,
    String? $__typename,
    List<Fragment$StoryPart>? parts,
  }) =>
      _res;

  parts(_fn) => _res;
}

class Fragment$DetailedMaterial$details$$QuizDetails
    implements
        Fragment$MiniDetails$$QuizDetails,
        Fragment$MaterialDetails$$QuizDetails,
        Fragment$QuizDetails,
        Fragment$DetailedMaterial$details {
  Fragment$DetailedMaterial$details$$QuizDetails({
    required this.type,
    required this.title,
    required this.description,
    this.$__typename = 'QuizDetails',
    this.preludes,
    required this.questions,
  });

  factory Fragment$DetailedMaterial$details$$QuizDetails.fromJson(
      Map<String, dynamic> json) {
    final l$type = json['type'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$$__typename = json['__typename'];
    final l$preludes = json['preludes'];
    final l$questions = json['questions'];
    return Fragment$DetailedMaterial$details$$QuizDetails(
      type: fromJson$Enum$MaterialType((l$type as String)),
      title: (l$title as String),
      description: (l$description as String),
      $__typename: (l$$__typename as String),
      preludes: (l$preludes as List<dynamic>?)
          ?.map(
              (e) => Fragment$QuizPrelude.fromJson((e as Map<String, dynamic>)))
          .toList(),
      questions: (l$questions as List<dynamic>)
          .map((e) =>
              Fragment$QuizQuestion.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  final Enum$MaterialType type;

  final String title;

  final String description;

  final String $__typename;

  final List<Fragment$QuizPrelude>? preludes;

  final List<Fragment$QuizQuestion> questions;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$type = type;
    _resultData['type'] = toJson$Enum$MaterialType(l$type);
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$preludes = preludes;
    _resultData['preludes'] = l$preludes?.map((e) => e.toJson()).toList();
    final l$questions = questions;
    _resultData['questions'] = l$questions.map((e) => e.toJson()).toList();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$type = type;
    final l$title = title;
    final l$description = description;
    final l$$__typename = $__typename;
    final l$preludes = preludes;
    final l$questions = questions;
    return Object.hashAll([
      l$type,
      l$title,
      l$description,
      l$$__typename,
      l$preludes == null ? null : Object.hashAll(l$preludes.map((v) => v)),
      Object.hashAll(l$questions.map((v) => v)),
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$DetailedMaterial$details$$QuizDetails ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$preludes = preludes;
    final lOther$preludes = other.preludes;
    if (l$preludes != null && lOther$preludes != null) {
      if (l$preludes.length != lOther$preludes.length) {
        return false;
      }
      for (int i = 0; i < l$preludes.length; i++) {
        final l$preludes$entry = l$preludes[i];
        final lOther$preludes$entry = lOther$preludes[i];
        if (l$preludes$entry != lOther$preludes$entry) {
          return false;
        }
      }
    } else if (l$preludes != lOther$preludes) {
      return false;
    }
    final l$questions = questions;
    final lOther$questions = other.questions;
    if (l$questions.length != lOther$questions.length) {
      return false;
    }
    for (int i = 0; i < l$questions.length; i++) {
      final l$questions$entry = l$questions[i];
      final lOther$questions$entry = lOther$questions[i];
      if (l$questions$entry != lOther$questions$entry) {
        return false;
      }
    }
    return true;
  }
}

extension UtilityExtension$Fragment$DetailedMaterial$details$$QuizDetails
    on Fragment$DetailedMaterial$details$$QuizDetails {
  CopyWith$Fragment$DetailedMaterial$details$$QuizDetails<
          Fragment$DetailedMaterial$details$$QuizDetails>
      get copyWith => CopyWith$Fragment$DetailedMaterial$details$$QuizDetails(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$DetailedMaterial$details$$QuizDetails<TRes> {
  factory CopyWith$Fragment$DetailedMaterial$details$$QuizDetails(
    Fragment$DetailedMaterial$details$$QuizDetails instance,
    TRes Function(Fragment$DetailedMaterial$details$$QuizDetails) then,
  ) = _CopyWithImpl$Fragment$DetailedMaterial$details$$QuizDetails;

  factory CopyWith$Fragment$DetailedMaterial$details$$QuizDetails.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$DetailedMaterial$details$$QuizDetails;

  TRes call({
    Enum$MaterialType? type,
    String? title,
    String? description,
    String? $__typename,
    List<Fragment$QuizPrelude>? preludes,
    List<Fragment$QuizQuestion>? questions,
  });
  TRes preludes(
      Iterable<Fragment$QuizPrelude>? Function(
              Iterable<CopyWith$Fragment$QuizPrelude<Fragment$QuizPrelude>>?)
          _fn);
  TRes questions(
      Iterable<Fragment$QuizQuestion> Function(
              Iterable<CopyWith$Fragment$QuizQuestion<Fragment$QuizQuestion>>)
          _fn);
}

class _CopyWithImpl$Fragment$DetailedMaterial$details$$QuizDetails<TRes>
    implements CopyWith$Fragment$DetailedMaterial$details$$QuizDetails<TRes> {
  _CopyWithImpl$Fragment$DetailedMaterial$details$$QuizDetails(
    this._instance,
    this._then,
  );

  final Fragment$DetailedMaterial$details$$QuizDetails _instance;

  final TRes Function(Fragment$DetailedMaterial$details$$QuizDetails) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? type = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? $__typename = _undefined,
    Object? preludes = _undefined,
    Object? questions = _undefined,
  }) =>
      _then(Fragment$DetailedMaterial$details$$QuizDetails(
        type: type == _undefined || type == null
            ? _instance.type
            : (type as Enum$MaterialType),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        description: description == _undefined || description == null
            ? _instance.description
            : (description as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        preludes: preludes == _undefined
            ? _instance.preludes
            : (preludes as List<Fragment$QuizPrelude>?),
        questions: questions == _undefined || questions == null
            ? _instance.questions
            : (questions as List<Fragment$QuizQuestion>),
      ));

  TRes preludes(
          Iterable<Fragment$QuizPrelude>? Function(
                  Iterable<
                      CopyWith$Fragment$QuizPrelude<Fragment$QuizPrelude>>?)
              _fn) =>
      call(
          preludes:
              _fn(_instance.preludes?.map((e) => CopyWith$Fragment$QuizPrelude(
                    e,
                    (i) => i,
                  )))?.toList());

  TRes questions(
          Iterable<Fragment$QuizQuestion> Function(
                  Iterable<
                      CopyWith$Fragment$QuizQuestion<Fragment$QuizQuestion>>)
              _fn) =>
      call(
          questions:
              _fn(_instance.questions.map((e) => CopyWith$Fragment$QuizQuestion(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Fragment$DetailedMaterial$details$$QuizDetails<TRes>
    implements CopyWith$Fragment$DetailedMaterial$details$$QuizDetails<TRes> {
  _CopyWithStubImpl$Fragment$DetailedMaterial$details$$QuizDetails(this._res);

  TRes _res;

  call({
    Enum$MaterialType? type,
    String? title,
    String? description,
    String? $__typename,
    List<Fragment$QuizPrelude>? preludes,
    List<Fragment$QuizQuestion>? questions,
  }) =>
      _res;

  preludes(_fn) => _res;

  questions(_fn) => _res;
}

class Fragment$DetailedMaterial$details$$ConversationDetails
    implements
        Fragment$MiniDetails$$ConversationDetails,
        Fragment$MaterialDetails$$ConversationDetails,
        Fragment$ConversationDetails,
        Fragment$DetailedMaterial$details {
  Fragment$DetailedMaterial$details$$ConversationDetails({
    required this.type,
    required this.title,
    required this.description,
    this.$__typename = 'ConversationDetails',
    required this.instructions,
    required this.characters,
  });

  factory Fragment$DetailedMaterial$details$$ConversationDetails.fromJson(
      Map<String, dynamic> json) {
    final l$type = json['type'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$$__typename = json['__typename'];
    final l$instructions = json['instructions'];
    final l$characters = json['characters'];
    return Fragment$DetailedMaterial$details$$ConversationDetails(
      type: fromJson$Enum$MaterialType((l$type as String)),
      title: (l$title as String),
      description: (l$description as String),
      $__typename: (l$$__typename as String),
      instructions: linguisticUnitSetFromJson(l$instructions),
      characters: (l$characters as List<dynamic>)
          .map((e) => Fragment$ConversationCharacter.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
    );
  }

  final Enum$MaterialType type;

  final String title;

  final String description;

  final String $__typename;

  final LinguisticUnitSet instructions;

  final List<Fragment$ConversationCharacter> characters;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$type = type;
    _resultData['type'] = toJson$Enum$MaterialType(l$type);
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$instructions = instructions;
    _resultData['instructions'] = linguisticUnitSetToJson(l$instructions);
    final l$characters = characters;
    _resultData['characters'] = l$characters.map((e) => e.toJson()).toList();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$type = type;
    final l$title = title;
    final l$description = description;
    final l$$__typename = $__typename;
    final l$instructions = instructions;
    final l$characters = characters;
    return Object.hashAll([
      l$type,
      l$title,
      l$description,
      l$$__typename,
      l$instructions,
      Object.hashAll(l$characters.map((v) => v)),
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$DetailedMaterial$details$$ConversationDetails ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$instructions = instructions;
    final lOther$instructions = other.instructions;
    if (l$instructions != lOther$instructions) {
      return false;
    }
    final l$characters = characters;
    final lOther$characters = other.characters;
    if (l$characters.length != lOther$characters.length) {
      return false;
    }
    for (int i = 0; i < l$characters.length; i++) {
      final l$characters$entry = l$characters[i];
      final lOther$characters$entry = lOther$characters[i];
      if (l$characters$entry != lOther$characters$entry) {
        return false;
      }
    }
    return true;
  }
}

extension UtilityExtension$Fragment$DetailedMaterial$details$$ConversationDetails
    on Fragment$DetailedMaterial$details$$ConversationDetails {
  CopyWith$Fragment$DetailedMaterial$details$$ConversationDetails<
          Fragment$DetailedMaterial$details$$ConversationDetails>
      get copyWith =>
          CopyWith$Fragment$DetailedMaterial$details$$ConversationDetails(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$DetailedMaterial$details$$ConversationDetails<
    TRes> {
  factory CopyWith$Fragment$DetailedMaterial$details$$ConversationDetails(
    Fragment$DetailedMaterial$details$$ConversationDetails instance,
    TRes Function(Fragment$DetailedMaterial$details$$ConversationDetails) then,
  ) = _CopyWithImpl$Fragment$DetailedMaterial$details$$ConversationDetails;

  factory CopyWith$Fragment$DetailedMaterial$details$$ConversationDetails.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$DetailedMaterial$details$$ConversationDetails;

  TRes call({
    Enum$MaterialType? type,
    String? title,
    String? description,
    String? $__typename,
    LinguisticUnitSet? instructions,
    List<Fragment$ConversationCharacter>? characters,
  });
  TRes characters(
      Iterable<Fragment$ConversationCharacter> Function(
              Iterable<
                  CopyWith$Fragment$ConversationCharacter<
                      Fragment$ConversationCharacter>>)
          _fn);
}

class _CopyWithImpl$Fragment$DetailedMaterial$details$$ConversationDetails<TRes>
    implements
        CopyWith$Fragment$DetailedMaterial$details$$ConversationDetails<TRes> {
  _CopyWithImpl$Fragment$DetailedMaterial$details$$ConversationDetails(
    this._instance,
    this._then,
  );

  final Fragment$DetailedMaterial$details$$ConversationDetails _instance;

  final TRes Function(Fragment$DetailedMaterial$details$$ConversationDetails)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? type = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? $__typename = _undefined,
    Object? instructions = _undefined,
    Object? characters = _undefined,
  }) =>
      _then(Fragment$DetailedMaterial$details$$ConversationDetails(
        type: type == _undefined || type == null
            ? _instance.type
            : (type as Enum$MaterialType),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        description: description == _undefined || description == null
            ? _instance.description
            : (description as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        instructions: instructions == _undefined || instructions == null
            ? _instance.instructions
            : (instructions as LinguisticUnitSet),
        characters: characters == _undefined || characters == null
            ? _instance.characters
            : (characters as List<Fragment$ConversationCharacter>),
      ));

  TRes characters(
          Iterable<Fragment$ConversationCharacter> Function(
                  Iterable<
                      CopyWith$Fragment$ConversationCharacter<
                          Fragment$ConversationCharacter>>)
              _fn) =>
      call(
          characters: _fn(_instance.characters
              .map((e) => CopyWith$Fragment$ConversationCharacter(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Fragment$DetailedMaterial$details$$ConversationDetails<
        TRes>
    implements
        CopyWith$Fragment$DetailedMaterial$details$$ConversationDetails<TRes> {
  _CopyWithStubImpl$Fragment$DetailedMaterial$details$$ConversationDetails(
      this._res);

  TRes _res;

  call({
    Enum$MaterialType? type,
    String? title,
    String? description,
    String? $__typename,
    LinguisticUnitSet? instructions,
    List<Fragment$ConversationCharacter>? characters,
  }) =>
      _res;

  characters(_fn) => _res;
}

class Fragment$DetailedMaterial$aiFeedbacks {
  Fragment$DetailedMaterial$aiFeedbacks({
    required this.items,
    this.$__typename = 'AIFeedbackConnection',
  });

  factory Fragment$DetailedMaterial$aiFeedbacks.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Fragment$DetailedMaterial$aiFeedbacks(
      items: (l$items as List<dynamic>)
          .map((e) => Fragment$AIFeedback.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$AIFeedback> items;

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
    if (other is! Fragment$DetailedMaterial$aiFeedbacks ||
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

extension UtilityExtension$Fragment$DetailedMaterial$aiFeedbacks
    on Fragment$DetailedMaterial$aiFeedbacks {
  CopyWith$Fragment$DetailedMaterial$aiFeedbacks<
          Fragment$DetailedMaterial$aiFeedbacks>
      get copyWith => CopyWith$Fragment$DetailedMaterial$aiFeedbacks(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$DetailedMaterial$aiFeedbacks<TRes> {
  factory CopyWith$Fragment$DetailedMaterial$aiFeedbacks(
    Fragment$DetailedMaterial$aiFeedbacks instance,
    TRes Function(Fragment$DetailedMaterial$aiFeedbacks) then,
  ) = _CopyWithImpl$Fragment$DetailedMaterial$aiFeedbacks;

  factory CopyWith$Fragment$DetailedMaterial$aiFeedbacks.stub(TRes res) =
      _CopyWithStubImpl$Fragment$DetailedMaterial$aiFeedbacks;

  TRes call({
    List<Fragment$AIFeedback>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$AIFeedback> Function(
              Iterable<CopyWith$Fragment$AIFeedback<Fragment$AIFeedback>>)
          _fn);
}

class _CopyWithImpl$Fragment$DetailedMaterial$aiFeedbacks<TRes>
    implements CopyWith$Fragment$DetailedMaterial$aiFeedbacks<TRes> {
  _CopyWithImpl$Fragment$DetailedMaterial$aiFeedbacks(
    this._instance,
    this._then,
  );

  final Fragment$DetailedMaterial$aiFeedbacks _instance;

  final TRes Function(Fragment$DetailedMaterial$aiFeedbacks) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$DetailedMaterial$aiFeedbacks(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$AIFeedback>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes items(
          Iterable<Fragment$AIFeedback> Function(
                  Iterable<CopyWith$Fragment$AIFeedback<Fragment$AIFeedback>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) => CopyWith$Fragment$AIFeedback(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Fragment$DetailedMaterial$aiFeedbacks<TRes>
    implements CopyWith$Fragment$DetailedMaterial$aiFeedbacks<TRes> {
  _CopyWithStubImpl$Fragment$DetailedMaterial$aiFeedbacks(this._res);

  TRes _res;

  call({
    List<Fragment$AIFeedback>? items,
    String? $__typename,
  }) =>
      _res;

  items(_fn) => _res;
}

class Fragment$DetailedMaterial$turns {
  Fragment$DetailedMaterial$turns({
    required this.items,
    this.$__typename = 'ConversationTurnConnection',
  });

  factory Fragment$DetailedMaterial$turns.fromJson(Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Fragment$DetailedMaterial$turns(
      items: (l$items as List<dynamic>)
          .map((e) =>
              Fragment$ConversationTurn.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$ConversationTurn> items;

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
    if (other is! Fragment$DetailedMaterial$turns ||
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

extension UtilityExtension$Fragment$DetailedMaterial$turns
    on Fragment$DetailedMaterial$turns {
  CopyWith$Fragment$DetailedMaterial$turns<Fragment$DetailedMaterial$turns>
      get copyWith => CopyWith$Fragment$DetailedMaterial$turns(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$DetailedMaterial$turns<TRes> {
  factory CopyWith$Fragment$DetailedMaterial$turns(
    Fragment$DetailedMaterial$turns instance,
    TRes Function(Fragment$DetailedMaterial$turns) then,
  ) = _CopyWithImpl$Fragment$DetailedMaterial$turns;

  factory CopyWith$Fragment$DetailedMaterial$turns.stub(TRes res) =
      _CopyWithStubImpl$Fragment$DetailedMaterial$turns;

  TRes call({
    List<Fragment$ConversationTurn>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$ConversationTurn> Function(
              Iterable<
                  CopyWith$Fragment$ConversationTurn<
                      Fragment$ConversationTurn>>)
          _fn);
}

class _CopyWithImpl$Fragment$DetailedMaterial$turns<TRes>
    implements CopyWith$Fragment$DetailedMaterial$turns<TRes> {
  _CopyWithImpl$Fragment$DetailedMaterial$turns(
    this._instance,
    this._then,
  );

  final Fragment$DetailedMaterial$turns _instance;

  final TRes Function(Fragment$DetailedMaterial$turns) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$DetailedMaterial$turns(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$ConversationTurn>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes items(
          Iterable<Fragment$ConversationTurn> Function(
                  Iterable<
                      CopyWith$Fragment$ConversationTurn<
                          Fragment$ConversationTurn>>)
              _fn) =>
      call(
          items:
              _fn(_instance.items.map((e) => CopyWith$Fragment$ConversationTurn(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Fragment$DetailedMaterial$turns<TRes>
    implements CopyWith$Fragment$DetailedMaterial$turns<TRes> {
  _CopyWithStubImpl$Fragment$DetailedMaterial$turns(this._res);

  TRes _res;

  call({
    List<Fragment$ConversationTurn>? items,
    String? $__typename,
  }) =>
      _res;

  items(_fn) => _res;
}

class Fragment$StoryPart {
  Fragment$StoryPart({
    required this.type,
    this.ssml,
    required this.hasPicture,
    this.question,
    this.audioId,
    this.pictureId,
    this.$__typename = 'StoryPart',
  });

  factory Fragment$StoryPart.fromJson(Map<String, dynamic> json) {
    final l$type = json['type'];
    final l$ssml = json['ssml'];
    final l$hasPicture = json['hasPicture'];
    final l$question = json['question'];
    final l$audioId = json['audioId'];
    final l$pictureId = json['pictureId'];
    final l$$__typename = json['__typename'];
    return Fragment$StoryPart(
      type: fromJson$Enum$StoryPartType((l$type as String)),
      ssml: (l$ssml as String?),
      hasPicture: (l$hasPicture as bool),
      question: l$question == null
          ? null
          : Fragment$QuizQuestion.fromJson(
              (l$question as Map<String, dynamic>)),
      audioId: (l$audioId as String?),
      pictureId: (l$pictureId as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final Enum$StoryPartType type;

  final String? ssml;

  final bool hasPicture;

  final Fragment$QuizQuestion? question;

  final String? audioId;

  final String? pictureId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$type = type;
    _resultData['type'] = toJson$Enum$StoryPartType(l$type);
    final l$ssml = ssml;
    _resultData['ssml'] = l$ssml;
    final l$hasPicture = hasPicture;
    _resultData['hasPicture'] = l$hasPicture;
    final l$question = question;
    _resultData['question'] = l$question?.toJson();
    final l$audioId = audioId;
    _resultData['audioId'] = l$audioId;
    final l$pictureId = pictureId;
    _resultData['pictureId'] = l$pictureId;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$type = type;
    final l$ssml = ssml;
    final l$hasPicture = hasPicture;
    final l$question = question;
    final l$audioId = audioId;
    final l$pictureId = pictureId;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$type,
      l$ssml,
      l$hasPicture,
      l$question,
      l$audioId,
      l$pictureId,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$StoryPart || runtimeType != other.runtimeType) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$ssml = ssml;
    final lOther$ssml = other.ssml;
    if (l$ssml != lOther$ssml) {
      return false;
    }
    final l$hasPicture = hasPicture;
    final lOther$hasPicture = other.hasPicture;
    if (l$hasPicture != lOther$hasPicture) {
      return false;
    }
    final l$question = question;
    final lOther$question = other.question;
    if (l$question != lOther$question) {
      return false;
    }
    final l$audioId = audioId;
    final lOther$audioId = other.audioId;
    if (l$audioId != lOther$audioId) {
      return false;
    }
    final l$pictureId = pictureId;
    final lOther$pictureId = other.pictureId;
    if (l$pictureId != lOther$pictureId) {
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

extension UtilityExtension$Fragment$StoryPart on Fragment$StoryPart {
  CopyWith$Fragment$StoryPart<Fragment$StoryPart> get copyWith =>
      CopyWith$Fragment$StoryPart(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$StoryPart<TRes> {
  factory CopyWith$Fragment$StoryPart(
    Fragment$StoryPart instance,
    TRes Function(Fragment$StoryPart) then,
  ) = _CopyWithImpl$Fragment$StoryPart;

  factory CopyWith$Fragment$StoryPart.stub(TRes res) =
      _CopyWithStubImpl$Fragment$StoryPart;

  TRes call({
    Enum$StoryPartType? type,
    String? ssml,
    bool? hasPicture,
    Fragment$QuizQuestion? question,
    String? audioId,
    String? pictureId,
    String? $__typename,
  });
  CopyWith$Fragment$QuizQuestion<TRes> get question;
}

class _CopyWithImpl$Fragment$StoryPart<TRes>
    implements CopyWith$Fragment$StoryPart<TRes> {
  _CopyWithImpl$Fragment$StoryPart(
    this._instance,
    this._then,
  );

  final Fragment$StoryPart _instance;

  final TRes Function(Fragment$StoryPart) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? type = _undefined,
    Object? ssml = _undefined,
    Object? hasPicture = _undefined,
    Object? question = _undefined,
    Object? audioId = _undefined,
    Object? pictureId = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$StoryPart(
        type: type == _undefined || type == null
            ? _instance.type
            : (type as Enum$StoryPartType),
        ssml: ssml == _undefined ? _instance.ssml : (ssml as String?),
        hasPicture: hasPicture == _undefined || hasPicture == null
            ? _instance.hasPicture
            : (hasPicture as bool),
        question: question == _undefined
            ? _instance.question
            : (question as Fragment$QuizQuestion?),
        audioId:
            audioId == _undefined ? _instance.audioId : (audioId as String?),
        pictureId: pictureId == _undefined
            ? _instance.pictureId
            : (pictureId as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$QuizQuestion<TRes> get question {
    final local$question = _instance.question;
    return local$question == null
        ? CopyWith$Fragment$QuizQuestion.stub(_then(_instance))
        : CopyWith$Fragment$QuizQuestion(
            local$question, (e) => call(question: e));
  }
}

class _CopyWithStubImpl$Fragment$StoryPart<TRes>
    implements CopyWith$Fragment$StoryPart<TRes> {
  _CopyWithStubImpl$Fragment$StoryPart(this._res);

  TRes _res;

  call({
    Enum$StoryPartType? type,
    String? ssml,
    bool? hasPicture,
    Fragment$QuizQuestion? question,
    String? audioId,
    String? pictureId,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$QuizQuestion<TRes> get question =>
      CopyWith$Fragment$QuizQuestion.stub(_res);
}

const fragmentDefinitionStoryPart = FragmentDefinitionNode(
  name: NameNode(value: 'StoryPart'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'StoryPart'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'type'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'ssml'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'hasPicture'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'question'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FragmentSpreadNode(
          name: NameNode(value: 'QuizQuestion'),
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
      name: NameNode(value: 'audioId'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'pictureId'),
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
);
const documentNodeFragmentStoryPart = DocumentNode(definitions: [
  fragmentDefinitionStoryPart,
  fragmentDefinitionQuizQuestion,
  fragmentDefinitionQuestionItem,
]);

extension ClientExtension$Fragment$StoryPart on graphql.GraphQLClient {
  void writeFragment$StoryPart({
    required Fragment$StoryPart data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'StoryPart',
            document: documentNodeFragmentStoryPart,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$StoryPart? readFragment$StoryPart({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'StoryPart',
          document: documentNodeFragmentStoryPart,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$StoryPart.fromJson(result);
  }
}

class Fragment$StoryDetails {
  Fragment$StoryDetails({
    required this.parts,
    this.$__typename = 'StoryDetails',
  });

  factory Fragment$StoryDetails.fromJson(Map<String, dynamic> json) {
    final l$parts = json['parts'];
    final l$$__typename = json['__typename'];
    return Fragment$StoryDetails(
      parts: (l$parts as List<dynamic>)
          .map((e) => Fragment$StoryPart.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$StoryPart> parts;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$parts = parts;
    _resultData['parts'] = l$parts.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$parts = parts;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$parts.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$StoryDetails || runtimeType != other.runtimeType) {
      return false;
    }
    final l$parts = parts;
    final lOther$parts = other.parts;
    if (l$parts.length != lOther$parts.length) {
      return false;
    }
    for (int i = 0; i < l$parts.length; i++) {
      final l$parts$entry = l$parts[i];
      final lOther$parts$entry = lOther$parts[i];
      if (l$parts$entry != lOther$parts$entry) {
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

extension UtilityExtension$Fragment$StoryDetails on Fragment$StoryDetails {
  CopyWith$Fragment$StoryDetails<Fragment$StoryDetails> get copyWith =>
      CopyWith$Fragment$StoryDetails(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$StoryDetails<TRes> {
  factory CopyWith$Fragment$StoryDetails(
    Fragment$StoryDetails instance,
    TRes Function(Fragment$StoryDetails) then,
  ) = _CopyWithImpl$Fragment$StoryDetails;

  factory CopyWith$Fragment$StoryDetails.stub(TRes res) =
      _CopyWithStubImpl$Fragment$StoryDetails;

  TRes call({
    List<Fragment$StoryPart>? parts,
    String? $__typename,
  });
  TRes parts(
      Iterable<Fragment$StoryPart> Function(
              Iterable<CopyWith$Fragment$StoryPart<Fragment$StoryPart>>)
          _fn);
}

class _CopyWithImpl$Fragment$StoryDetails<TRes>
    implements CopyWith$Fragment$StoryDetails<TRes> {
  _CopyWithImpl$Fragment$StoryDetails(
    this._instance,
    this._then,
  );

  final Fragment$StoryDetails _instance;

  final TRes Function(Fragment$StoryDetails) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? parts = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$StoryDetails(
        parts: parts == _undefined || parts == null
            ? _instance.parts
            : (parts as List<Fragment$StoryPart>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes parts(
          Iterable<Fragment$StoryPart> Function(
                  Iterable<CopyWith$Fragment$StoryPart<Fragment$StoryPart>>)
              _fn) =>
      call(
          parts: _fn(_instance.parts.map((e) => CopyWith$Fragment$StoryPart(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Fragment$StoryDetails<TRes>
    implements CopyWith$Fragment$StoryDetails<TRes> {
  _CopyWithStubImpl$Fragment$StoryDetails(this._res);

  TRes _res;

  call({
    List<Fragment$StoryPart>? parts,
    String? $__typename,
  }) =>
      _res;

  parts(_fn) => _res;
}

const fragmentDefinitionStoryDetails = FragmentDefinitionNode(
  name: NameNode(value: 'StoryDetails'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'StoryDetails'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'parts'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FragmentSpreadNode(
          name: NameNode(value: 'StoryPart'),
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
);
const documentNodeFragmentStoryDetails = DocumentNode(definitions: [
  fragmentDefinitionStoryDetails,
  fragmentDefinitionStoryPart,
  fragmentDefinitionQuizQuestion,
  fragmentDefinitionQuestionItem,
]);

extension ClientExtension$Fragment$StoryDetails on graphql.GraphQLClient {
  void writeFragment$StoryDetails({
    required Fragment$StoryDetails data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'StoryDetails',
            document: documentNodeFragmentStoryDetails,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$StoryDetails? readFragment$StoryDetails({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'StoryDetails',
          document: documentNodeFragmentStoryDetails,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$StoryDetails.fromJson(result);
  }
}

class Fragment$QuizPreludeItem {
  Fragment$QuizPreludeItem({
    required this.type,
    this.content,
    required this.hasPicture,
    this.pictureId,
    this.audioId,
    this.$__typename = 'QuizPreludeItem',
  });

  factory Fragment$QuizPreludeItem.fromJson(Map<String, dynamic> json) {
    final l$type = json['type'];
    final l$content = json['content'];
    final l$hasPicture = json['hasPicture'];
    final l$pictureId = json['pictureId'];
    final l$audioId = json['audioId'];
    final l$$__typename = json['__typename'];
    return Fragment$QuizPreludeItem(
      type: fromJson$Enum$QuizPreludeItemType((l$type as String)),
      content: l$content == null ? null : linguisticUnitSetFromJson(l$content),
      hasPicture: (l$hasPicture as bool),
      pictureId: (l$pictureId as String?),
      audioId: (l$audioId as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final Enum$QuizPreludeItemType type;

  final LinguisticUnitSet? content;

  final bool hasPicture;

  final String? pictureId;

  final String? audioId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$type = type;
    _resultData['type'] = toJson$Enum$QuizPreludeItemType(l$type);
    final l$content = content;
    _resultData['content'] =
        l$content == null ? null : linguisticUnitSetToJson(l$content);
    final l$hasPicture = hasPicture;
    _resultData['hasPicture'] = l$hasPicture;
    final l$pictureId = pictureId;
    _resultData['pictureId'] = l$pictureId;
    final l$audioId = audioId;
    _resultData['audioId'] = l$audioId;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$type = type;
    final l$content = content;
    final l$hasPicture = hasPicture;
    final l$pictureId = pictureId;
    final l$audioId = audioId;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$type,
      l$content,
      l$hasPicture,
      l$pictureId,
      l$audioId,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$QuizPreludeItem ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$content = content;
    final lOther$content = other.content;
    if (l$content != lOther$content) {
      return false;
    }
    final l$hasPicture = hasPicture;
    final lOther$hasPicture = other.hasPicture;
    if (l$hasPicture != lOther$hasPicture) {
      return false;
    }
    final l$pictureId = pictureId;
    final lOther$pictureId = other.pictureId;
    if (l$pictureId != lOther$pictureId) {
      return false;
    }
    final l$audioId = audioId;
    final lOther$audioId = other.audioId;
    if (l$audioId != lOther$audioId) {
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

extension UtilityExtension$Fragment$QuizPreludeItem
    on Fragment$QuizPreludeItem {
  CopyWith$Fragment$QuizPreludeItem<Fragment$QuizPreludeItem> get copyWith =>
      CopyWith$Fragment$QuizPreludeItem(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$QuizPreludeItem<TRes> {
  factory CopyWith$Fragment$QuizPreludeItem(
    Fragment$QuizPreludeItem instance,
    TRes Function(Fragment$QuizPreludeItem) then,
  ) = _CopyWithImpl$Fragment$QuizPreludeItem;

  factory CopyWith$Fragment$QuizPreludeItem.stub(TRes res) =
      _CopyWithStubImpl$Fragment$QuizPreludeItem;

  TRes call({
    Enum$QuizPreludeItemType? type,
    LinguisticUnitSet? content,
    bool? hasPicture,
    String? pictureId,
    String? audioId,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$QuizPreludeItem<TRes>
    implements CopyWith$Fragment$QuizPreludeItem<TRes> {
  _CopyWithImpl$Fragment$QuizPreludeItem(
    this._instance,
    this._then,
  );

  final Fragment$QuizPreludeItem _instance;

  final TRes Function(Fragment$QuizPreludeItem) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? type = _undefined,
    Object? content = _undefined,
    Object? hasPicture = _undefined,
    Object? pictureId = _undefined,
    Object? audioId = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$QuizPreludeItem(
        type: type == _undefined || type == null
            ? _instance.type
            : (type as Enum$QuizPreludeItemType),
        content: content == _undefined
            ? _instance.content
            : (content as LinguisticUnitSet?),
        hasPicture: hasPicture == _undefined || hasPicture == null
            ? _instance.hasPicture
            : (hasPicture as bool),
        pictureId: pictureId == _undefined
            ? _instance.pictureId
            : (pictureId as String?),
        audioId:
            audioId == _undefined ? _instance.audioId : (audioId as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$QuizPreludeItem<TRes>
    implements CopyWith$Fragment$QuizPreludeItem<TRes> {
  _CopyWithStubImpl$Fragment$QuizPreludeItem(this._res);

  TRes _res;

  call({
    Enum$QuizPreludeItemType? type,
    LinguisticUnitSet? content,
    bool? hasPicture,
    String? pictureId,
    String? audioId,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionQuizPreludeItem = FragmentDefinitionNode(
  name: NameNode(value: 'QuizPreludeItem'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'QuizPreludeItem'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'type'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'content'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'hasPicture'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'pictureId'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'audioId'),
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
);
const documentNodeFragmentQuizPreludeItem = DocumentNode(definitions: [
  fragmentDefinitionQuizPreludeItem,
]);

extension ClientExtension$Fragment$QuizPreludeItem on graphql.GraphQLClient {
  void writeFragment$QuizPreludeItem({
    required Fragment$QuizPreludeItem data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'QuizPreludeItem',
            document: documentNodeFragmentQuizPreludeItem,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$QuizPreludeItem? readFragment$QuizPreludeItem({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'QuizPreludeItem',
          document: documentNodeFragmentQuizPreludeItem,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$QuizPreludeItem.fromJson(result);
  }
}

class Fragment$QuizPrelude {
  Fragment$QuizPrelude({
    required this.id,
    required this.parts,
    this.$__typename = 'QuizPrelude',
  });

  factory Fragment$QuizPrelude.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$parts = json['parts'];
    final l$$__typename = json['__typename'];
    return Fragment$QuizPrelude(
      id: (l$id as String),
      parts: (l$parts as List<dynamic>)
          .map((e) =>
              Fragment$QuizPreludeItem.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final List<Fragment$QuizPreludeItem> parts;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$parts = parts;
    _resultData['parts'] = l$parts.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$parts = parts;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      Object.hashAll(l$parts.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$QuizPrelude || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$parts = parts;
    final lOther$parts = other.parts;
    if (l$parts.length != lOther$parts.length) {
      return false;
    }
    for (int i = 0; i < l$parts.length; i++) {
      final l$parts$entry = l$parts[i];
      final lOther$parts$entry = lOther$parts[i];
      if (l$parts$entry != lOther$parts$entry) {
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

extension UtilityExtension$Fragment$QuizPrelude on Fragment$QuizPrelude {
  CopyWith$Fragment$QuizPrelude<Fragment$QuizPrelude> get copyWith =>
      CopyWith$Fragment$QuizPrelude(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$QuizPrelude<TRes> {
  factory CopyWith$Fragment$QuizPrelude(
    Fragment$QuizPrelude instance,
    TRes Function(Fragment$QuizPrelude) then,
  ) = _CopyWithImpl$Fragment$QuizPrelude;

  factory CopyWith$Fragment$QuizPrelude.stub(TRes res) =
      _CopyWithStubImpl$Fragment$QuizPrelude;

  TRes call({
    String? id,
    List<Fragment$QuizPreludeItem>? parts,
    String? $__typename,
  });
  TRes parts(
      Iterable<Fragment$QuizPreludeItem> Function(
              Iterable<
                  CopyWith$Fragment$QuizPreludeItem<Fragment$QuizPreludeItem>>)
          _fn);
}

class _CopyWithImpl$Fragment$QuizPrelude<TRes>
    implements CopyWith$Fragment$QuizPrelude<TRes> {
  _CopyWithImpl$Fragment$QuizPrelude(
    this._instance,
    this._then,
  );

  final Fragment$QuizPrelude _instance;

  final TRes Function(Fragment$QuizPrelude) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? parts = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$QuizPrelude(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        parts: parts == _undefined || parts == null
            ? _instance.parts
            : (parts as List<Fragment$QuizPreludeItem>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes parts(
          Iterable<Fragment$QuizPreludeItem> Function(
                  Iterable<
                      CopyWith$Fragment$QuizPreludeItem<
                          Fragment$QuizPreludeItem>>)
              _fn) =>
      call(
          parts:
              _fn(_instance.parts.map((e) => CopyWith$Fragment$QuizPreludeItem(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Fragment$QuizPrelude<TRes>
    implements CopyWith$Fragment$QuizPrelude<TRes> {
  _CopyWithStubImpl$Fragment$QuizPrelude(this._res);

  TRes _res;

  call({
    String? id,
    List<Fragment$QuizPreludeItem>? parts,
    String? $__typename,
  }) =>
      _res;

  parts(_fn) => _res;
}

const fragmentDefinitionQuizPrelude = FragmentDefinitionNode(
  name: NameNode(value: 'QuizPrelude'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'QuizPrelude'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'id'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'parts'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FragmentSpreadNode(
          name: NameNode(value: 'QuizPreludeItem'),
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
);
const documentNodeFragmentQuizPrelude = DocumentNode(definitions: [
  fragmentDefinitionQuizPrelude,
  fragmentDefinitionQuizPreludeItem,
]);

extension ClientExtension$Fragment$QuizPrelude on graphql.GraphQLClient {
  void writeFragment$QuizPrelude({
    required Fragment$QuizPrelude data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'QuizPrelude',
            document: documentNodeFragmentQuizPrelude,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$QuizPrelude? readFragment$QuizPrelude({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'QuizPrelude',
          document: documentNodeFragmentQuizPrelude,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$QuizPrelude.fromJson(result);
  }
}

class Fragment$QuestionItem {
  Fragment$QuestionItem({
    required this.id,
    required this.text,
    this.pictureId,
    required this.hasPicture,
    this.$__typename = 'QuestionItem',
  });

  factory Fragment$QuestionItem.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$text = json['text'];
    final l$pictureId = json['pictureId'];
    final l$hasPicture = json['hasPicture'];
    final l$$__typename = json['__typename'];
    return Fragment$QuestionItem(
      id: (l$id as String),
      text: linguisticUnitSetFromJson(l$text),
      pictureId: (l$pictureId as String?),
      hasPicture: (l$hasPicture as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final LinguisticUnitSet text;

  final String? pictureId;

  final bool hasPicture;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$text = text;
    _resultData['text'] = linguisticUnitSetToJson(l$text);
    final l$pictureId = pictureId;
    _resultData['pictureId'] = l$pictureId;
    final l$hasPicture = hasPicture;
    _resultData['hasPicture'] = l$hasPicture;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$text = text;
    final l$pictureId = pictureId;
    final l$hasPicture = hasPicture;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$text,
      l$pictureId,
      l$hasPicture,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$QuestionItem || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$text = text;
    final lOther$text = other.text;
    if (l$text != lOther$text) {
      return false;
    }
    final l$pictureId = pictureId;
    final lOther$pictureId = other.pictureId;
    if (l$pictureId != lOther$pictureId) {
      return false;
    }
    final l$hasPicture = hasPicture;
    final lOther$hasPicture = other.hasPicture;
    if (l$hasPicture != lOther$hasPicture) {
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

extension UtilityExtension$Fragment$QuestionItem on Fragment$QuestionItem {
  CopyWith$Fragment$QuestionItem<Fragment$QuestionItem> get copyWith =>
      CopyWith$Fragment$QuestionItem(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$QuestionItem<TRes> {
  factory CopyWith$Fragment$QuestionItem(
    Fragment$QuestionItem instance,
    TRes Function(Fragment$QuestionItem) then,
  ) = _CopyWithImpl$Fragment$QuestionItem;

  factory CopyWith$Fragment$QuestionItem.stub(TRes res) =
      _CopyWithStubImpl$Fragment$QuestionItem;

  TRes call({
    String? id,
    LinguisticUnitSet? text,
    String? pictureId,
    bool? hasPicture,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$QuestionItem<TRes>
    implements CopyWith$Fragment$QuestionItem<TRes> {
  _CopyWithImpl$Fragment$QuestionItem(
    this._instance,
    this._then,
  );

  final Fragment$QuestionItem _instance;

  final TRes Function(Fragment$QuestionItem) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? text = _undefined,
    Object? pictureId = _undefined,
    Object? hasPicture = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$QuestionItem(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        text: text == _undefined || text == null
            ? _instance.text
            : (text as LinguisticUnitSet),
        pictureId: pictureId == _undefined
            ? _instance.pictureId
            : (pictureId as String?),
        hasPicture: hasPicture == _undefined || hasPicture == null
            ? _instance.hasPicture
            : (hasPicture as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$QuestionItem<TRes>
    implements CopyWith$Fragment$QuestionItem<TRes> {
  _CopyWithStubImpl$Fragment$QuestionItem(this._res);

  TRes _res;

  call({
    String? id,
    LinguisticUnitSet? text,
    String? pictureId,
    bool? hasPicture,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionQuestionItem = FragmentDefinitionNode(
  name: NameNode(value: 'QuestionItem'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'QuestionItem'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'id'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'text'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'pictureId'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'hasPicture'),
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
);
const documentNodeFragmentQuestionItem = DocumentNode(definitions: [
  fragmentDefinitionQuestionItem,
]);

extension ClientExtension$Fragment$QuestionItem on graphql.GraphQLClient {
  void writeFragment$QuestionItem({
    required Fragment$QuestionItem data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'QuestionItem',
            document: documentNodeFragmentQuestionItem,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$QuestionItem? readFragment$QuestionItem({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'QuestionItem',
          document: documentNodeFragmentQuestionItem,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$QuestionItem.fromJson(result);
  }
}

class Fragment$QuizQuestion {
  Fragment$QuizQuestion({
    required this.id,
    required this.type,
    required this.question,
    this.preludeID,
    this.choices,
    this.secondaryChoices,
    this.$__typename = 'QuizQuestion',
  });

  factory Fragment$QuizQuestion.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$type = json['type'];
    final l$question = json['question'];
    final l$preludeID = json['preludeID'];
    final l$choices = json['choices'];
    final l$secondaryChoices = json['secondaryChoices'];
    final l$$__typename = json['__typename'];
    return Fragment$QuizQuestion(
      id: (l$id as String),
      type: fromJson$Enum$QuizQuestionType((l$type as String)),
      question: linguisticUnitSetFromJson(l$question),
      preludeID: (l$preludeID as String?),
      choices: (l$choices as List<dynamic>?)
          ?.map((e) =>
              Fragment$QuestionItem.fromJson((e as Map<String, dynamic>)))
          .toList(),
      secondaryChoices: (l$secondaryChoices as List<dynamic>?)
          ?.map((e) =>
              Fragment$QuestionItem.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$QuizQuestionType type;

  final LinguisticUnitSet question;

  final String? preludeID;

  final List<Fragment$QuestionItem>? choices;

  final List<Fragment$QuestionItem>? secondaryChoices;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$type = type;
    _resultData['type'] = toJson$Enum$QuizQuestionType(l$type);
    final l$question = question;
    _resultData['question'] = linguisticUnitSetToJson(l$question);
    final l$preludeID = preludeID;
    _resultData['preludeID'] = l$preludeID;
    final l$choices = choices;
    _resultData['choices'] = l$choices?.map((e) => e.toJson()).toList();
    final l$secondaryChoices = secondaryChoices;
    _resultData['secondaryChoices'] =
        l$secondaryChoices?.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$type = type;
    final l$question = question;
    final l$preludeID = preludeID;
    final l$choices = choices;
    final l$secondaryChoices = secondaryChoices;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$type,
      l$question,
      l$preludeID,
      l$choices == null ? null : Object.hashAll(l$choices.map((v) => v)),
      l$secondaryChoices == null
          ? null
          : Object.hashAll(l$secondaryChoices.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$QuizQuestion || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$question = question;
    final lOther$question = other.question;
    if (l$question != lOther$question) {
      return false;
    }
    final l$preludeID = preludeID;
    final lOther$preludeID = other.preludeID;
    if (l$preludeID != lOther$preludeID) {
      return false;
    }
    final l$choices = choices;
    final lOther$choices = other.choices;
    if (l$choices != null && lOther$choices != null) {
      if (l$choices.length != lOther$choices.length) {
        return false;
      }
      for (int i = 0; i < l$choices.length; i++) {
        final l$choices$entry = l$choices[i];
        final lOther$choices$entry = lOther$choices[i];
        if (l$choices$entry != lOther$choices$entry) {
          return false;
        }
      }
    } else if (l$choices != lOther$choices) {
      return false;
    }
    final l$secondaryChoices = secondaryChoices;
    final lOther$secondaryChoices = other.secondaryChoices;
    if (l$secondaryChoices != null && lOther$secondaryChoices != null) {
      if (l$secondaryChoices.length != lOther$secondaryChoices.length) {
        return false;
      }
      for (int i = 0; i < l$secondaryChoices.length; i++) {
        final l$secondaryChoices$entry = l$secondaryChoices[i];
        final lOther$secondaryChoices$entry = lOther$secondaryChoices[i];
        if (l$secondaryChoices$entry != lOther$secondaryChoices$entry) {
          return false;
        }
      }
    } else if (l$secondaryChoices != lOther$secondaryChoices) {
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

extension UtilityExtension$Fragment$QuizQuestion on Fragment$QuizQuestion {
  CopyWith$Fragment$QuizQuestion<Fragment$QuizQuestion> get copyWith =>
      CopyWith$Fragment$QuizQuestion(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$QuizQuestion<TRes> {
  factory CopyWith$Fragment$QuizQuestion(
    Fragment$QuizQuestion instance,
    TRes Function(Fragment$QuizQuestion) then,
  ) = _CopyWithImpl$Fragment$QuizQuestion;

  factory CopyWith$Fragment$QuizQuestion.stub(TRes res) =
      _CopyWithStubImpl$Fragment$QuizQuestion;

  TRes call({
    String? id,
    Enum$QuizQuestionType? type,
    LinguisticUnitSet? question,
    String? preludeID,
    List<Fragment$QuestionItem>? choices,
    List<Fragment$QuestionItem>? secondaryChoices,
    String? $__typename,
  });
  TRes choices(
      Iterable<Fragment$QuestionItem>? Function(
              Iterable<CopyWith$Fragment$QuestionItem<Fragment$QuestionItem>>?)
          _fn);
  TRes secondaryChoices(
      Iterable<Fragment$QuestionItem>? Function(
              Iterable<CopyWith$Fragment$QuestionItem<Fragment$QuestionItem>>?)
          _fn);
}

class _CopyWithImpl$Fragment$QuizQuestion<TRes>
    implements CopyWith$Fragment$QuizQuestion<TRes> {
  _CopyWithImpl$Fragment$QuizQuestion(
    this._instance,
    this._then,
  );

  final Fragment$QuizQuestion _instance;

  final TRes Function(Fragment$QuizQuestion) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? type = _undefined,
    Object? question = _undefined,
    Object? preludeID = _undefined,
    Object? choices = _undefined,
    Object? secondaryChoices = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$QuizQuestion(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        type: type == _undefined || type == null
            ? _instance.type
            : (type as Enum$QuizQuestionType),
        question: question == _undefined || question == null
            ? _instance.question
            : (question as LinguisticUnitSet),
        preludeID: preludeID == _undefined
            ? _instance.preludeID
            : (preludeID as String?),
        choices: choices == _undefined
            ? _instance.choices
            : (choices as List<Fragment$QuestionItem>?),
        secondaryChoices: secondaryChoices == _undefined
            ? _instance.secondaryChoices
            : (secondaryChoices as List<Fragment$QuestionItem>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes choices(
          Iterable<Fragment$QuestionItem>? Function(
                  Iterable<
                      CopyWith$Fragment$QuestionItem<Fragment$QuestionItem>>?)
              _fn) =>
      call(
          choices:
              _fn(_instance.choices?.map((e) => CopyWith$Fragment$QuestionItem(
                    e,
                    (i) => i,
                  )))?.toList());

  TRes secondaryChoices(
          Iterable<Fragment$QuestionItem>? Function(
                  Iterable<
                      CopyWith$Fragment$QuestionItem<Fragment$QuestionItem>>?)
              _fn) =>
      call(
          secondaryChoices: _fn(_instance.secondaryChoices
              ?.map((e) => CopyWith$Fragment$QuestionItem(
                    e,
                    (i) => i,
                  )))?.toList());
}

class _CopyWithStubImpl$Fragment$QuizQuestion<TRes>
    implements CopyWith$Fragment$QuizQuestion<TRes> {
  _CopyWithStubImpl$Fragment$QuizQuestion(this._res);

  TRes _res;

  call({
    String? id,
    Enum$QuizQuestionType? type,
    LinguisticUnitSet? question,
    String? preludeID,
    List<Fragment$QuestionItem>? choices,
    List<Fragment$QuestionItem>? secondaryChoices,
    String? $__typename,
  }) =>
      _res;

  choices(_fn) => _res;

  secondaryChoices(_fn) => _res;
}

const fragmentDefinitionQuizQuestion = FragmentDefinitionNode(
  name: NameNode(value: 'QuizQuestion'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'QuizQuestion'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'id'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'type'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'question'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'preludeID'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'choices'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FragmentSpreadNode(
          name: NameNode(value: 'QuestionItem'),
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
      name: NameNode(value: 'secondaryChoices'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FragmentSpreadNode(
          name: NameNode(value: 'QuestionItem'),
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
);
const documentNodeFragmentQuizQuestion = DocumentNode(definitions: [
  fragmentDefinitionQuizQuestion,
  fragmentDefinitionQuestionItem,
]);

extension ClientExtension$Fragment$QuizQuestion on graphql.GraphQLClient {
  void writeFragment$QuizQuestion({
    required Fragment$QuizQuestion data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'QuizQuestion',
            document: documentNodeFragmentQuizQuestion,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$QuizQuestion? readFragment$QuizQuestion({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'QuizQuestion',
          document: documentNodeFragmentQuizQuestion,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$QuizQuestion.fromJson(result);
  }
}

class Fragment$ConversationCharacter {
  Fragment$ConversationCharacter({
    required this.name,
    this.description,
    this.voice,
    this.avatar,
    this.gender,
    this.$__typename = 'ConversationCharacter',
  });

  factory Fragment$ConversationCharacter.fromJson(Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$description = json['description'];
    final l$voice = json['voice'];
    final l$avatar = json['avatar'];
    final l$gender = json['gender'];
    final l$$__typename = json['__typename'];
    return Fragment$ConversationCharacter(
      name: (l$name as String),
      description: (l$description as String?),
      voice: (l$voice as String?),
      avatar: l$avatar == null ? null : avatarFromJson(l$avatar),
      gender: (l$gender as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String name;

  final String? description;

  final String? voice;

  final Avatar? avatar;

  final String? gender;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$voice = voice;
    _resultData['voice'] = l$voice;
    final l$avatar = avatar;
    _resultData['avatar'] = l$avatar == null ? null : avatarToJson(l$avatar);
    final l$gender = gender;
    _resultData['gender'] = l$gender;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$description = description;
    final l$voice = voice;
    final l$avatar = avatar;
    final l$gender = gender;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$description,
      l$voice,
      l$avatar,
      l$gender,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$ConversationCharacter ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$voice = voice;
    final lOther$voice = other.voice;
    if (l$voice != lOther$voice) {
      return false;
    }
    final l$avatar = avatar;
    final lOther$avatar = other.avatar;
    if (l$avatar != lOther$avatar) {
      return false;
    }
    final l$gender = gender;
    final lOther$gender = other.gender;
    if (l$gender != lOther$gender) {
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

extension UtilityExtension$Fragment$ConversationCharacter
    on Fragment$ConversationCharacter {
  CopyWith$Fragment$ConversationCharacter<Fragment$ConversationCharacter>
      get copyWith => CopyWith$Fragment$ConversationCharacter(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$ConversationCharacter<TRes> {
  factory CopyWith$Fragment$ConversationCharacter(
    Fragment$ConversationCharacter instance,
    TRes Function(Fragment$ConversationCharacter) then,
  ) = _CopyWithImpl$Fragment$ConversationCharacter;

  factory CopyWith$Fragment$ConversationCharacter.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ConversationCharacter;

  TRes call({
    String? name,
    String? description,
    String? voice,
    Avatar? avatar,
    String? gender,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$ConversationCharacter<TRes>
    implements CopyWith$Fragment$ConversationCharacter<TRes> {
  _CopyWithImpl$Fragment$ConversationCharacter(
    this._instance,
    this._then,
  );

  final Fragment$ConversationCharacter _instance;

  final TRes Function(Fragment$ConversationCharacter) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? description = _undefined,
    Object? voice = _undefined,
    Object? avatar = _undefined,
    Object? gender = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$ConversationCharacter(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        voice: voice == _undefined ? _instance.voice : (voice as String?),
        avatar: avatar == _undefined ? _instance.avatar : (avatar as Avatar?),
        gender: gender == _undefined ? _instance.gender : (gender as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$ConversationCharacter<TRes>
    implements CopyWith$Fragment$ConversationCharacter<TRes> {
  _CopyWithStubImpl$Fragment$ConversationCharacter(this._res);

  TRes _res;

  call({
    String? name,
    String? description,
    String? voice,
    Avatar? avatar,
    String? gender,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionConversationCharacter = FragmentDefinitionNode(
  name: NameNode(value: 'ConversationCharacter'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'ConversationCharacter'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'name'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'description'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'voice'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'avatar'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'gender'),
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
);
const documentNodeFragmentConversationCharacter = DocumentNode(definitions: [
  fragmentDefinitionConversationCharacter,
]);

extension ClientExtension$Fragment$ConversationCharacter
    on graphql.GraphQLClient {
  void writeFragment$ConversationCharacter({
    required Fragment$ConversationCharacter data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'ConversationCharacter',
            document: documentNodeFragmentConversationCharacter,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$ConversationCharacter? readFragment$ConversationCharacter({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'ConversationCharacter',
          document: documentNodeFragmentConversationCharacter,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Fragment$ConversationCharacter.fromJson(result);
  }
}

class Fragment$ConversationDetails {
  Fragment$ConversationDetails({
    required this.instructions,
    required this.characters,
    this.$__typename = 'ConversationDetails',
  });

  factory Fragment$ConversationDetails.fromJson(Map<String, dynamic> json) {
    final l$instructions = json['instructions'];
    final l$characters = json['characters'];
    final l$$__typename = json['__typename'];
    return Fragment$ConversationDetails(
      instructions: linguisticUnitSetFromJson(l$instructions),
      characters: (l$characters as List<dynamic>)
          .map((e) => Fragment$ConversationCharacter.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final LinguisticUnitSet instructions;

  final List<Fragment$ConversationCharacter> characters;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$instructions = instructions;
    _resultData['instructions'] = linguisticUnitSetToJson(l$instructions);
    final l$characters = characters;
    _resultData['characters'] = l$characters.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$instructions = instructions;
    final l$characters = characters;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$instructions,
      Object.hashAll(l$characters.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$ConversationDetails ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$instructions = instructions;
    final lOther$instructions = other.instructions;
    if (l$instructions != lOther$instructions) {
      return false;
    }
    final l$characters = characters;
    final lOther$characters = other.characters;
    if (l$characters.length != lOther$characters.length) {
      return false;
    }
    for (int i = 0; i < l$characters.length; i++) {
      final l$characters$entry = l$characters[i];
      final lOther$characters$entry = lOther$characters[i];
      if (l$characters$entry != lOther$characters$entry) {
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

extension UtilityExtension$Fragment$ConversationDetails
    on Fragment$ConversationDetails {
  CopyWith$Fragment$ConversationDetails<Fragment$ConversationDetails>
      get copyWith => CopyWith$Fragment$ConversationDetails(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$ConversationDetails<TRes> {
  factory CopyWith$Fragment$ConversationDetails(
    Fragment$ConversationDetails instance,
    TRes Function(Fragment$ConversationDetails) then,
  ) = _CopyWithImpl$Fragment$ConversationDetails;

  factory CopyWith$Fragment$ConversationDetails.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ConversationDetails;

  TRes call({
    LinguisticUnitSet? instructions,
    List<Fragment$ConversationCharacter>? characters,
    String? $__typename,
  });
  TRes characters(
      Iterable<Fragment$ConversationCharacter> Function(
              Iterable<
                  CopyWith$Fragment$ConversationCharacter<
                      Fragment$ConversationCharacter>>)
          _fn);
}

class _CopyWithImpl$Fragment$ConversationDetails<TRes>
    implements CopyWith$Fragment$ConversationDetails<TRes> {
  _CopyWithImpl$Fragment$ConversationDetails(
    this._instance,
    this._then,
  );

  final Fragment$ConversationDetails _instance;

  final TRes Function(Fragment$ConversationDetails) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? instructions = _undefined,
    Object? characters = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$ConversationDetails(
        instructions: instructions == _undefined || instructions == null
            ? _instance.instructions
            : (instructions as LinguisticUnitSet),
        characters: characters == _undefined || characters == null
            ? _instance.characters
            : (characters as List<Fragment$ConversationCharacter>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes characters(
          Iterable<Fragment$ConversationCharacter> Function(
                  Iterable<
                      CopyWith$Fragment$ConversationCharacter<
                          Fragment$ConversationCharacter>>)
              _fn) =>
      call(
          characters: _fn(_instance.characters
              .map((e) => CopyWith$Fragment$ConversationCharacter(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Fragment$ConversationDetails<TRes>
    implements CopyWith$Fragment$ConversationDetails<TRes> {
  _CopyWithStubImpl$Fragment$ConversationDetails(this._res);

  TRes _res;

  call({
    LinguisticUnitSet? instructions,
    List<Fragment$ConversationCharacter>? characters,
    String? $__typename,
  }) =>
      _res;

  characters(_fn) => _res;
}

const fragmentDefinitionConversationDetails = FragmentDefinitionNode(
  name: NameNode(value: 'ConversationDetails'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'ConversationDetails'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'instructions'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'characters'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FragmentSpreadNode(
          name: NameNode(value: 'ConversationCharacter'),
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
);
const documentNodeFragmentConversationDetails = DocumentNode(definitions: [
  fragmentDefinitionConversationDetails,
  fragmentDefinitionConversationCharacter,
]);

extension ClientExtension$Fragment$ConversationDetails
    on graphql.GraphQLClient {
  void writeFragment$ConversationDetails({
    required Fragment$ConversationDetails data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'ConversationDetails',
            document: documentNodeFragmentConversationDetails,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$ConversationDetails? readFragment$ConversationDetails({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'ConversationDetails',
          document: documentNodeFragmentConversationDetails,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Fragment$ConversationDetails.fromJson(result);
  }
}

class Fragment$QuizDetails {
  Fragment$QuizDetails({
    this.preludes,
    required this.questions,
  });

  factory Fragment$QuizDetails.fromJson(Map<String, dynamic> json) {
    final l$preludes = json['preludes'];
    final l$questions = json['questions'];
    return Fragment$QuizDetails(
      preludes: (l$preludes as List<dynamic>?)
          ?.map(
              (e) => Fragment$QuizPrelude.fromJson((e as Map<String, dynamic>)))
          .toList(),
      questions: (l$questions as List<dynamic>)
          .map((e) =>
              Fragment$QuizQuestion.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  final List<Fragment$QuizPrelude>? preludes;

  final List<Fragment$QuizQuestion> questions;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$preludes = preludes;
    _resultData['preludes'] = l$preludes?.map((e) => e.toJson()).toList();
    final l$questions = questions;
    _resultData['questions'] = l$questions.map((e) => e.toJson()).toList();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$preludes = preludes;
    final l$questions = questions;
    return Object.hashAll([
      l$preludes == null ? null : Object.hashAll(l$preludes.map((v) => v)),
      Object.hashAll(l$questions.map((v) => v)),
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$QuizDetails || runtimeType != other.runtimeType) {
      return false;
    }
    final l$preludes = preludes;
    final lOther$preludes = other.preludes;
    if (l$preludes != null && lOther$preludes != null) {
      if (l$preludes.length != lOther$preludes.length) {
        return false;
      }
      for (int i = 0; i < l$preludes.length; i++) {
        final l$preludes$entry = l$preludes[i];
        final lOther$preludes$entry = lOther$preludes[i];
        if (l$preludes$entry != lOther$preludes$entry) {
          return false;
        }
      }
    } else if (l$preludes != lOther$preludes) {
      return false;
    }
    final l$questions = questions;
    final lOther$questions = other.questions;
    if (l$questions.length != lOther$questions.length) {
      return false;
    }
    for (int i = 0; i < l$questions.length; i++) {
      final l$questions$entry = l$questions[i];
      final lOther$questions$entry = lOther$questions[i];
      if (l$questions$entry != lOther$questions$entry) {
        return false;
      }
    }
    return true;
  }
}

extension UtilityExtension$Fragment$QuizDetails on Fragment$QuizDetails {
  CopyWith$Fragment$QuizDetails<Fragment$QuizDetails> get copyWith =>
      CopyWith$Fragment$QuizDetails(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$QuizDetails<TRes> {
  factory CopyWith$Fragment$QuizDetails(
    Fragment$QuizDetails instance,
    TRes Function(Fragment$QuizDetails) then,
  ) = _CopyWithImpl$Fragment$QuizDetails;

  factory CopyWith$Fragment$QuizDetails.stub(TRes res) =
      _CopyWithStubImpl$Fragment$QuizDetails;

  TRes call({
    List<Fragment$QuizPrelude>? preludes,
    List<Fragment$QuizQuestion>? questions,
  });
  TRes preludes(
      Iterable<Fragment$QuizPrelude>? Function(
              Iterable<CopyWith$Fragment$QuizPrelude<Fragment$QuizPrelude>>?)
          _fn);
  TRes questions(
      Iterable<Fragment$QuizQuestion> Function(
              Iterable<CopyWith$Fragment$QuizQuestion<Fragment$QuizQuestion>>)
          _fn);
}

class _CopyWithImpl$Fragment$QuizDetails<TRes>
    implements CopyWith$Fragment$QuizDetails<TRes> {
  _CopyWithImpl$Fragment$QuizDetails(
    this._instance,
    this._then,
  );

  final Fragment$QuizDetails _instance;

  final TRes Function(Fragment$QuizDetails) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? preludes = _undefined,
    Object? questions = _undefined,
  }) =>
      _then(Fragment$QuizDetails(
        preludes: preludes == _undefined
            ? _instance.preludes
            : (preludes as List<Fragment$QuizPrelude>?),
        questions: questions == _undefined || questions == null
            ? _instance.questions
            : (questions as List<Fragment$QuizQuestion>),
      ));

  TRes preludes(
          Iterable<Fragment$QuizPrelude>? Function(
                  Iterable<
                      CopyWith$Fragment$QuizPrelude<Fragment$QuizPrelude>>?)
              _fn) =>
      call(
          preludes:
              _fn(_instance.preludes?.map((e) => CopyWith$Fragment$QuizPrelude(
                    e,
                    (i) => i,
                  )))?.toList());

  TRes questions(
          Iterable<Fragment$QuizQuestion> Function(
                  Iterable<
                      CopyWith$Fragment$QuizQuestion<Fragment$QuizQuestion>>)
              _fn) =>
      call(
          questions:
              _fn(_instance.questions.map((e) => CopyWith$Fragment$QuizQuestion(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Fragment$QuizDetails<TRes>
    implements CopyWith$Fragment$QuizDetails<TRes> {
  _CopyWithStubImpl$Fragment$QuizDetails(this._res);

  TRes _res;

  call({
    List<Fragment$QuizPrelude>? preludes,
    List<Fragment$QuizQuestion>? questions,
  }) =>
      _res;

  preludes(_fn) => _res;

  questions(_fn) => _res;
}

const fragmentDefinitionQuizDetails = FragmentDefinitionNode(
  name: NameNode(value: 'QuizDetails'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'QuizDetails'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'preludes'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FragmentSpreadNode(
          name: NameNode(value: 'QuizPrelude'),
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
      name: NameNode(value: 'questions'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FragmentSpreadNode(
          name: NameNode(value: 'QuizQuestion'),
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
  ]),
);
const documentNodeFragmentQuizDetails = DocumentNode(definitions: [
  fragmentDefinitionQuizDetails,
  fragmentDefinitionQuizPrelude,
  fragmentDefinitionQuizPreludeItem,
  fragmentDefinitionQuizQuestion,
  fragmentDefinitionQuestionItem,
]);

extension ClientExtension$Fragment$QuizDetails on graphql.GraphQLClient {
  void writeFragment$QuizDetails({
    required Fragment$QuizDetails data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'QuizDetails',
            document: documentNodeFragmentQuizDetails,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$QuizDetails? readFragment$QuizDetails({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'QuizDetails',
          document: documentNodeFragmentQuizDetails,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$QuizDetails.fromJson(result);
  }
}

class Fragment$MaterialDetails {
  Fragment$MaterialDetails({
    required this.type,
    required this.title,
    required this.description,
    required this.$__typename,
  });

  factory Fragment$MaterialDetails.fromJson(Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "StoryDetails":
        return Fragment$MaterialDetails$$StoryDetails.fromJson(json);

      case "QuizDetails":
        return Fragment$MaterialDetails$$QuizDetails.fromJson(json);

      case "ConversationDetails":
        return Fragment$MaterialDetails$$ConversationDetails.fromJson(json);

      default:
        final l$type = json['type'];
        final l$title = json['title'];
        final l$description = json['description'];
        final l$$__typename = json['__typename'];
        return Fragment$MaterialDetails(
          type: fromJson$Enum$MaterialType((l$type as String)),
          title: (l$title as String),
          description: (l$description as String),
          $__typename: (l$$__typename as String),
        );
    }
  }

  final Enum$MaterialType type;

  final String title;

  final String description;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$type = type;
    _resultData['type'] = toJson$Enum$MaterialType(l$type);
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$type = type;
    final l$title = title;
    final l$description = description;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$type,
      l$title,
      l$description,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$MaterialDetails ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
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

extension UtilityExtension$Fragment$MaterialDetails
    on Fragment$MaterialDetails {
  CopyWith$Fragment$MaterialDetails<Fragment$MaterialDetails> get copyWith =>
      CopyWith$Fragment$MaterialDetails(
        this,
        (i) => i,
      );
  _T when<_T>({
    required _T Function(Fragment$MaterialDetails$$StoryDetails) storyDetails,
    required _T Function(Fragment$MaterialDetails$$QuizDetails) quizDetails,
    required _T Function(Fragment$MaterialDetails$$ConversationDetails)
        conversationDetails,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "StoryDetails":
        return storyDetails(this as Fragment$MaterialDetails$$StoryDetails);

      case "QuizDetails":
        return quizDetails(this as Fragment$MaterialDetails$$QuizDetails);

      case "ConversationDetails":
        return conversationDetails(
            this as Fragment$MaterialDetails$$ConversationDetails);

      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(Fragment$MaterialDetails$$StoryDetails)? storyDetails,
    _T Function(Fragment$MaterialDetails$$QuizDetails)? quizDetails,
    _T Function(Fragment$MaterialDetails$$ConversationDetails)?
        conversationDetails,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "StoryDetails":
        if (storyDetails != null) {
          return storyDetails(this as Fragment$MaterialDetails$$StoryDetails);
        } else {
          return orElse();
        }

      case "QuizDetails":
        if (quizDetails != null) {
          return quizDetails(this as Fragment$MaterialDetails$$QuizDetails);
        } else {
          return orElse();
        }

      case "ConversationDetails":
        if (conversationDetails != null) {
          return conversationDetails(
              this as Fragment$MaterialDetails$$ConversationDetails);
        } else {
          return orElse();
        }

      default:
        return orElse();
    }
  }
}

abstract class CopyWith$Fragment$MaterialDetails<TRes> {
  factory CopyWith$Fragment$MaterialDetails(
    Fragment$MaterialDetails instance,
    TRes Function(Fragment$MaterialDetails) then,
  ) = _CopyWithImpl$Fragment$MaterialDetails;

  factory CopyWith$Fragment$MaterialDetails.stub(TRes res) =
      _CopyWithStubImpl$Fragment$MaterialDetails;

  TRes call({
    Enum$MaterialType? type,
    String? title,
    String? description,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$MaterialDetails<TRes>
    implements CopyWith$Fragment$MaterialDetails<TRes> {
  _CopyWithImpl$Fragment$MaterialDetails(
    this._instance,
    this._then,
  );

  final Fragment$MaterialDetails _instance;

  final TRes Function(Fragment$MaterialDetails) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? type = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$MaterialDetails(
        type: type == _undefined || type == null
            ? _instance.type
            : (type as Enum$MaterialType),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        description: description == _undefined || description == null
            ? _instance.description
            : (description as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$MaterialDetails<TRes>
    implements CopyWith$Fragment$MaterialDetails<TRes> {
  _CopyWithStubImpl$Fragment$MaterialDetails(this._res);

  TRes _res;

  call({
    Enum$MaterialType? type,
    String? title,
    String? description,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionMaterialDetails = FragmentDefinitionNode(
  name: NameNode(value: 'MaterialDetails'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'MaterialDetails'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'type'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'title'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'description'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    InlineFragmentNode(
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
        name: NameNode(value: 'StoryDetails'),
        isNonNull: false,
      )),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FragmentSpreadNode(
          name: NameNode(value: 'StoryDetails'),
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
    InlineFragmentNode(
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
        name: NameNode(value: 'QuizDetails'),
        isNonNull: false,
      )),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FragmentSpreadNode(
          name: NameNode(value: 'QuizDetails'),
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
    InlineFragmentNode(
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
        name: NameNode(value: 'ConversationDetails'),
        isNonNull: false,
      )),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FragmentSpreadNode(
          name: NameNode(value: 'ConversationDetails'),
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
);
const documentNodeFragmentMaterialDetails = DocumentNode(definitions: [
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
]);

extension ClientExtension$Fragment$MaterialDetails on graphql.GraphQLClient {
  void writeFragment$MaterialDetails({
    required Fragment$MaterialDetails data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'MaterialDetails',
            document: documentNodeFragmentMaterialDetails,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$MaterialDetails? readFragment$MaterialDetails({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'MaterialDetails',
          document: documentNodeFragmentMaterialDetails,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$MaterialDetails.fromJson(result);
  }
}

class Fragment$MaterialDetails$$StoryDetails
    implements Fragment$StoryDetails, Fragment$MaterialDetails {
  Fragment$MaterialDetails$$StoryDetails({
    required this.parts,
    this.$__typename = 'StoryDetails',
    required this.type,
    required this.title,
    required this.description,
  });

  factory Fragment$MaterialDetails$$StoryDetails.fromJson(
      Map<String, dynamic> json) {
    final l$parts = json['parts'];
    final l$$__typename = json['__typename'];
    final l$type = json['type'];
    final l$title = json['title'];
    final l$description = json['description'];
    return Fragment$MaterialDetails$$StoryDetails(
      parts: (l$parts as List<dynamic>)
          .map((e) => Fragment$StoryPart.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
      type: fromJson$Enum$MaterialType((l$type as String)),
      title: (l$title as String),
      description: (l$description as String),
    );
  }

  final List<Fragment$StoryPart> parts;

  final String $__typename;

  final Enum$MaterialType type;

  final String title;

  final String description;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$parts = parts;
    _resultData['parts'] = l$parts.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$type = type;
    _resultData['type'] = toJson$Enum$MaterialType(l$type);
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$parts = parts;
    final l$$__typename = $__typename;
    final l$type = type;
    final l$title = title;
    final l$description = description;
    return Object.hashAll([
      Object.hashAll(l$parts.map((v) => v)),
      l$$__typename,
      l$type,
      l$title,
      l$description,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$MaterialDetails$$StoryDetails ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$parts = parts;
    final lOther$parts = other.parts;
    if (l$parts.length != lOther$parts.length) {
      return false;
    }
    for (int i = 0; i < l$parts.length; i++) {
      final l$parts$entry = l$parts[i];
      final lOther$parts$entry = lOther$parts[i];
      if (l$parts$entry != lOther$parts$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$MaterialDetails$$StoryDetails
    on Fragment$MaterialDetails$$StoryDetails {
  CopyWith$Fragment$MaterialDetails$$StoryDetails<
          Fragment$MaterialDetails$$StoryDetails>
      get copyWith => CopyWith$Fragment$MaterialDetails$$StoryDetails(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$MaterialDetails$$StoryDetails<TRes> {
  factory CopyWith$Fragment$MaterialDetails$$StoryDetails(
    Fragment$MaterialDetails$$StoryDetails instance,
    TRes Function(Fragment$MaterialDetails$$StoryDetails) then,
  ) = _CopyWithImpl$Fragment$MaterialDetails$$StoryDetails;

  factory CopyWith$Fragment$MaterialDetails$$StoryDetails.stub(TRes res) =
      _CopyWithStubImpl$Fragment$MaterialDetails$$StoryDetails;

  TRes call({
    List<Fragment$StoryPart>? parts,
    String? $__typename,
    Enum$MaterialType? type,
    String? title,
    String? description,
  });
  TRes parts(
      Iterable<Fragment$StoryPart> Function(
              Iterable<CopyWith$Fragment$StoryPart<Fragment$StoryPart>>)
          _fn);
}

class _CopyWithImpl$Fragment$MaterialDetails$$StoryDetails<TRes>
    implements CopyWith$Fragment$MaterialDetails$$StoryDetails<TRes> {
  _CopyWithImpl$Fragment$MaterialDetails$$StoryDetails(
    this._instance,
    this._then,
  );

  final Fragment$MaterialDetails$$StoryDetails _instance;

  final TRes Function(Fragment$MaterialDetails$$StoryDetails) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? parts = _undefined,
    Object? $__typename = _undefined,
    Object? type = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
  }) =>
      _then(Fragment$MaterialDetails$$StoryDetails(
        parts: parts == _undefined || parts == null
            ? _instance.parts
            : (parts as List<Fragment$StoryPart>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        type: type == _undefined || type == null
            ? _instance.type
            : (type as Enum$MaterialType),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        description: description == _undefined || description == null
            ? _instance.description
            : (description as String),
      ));

  TRes parts(
          Iterable<Fragment$StoryPart> Function(
                  Iterable<CopyWith$Fragment$StoryPart<Fragment$StoryPart>>)
              _fn) =>
      call(
          parts: _fn(_instance.parts.map((e) => CopyWith$Fragment$StoryPart(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Fragment$MaterialDetails$$StoryDetails<TRes>
    implements CopyWith$Fragment$MaterialDetails$$StoryDetails<TRes> {
  _CopyWithStubImpl$Fragment$MaterialDetails$$StoryDetails(this._res);

  TRes _res;

  call({
    List<Fragment$StoryPart>? parts,
    String? $__typename,
    Enum$MaterialType? type,
    String? title,
    String? description,
  }) =>
      _res;

  parts(_fn) => _res;
}

class Fragment$MaterialDetails$$QuizDetails
    implements Fragment$QuizDetails, Fragment$MaterialDetails {
  Fragment$MaterialDetails$$QuizDetails({
    this.preludes,
    required this.questions,
    this.$__typename = 'QuizDetails',
    required this.type,
    required this.title,
    required this.description,
  });

  factory Fragment$MaterialDetails$$QuizDetails.fromJson(
      Map<String, dynamic> json) {
    final l$preludes = json['preludes'];
    final l$questions = json['questions'];
    final l$$__typename = json['__typename'];
    final l$type = json['type'];
    final l$title = json['title'];
    final l$description = json['description'];
    return Fragment$MaterialDetails$$QuizDetails(
      preludes: (l$preludes as List<dynamic>?)
          ?.map(
              (e) => Fragment$QuizPrelude.fromJson((e as Map<String, dynamic>)))
          .toList(),
      questions: (l$questions as List<dynamic>)
          .map((e) =>
              Fragment$QuizQuestion.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
      type: fromJson$Enum$MaterialType((l$type as String)),
      title: (l$title as String),
      description: (l$description as String),
    );
  }

  final List<Fragment$QuizPrelude>? preludes;

  final List<Fragment$QuizQuestion> questions;

  final String $__typename;

  final Enum$MaterialType type;

  final String title;

  final String description;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$preludes = preludes;
    _resultData['preludes'] = l$preludes?.map((e) => e.toJson()).toList();
    final l$questions = questions;
    _resultData['questions'] = l$questions.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$type = type;
    _resultData['type'] = toJson$Enum$MaterialType(l$type);
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$preludes = preludes;
    final l$questions = questions;
    final l$$__typename = $__typename;
    final l$type = type;
    final l$title = title;
    final l$description = description;
    return Object.hashAll([
      l$preludes == null ? null : Object.hashAll(l$preludes.map((v) => v)),
      Object.hashAll(l$questions.map((v) => v)),
      l$$__typename,
      l$type,
      l$title,
      l$description,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$MaterialDetails$$QuizDetails ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$preludes = preludes;
    final lOther$preludes = other.preludes;
    if (l$preludes != null && lOther$preludes != null) {
      if (l$preludes.length != lOther$preludes.length) {
        return false;
      }
      for (int i = 0; i < l$preludes.length; i++) {
        final l$preludes$entry = l$preludes[i];
        final lOther$preludes$entry = lOther$preludes[i];
        if (l$preludes$entry != lOther$preludes$entry) {
          return false;
        }
      }
    } else if (l$preludes != lOther$preludes) {
      return false;
    }
    final l$questions = questions;
    final lOther$questions = other.questions;
    if (l$questions.length != lOther$questions.length) {
      return false;
    }
    for (int i = 0; i < l$questions.length; i++) {
      final l$questions$entry = l$questions[i];
      final lOther$questions$entry = lOther$questions[i];
      if (l$questions$entry != lOther$questions$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$MaterialDetails$$QuizDetails
    on Fragment$MaterialDetails$$QuizDetails {
  CopyWith$Fragment$MaterialDetails$$QuizDetails<
          Fragment$MaterialDetails$$QuizDetails>
      get copyWith => CopyWith$Fragment$MaterialDetails$$QuizDetails(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$MaterialDetails$$QuizDetails<TRes> {
  factory CopyWith$Fragment$MaterialDetails$$QuizDetails(
    Fragment$MaterialDetails$$QuizDetails instance,
    TRes Function(Fragment$MaterialDetails$$QuizDetails) then,
  ) = _CopyWithImpl$Fragment$MaterialDetails$$QuizDetails;

  factory CopyWith$Fragment$MaterialDetails$$QuizDetails.stub(TRes res) =
      _CopyWithStubImpl$Fragment$MaterialDetails$$QuizDetails;

  TRes call({
    List<Fragment$QuizPrelude>? preludes,
    List<Fragment$QuizQuestion>? questions,
    String? $__typename,
    Enum$MaterialType? type,
    String? title,
    String? description,
  });
  TRes preludes(
      Iterable<Fragment$QuizPrelude>? Function(
              Iterable<CopyWith$Fragment$QuizPrelude<Fragment$QuizPrelude>>?)
          _fn);
  TRes questions(
      Iterable<Fragment$QuizQuestion> Function(
              Iterable<CopyWith$Fragment$QuizQuestion<Fragment$QuizQuestion>>)
          _fn);
}

class _CopyWithImpl$Fragment$MaterialDetails$$QuizDetails<TRes>
    implements CopyWith$Fragment$MaterialDetails$$QuizDetails<TRes> {
  _CopyWithImpl$Fragment$MaterialDetails$$QuizDetails(
    this._instance,
    this._then,
  );

  final Fragment$MaterialDetails$$QuizDetails _instance;

  final TRes Function(Fragment$MaterialDetails$$QuizDetails) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? preludes = _undefined,
    Object? questions = _undefined,
    Object? $__typename = _undefined,
    Object? type = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
  }) =>
      _then(Fragment$MaterialDetails$$QuizDetails(
        preludes: preludes == _undefined
            ? _instance.preludes
            : (preludes as List<Fragment$QuizPrelude>?),
        questions: questions == _undefined || questions == null
            ? _instance.questions
            : (questions as List<Fragment$QuizQuestion>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        type: type == _undefined || type == null
            ? _instance.type
            : (type as Enum$MaterialType),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        description: description == _undefined || description == null
            ? _instance.description
            : (description as String),
      ));

  TRes preludes(
          Iterable<Fragment$QuizPrelude>? Function(
                  Iterable<
                      CopyWith$Fragment$QuizPrelude<Fragment$QuizPrelude>>?)
              _fn) =>
      call(
          preludes:
              _fn(_instance.preludes?.map((e) => CopyWith$Fragment$QuizPrelude(
                    e,
                    (i) => i,
                  )))?.toList());

  TRes questions(
          Iterable<Fragment$QuizQuestion> Function(
                  Iterable<
                      CopyWith$Fragment$QuizQuestion<Fragment$QuizQuestion>>)
              _fn) =>
      call(
          questions:
              _fn(_instance.questions.map((e) => CopyWith$Fragment$QuizQuestion(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Fragment$MaterialDetails$$QuizDetails<TRes>
    implements CopyWith$Fragment$MaterialDetails$$QuizDetails<TRes> {
  _CopyWithStubImpl$Fragment$MaterialDetails$$QuizDetails(this._res);

  TRes _res;

  call({
    List<Fragment$QuizPrelude>? preludes,
    List<Fragment$QuizQuestion>? questions,
    String? $__typename,
    Enum$MaterialType? type,
    String? title,
    String? description,
  }) =>
      _res;

  preludes(_fn) => _res;

  questions(_fn) => _res;
}

class Fragment$MaterialDetails$$ConversationDetails
    implements Fragment$ConversationDetails, Fragment$MaterialDetails {
  Fragment$MaterialDetails$$ConversationDetails({
    required this.instructions,
    required this.characters,
    this.$__typename = 'ConversationDetails',
    required this.type,
    required this.title,
    required this.description,
  });

  factory Fragment$MaterialDetails$$ConversationDetails.fromJson(
      Map<String, dynamic> json) {
    final l$instructions = json['instructions'];
    final l$characters = json['characters'];
    final l$$__typename = json['__typename'];
    final l$type = json['type'];
    final l$title = json['title'];
    final l$description = json['description'];
    return Fragment$MaterialDetails$$ConversationDetails(
      instructions: linguisticUnitSetFromJson(l$instructions),
      characters: (l$characters as List<dynamic>)
          .map((e) => Fragment$ConversationCharacter.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
      type: fromJson$Enum$MaterialType((l$type as String)),
      title: (l$title as String),
      description: (l$description as String),
    );
  }

  final LinguisticUnitSet instructions;

  final List<Fragment$ConversationCharacter> characters;

  final String $__typename;

  final Enum$MaterialType type;

  final String title;

  final String description;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$instructions = instructions;
    _resultData['instructions'] = linguisticUnitSetToJson(l$instructions);
    final l$characters = characters;
    _resultData['characters'] = l$characters.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$type = type;
    _resultData['type'] = toJson$Enum$MaterialType(l$type);
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$instructions = instructions;
    final l$characters = characters;
    final l$$__typename = $__typename;
    final l$type = type;
    final l$title = title;
    final l$description = description;
    return Object.hashAll([
      l$instructions,
      Object.hashAll(l$characters.map((v) => v)),
      l$$__typename,
      l$type,
      l$title,
      l$description,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$MaterialDetails$$ConversationDetails ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$instructions = instructions;
    final lOther$instructions = other.instructions;
    if (l$instructions != lOther$instructions) {
      return false;
    }
    final l$characters = characters;
    final lOther$characters = other.characters;
    if (l$characters.length != lOther$characters.length) {
      return false;
    }
    for (int i = 0; i < l$characters.length; i++) {
      final l$characters$entry = l$characters[i];
      final lOther$characters$entry = lOther$characters[i];
      if (l$characters$entry != lOther$characters$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$MaterialDetails$$ConversationDetails
    on Fragment$MaterialDetails$$ConversationDetails {
  CopyWith$Fragment$MaterialDetails$$ConversationDetails<
          Fragment$MaterialDetails$$ConversationDetails>
      get copyWith => CopyWith$Fragment$MaterialDetails$$ConversationDetails(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$MaterialDetails$$ConversationDetails<TRes> {
  factory CopyWith$Fragment$MaterialDetails$$ConversationDetails(
    Fragment$MaterialDetails$$ConversationDetails instance,
    TRes Function(Fragment$MaterialDetails$$ConversationDetails) then,
  ) = _CopyWithImpl$Fragment$MaterialDetails$$ConversationDetails;

  factory CopyWith$Fragment$MaterialDetails$$ConversationDetails.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$MaterialDetails$$ConversationDetails;

  TRes call({
    LinguisticUnitSet? instructions,
    List<Fragment$ConversationCharacter>? characters,
    String? $__typename,
    Enum$MaterialType? type,
    String? title,
    String? description,
  });
  TRes characters(
      Iterable<Fragment$ConversationCharacter> Function(
              Iterable<
                  CopyWith$Fragment$ConversationCharacter<
                      Fragment$ConversationCharacter>>)
          _fn);
}

class _CopyWithImpl$Fragment$MaterialDetails$$ConversationDetails<TRes>
    implements CopyWith$Fragment$MaterialDetails$$ConversationDetails<TRes> {
  _CopyWithImpl$Fragment$MaterialDetails$$ConversationDetails(
    this._instance,
    this._then,
  );

  final Fragment$MaterialDetails$$ConversationDetails _instance;

  final TRes Function(Fragment$MaterialDetails$$ConversationDetails) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? instructions = _undefined,
    Object? characters = _undefined,
    Object? $__typename = _undefined,
    Object? type = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
  }) =>
      _then(Fragment$MaterialDetails$$ConversationDetails(
        instructions: instructions == _undefined || instructions == null
            ? _instance.instructions
            : (instructions as LinguisticUnitSet),
        characters: characters == _undefined || characters == null
            ? _instance.characters
            : (characters as List<Fragment$ConversationCharacter>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        type: type == _undefined || type == null
            ? _instance.type
            : (type as Enum$MaterialType),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        description: description == _undefined || description == null
            ? _instance.description
            : (description as String),
      ));

  TRes characters(
          Iterable<Fragment$ConversationCharacter> Function(
                  Iterable<
                      CopyWith$Fragment$ConversationCharacter<
                          Fragment$ConversationCharacter>>)
              _fn) =>
      call(
          characters: _fn(_instance.characters
              .map((e) => CopyWith$Fragment$ConversationCharacter(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Fragment$MaterialDetails$$ConversationDetails<TRes>
    implements CopyWith$Fragment$MaterialDetails$$ConversationDetails<TRes> {
  _CopyWithStubImpl$Fragment$MaterialDetails$$ConversationDetails(this._res);

  TRes _res;

  call({
    LinguisticUnitSet? instructions,
    List<Fragment$ConversationCharacter>? characters,
    String? $__typename,
    Enum$MaterialType? type,
    String? title,
    String? description,
  }) =>
      _res;

  characters(_fn) => _res;
}

class Fragment$ConversationTurn {
  Fragment$ConversationTurn({
    required this.id,
    required this.createdAt,
    this.audio_ID,
    required this.character,
    this.text,
    this.nextTurn,
    this.$__typename = 'ConversationTurn',
  });

  factory Fragment$ConversationTurn.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$createdAt = json['createdAt'];
    final l$audio_ID = json['audio_ID'];
    final l$character = json['character'];
    final l$text = json['text'];
    final l$nextTurn = json['nextTurn'];
    final l$$__typename = json['__typename'];
    return Fragment$ConversationTurn(
      id: (l$id as String),
      createdAt: dateTimeFromJson(l$createdAt),
      audio_ID: (l$audio_ID as String?),
      character: (l$character as String),
      text: l$text == null ? null : linguisticUnitSetFromJson(l$text),
      nextTurn: (l$nextTurn as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final DateTime createdAt;

  final String? audio_ID;

  final String character;

  final LinguisticUnitSet? text;

  final String? nextTurn;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = dateTimeToJson(l$createdAt);
    final l$audio_ID = audio_ID;
    _resultData['audio_ID'] = l$audio_ID;
    final l$character = character;
    _resultData['character'] = l$character;
    final l$text = text;
    _resultData['text'] =
        l$text == null ? null : linguisticUnitSetToJson(l$text);
    final l$nextTurn = nextTurn;
    _resultData['nextTurn'] = l$nextTurn;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$createdAt = createdAt;
    final l$audio_ID = audio_ID;
    final l$character = character;
    final l$text = text;
    final l$nextTurn = nextTurn;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$createdAt,
      l$audio_ID,
      l$character,
      l$text,
      l$nextTurn,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$ConversationTurn ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$audio_ID = audio_ID;
    final lOther$audio_ID = other.audio_ID;
    if (l$audio_ID != lOther$audio_ID) {
      return false;
    }
    final l$character = character;
    final lOther$character = other.character;
    if (l$character != lOther$character) {
      return false;
    }
    final l$text = text;
    final lOther$text = other.text;
    if (l$text != lOther$text) {
      return false;
    }
    final l$nextTurn = nextTurn;
    final lOther$nextTurn = other.nextTurn;
    if (l$nextTurn != lOther$nextTurn) {
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

extension UtilityExtension$Fragment$ConversationTurn
    on Fragment$ConversationTurn {
  CopyWith$Fragment$ConversationTurn<Fragment$ConversationTurn> get copyWith =>
      CopyWith$Fragment$ConversationTurn(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$ConversationTurn<TRes> {
  factory CopyWith$Fragment$ConversationTurn(
    Fragment$ConversationTurn instance,
    TRes Function(Fragment$ConversationTurn) then,
  ) = _CopyWithImpl$Fragment$ConversationTurn;

  factory CopyWith$Fragment$ConversationTurn.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ConversationTurn;

  TRes call({
    String? id,
    DateTime? createdAt,
    String? audio_ID,
    String? character,
    LinguisticUnitSet? text,
    String? nextTurn,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$ConversationTurn<TRes>
    implements CopyWith$Fragment$ConversationTurn<TRes> {
  _CopyWithImpl$Fragment$ConversationTurn(
    this._instance,
    this._then,
  );

  final Fragment$ConversationTurn _instance;

  final TRes Function(Fragment$ConversationTurn) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? createdAt = _undefined,
    Object? audio_ID = _undefined,
    Object? character = _undefined,
    Object? text = _undefined,
    Object? nextTurn = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$ConversationTurn(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as DateTime),
        audio_ID:
            audio_ID == _undefined ? _instance.audio_ID : (audio_ID as String?),
        character: character == _undefined || character == null
            ? _instance.character
            : (character as String),
        text:
            text == _undefined ? _instance.text : (text as LinguisticUnitSet?),
        nextTurn:
            nextTurn == _undefined ? _instance.nextTurn : (nextTurn as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$ConversationTurn<TRes>
    implements CopyWith$Fragment$ConversationTurn<TRes> {
  _CopyWithStubImpl$Fragment$ConversationTurn(this._res);

  TRes _res;

  call({
    String? id,
    DateTime? createdAt,
    String? audio_ID,
    String? character,
    LinguisticUnitSet? text,
    String? nextTurn,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionConversationTurn = FragmentDefinitionNode(
  name: NameNode(value: 'ConversationTurn'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'ConversationTurn'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'id'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'audio_ID'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'character'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'text'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'nextTurn'),
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
);
const documentNodeFragmentConversationTurn = DocumentNode(definitions: [
  fragmentDefinitionConversationTurn,
]);

extension ClientExtension$Fragment$ConversationTurn on graphql.GraphQLClient {
  void writeFragment$ConversationTurn({
    required Fragment$ConversationTurn data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'ConversationTurn',
            document: documentNodeFragmentConversationTurn,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$ConversationTurn? readFragment$ConversationTurn({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'ConversationTurn',
          document: documentNodeFragmentConversationTurn,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$ConversationTurn.fromJson(result);
  }
}

class Fragment$ConversationUpdate {
  Fragment$ConversationUpdate({
    this.turn,
    this.nextTurn,
    this.$__typename = 'ConversationUpdate',
  });

  factory Fragment$ConversationUpdate.fromJson(Map<String, dynamic> json) {
    final l$turn = json['turn'];
    final l$nextTurn = json['nextTurn'];
    final l$$__typename = json['__typename'];
    return Fragment$ConversationUpdate(
      turn: l$turn == null
          ? null
          : Fragment$ConversationTurn.fromJson(
              (l$turn as Map<String, dynamic>)),
      nextTurn: (l$nextTurn as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$ConversationTurn? turn;

  final String? nextTurn;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$turn = turn;
    _resultData['turn'] = l$turn?.toJson();
    final l$nextTurn = nextTurn;
    _resultData['nextTurn'] = l$nextTurn;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$turn = turn;
    final l$nextTurn = nextTurn;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$turn,
      l$nextTurn,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$ConversationUpdate ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$turn = turn;
    final lOther$turn = other.turn;
    if (l$turn != lOther$turn) {
      return false;
    }
    final l$nextTurn = nextTurn;
    final lOther$nextTurn = other.nextTurn;
    if (l$nextTurn != lOther$nextTurn) {
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

extension UtilityExtension$Fragment$ConversationUpdate
    on Fragment$ConversationUpdate {
  CopyWith$Fragment$ConversationUpdate<Fragment$ConversationUpdate>
      get copyWith => CopyWith$Fragment$ConversationUpdate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$ConversationUpdate<TRes> {
  factory CopyWith$Fragment$ConversationUpdate(
    Fragment$ConversationUpdate instance,
    TRes Function(Fragment$ConversationUpdate) then,
  ) = _CopyWithImpl$Fragment$ConversationUpdate;

  factory CopyWith$Fragment$ConversationUpdate.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ConversationUpdate;

  TRes call({
    Fragment$ConversationTurn? turn,
    String? nextTurn,
    String? $__typename,
  });
  CopyWith$Fragment$ConversationTurn<TRes> get turn;
}

class _CopyWithImpl$Fragment$ConversationUpdate<TRes>
    implements CopyWith$Fragment$ConversationUpdate<TRes> {
  _CopyWithImpl$Fragment$ConversationUpdate(
    this._instance,
    this._then,
  );

  final Fragment$ConversationUpdate _instance;

  final TRes Function(Fragment$ConversationUpdate) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? turn = _undefined,
    Object? nextTurn = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$ConversationUpdate(
        turn: turn == _undefined
            ? _instance.turn
            : (turn as Fragment$ConversationTurn?),
        nextTurn:
            nextTurn == _undefined ? _instance.nextTurn : (nextTurn as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$ConversationTurn<TRes> get turn {
    final local$turn = _instance.turn;
    return local$turn == null
        ? CopyWith$Fragment$ConversationTurn.stub(_then(_instance))
        : CopyWith$Fragment$ConversationTurn(local$turn, (e) => call(turn: e));
  }
}

class _CopyWithStubImpl$Fragment$ConversationUpdate<TRes>
    implements CopyWith$Fragment$ConversationUpdate<TRes> {
  _CopyWithStubImpl$Fragment$ConversationUpdate(this._res);

  TRes _res;

  call({
    Fragment$ConversationTurn? turn,
    String? nextTurn,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$ConversationTurn<TRes> get turn =>
      CopyWith$Fragment$ConversationTurn.stub(_res);
}

const fragmentDefinitionConversationUpdate = FragmentDefinitionNode(
  name: NameNode(value: 'ConversationUpdate'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'ConversationUpdate'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'turn'),
      alias: null,
      arguments: [],
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
      name: NameNode(value: 'nextTurn'),
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
);
const documentNodeFragmentConversationUpdate = DocumentNode(definitions: [
  fragmentDefinitionConversationUpdate,
  fragmentDefinitionConversationTurn,
]);

extension ClientExtension$Fragment$ConversationUpdate on graphql.GraphQLClient {
  void writeFragment$ConversationUpdate({
    required Fragment$ConversationUpdate data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'ConversationUpdate',
            document: documentNodeFragmentConversationUpdate,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$ConversationUpdate? readFragment$ConversationUpdate({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'ConversationUpdate',
          document: documentNodeFragmentConversationUpdate,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$ConversationUpdate.fromJson(result);
  }
}

class Fragment$AnswerMaterialResponse {
  Fragment$AnswerMaterialResponse({
    this.newStage,
    this.$__typename = 'AnswerMaterialResponse',
  });

  factory Fragment$AnswerMaterialResponse.fromJson(Map<String, dynamic> json) {
    final l$newStage = json['newStage'];
    final l$$__typename = json['__typename'];
    return Fragment$AnswerMaterialResponse(
      newStage: l$newStage == null
          ? null
          : Fragment$DetailedStage.fromJson(
              (l$newStage as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$DetailedStage? newStage;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$newStage = newStage;
    _resultData['newStage'] = l$newStage?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$newStage = newStage;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$newStage,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$AnswerMaterialResponse ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$newStage = newStage;
    final lOther$newStage = other.newStage;
    if (l$newStage != lOther$newStage) {
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

extension UtilityExtension$Fragment$AnswerMaterialResponse
    on Fragment$AnswerMaterialResponse {
  CopyWith$Fragment$AnswerMaterialResponse<Fragment$AnswerMaterialResponse>
      get copyWith => CopyWith$Fragment$AnswerMaterialResponse(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$AnswerMaterialResponse<TRes> {
  factory CopyWith$Fragment$AnswerMaterialResponse(
    Fragment$AnswerMaterialResponse instance,
    TRes Function(Fragment$AnswerMaterialResponse) then,
  ) = _CopyWithImpl$Fragment$AnswerMaterialResponse;

  factory CopyWith$Fragment$AnswerMaterialResponse.stub(TRes res) =
      _CopyWithStubImpl$Fragment$AnswerMaterialResponse;

  TRes call({
    Fragment$DetailedStage? newStage,
    String? $__typename,
  });
  CopyWith$Fragment$DetailedStage<TRes> get newStage;
}

class _CopyWithImpl$Fragment$AnswerMaterialResponse<TRes>
    implements CopyWith$Fragment$AnswerMaterialResponse<TRes> {
  _CopyWithImpl$Fragment$AnswerMaterialResponse(
    this._instance,
    this._then,
  );

  final Fragment$AnswerMaterialResponse _instance;

  final TRes Function(Fragment$AnswerMaterialResponse) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? newStage = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$AnswerMaterialResponse(
        newStage: newStage == _undefined
            ? _instance.newStage
            : (newStage as Fragment$DetailedStage?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$DetailedStage<TRes> get newStage {
    final local$newStage = _instance.newStage;
    return local$newStage == null
        ? CopyWith$Fragment$DetailedStage.stub(_then(_instance))
        : CopyWith$Fragment$DetailedStage(
            local$newStage, (e) => call(newStage: e));
  }
}

class _CopyWithStubImpl$Fragment$AnswerMaterialResponse<TRes>
    implements CopyWith$Fragment$AnswerMaterialResponse<TRes> {
  _CopyWithStubImpl$Fragment$AnswerMaterialResponse(this._res);

  TRes _res;

  call({
    Fragment$DetailedStage? newStage,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$DetailedStage<TRes> get newStage =>
      CopyWith$Fragment$DetailedStage.stub(_res);
}

const fragmentDefinitionAnswerMaterialResponse = FragmentDefinitionNode(
  name: NameNode(value: 'AnswerMaterialResponse'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'AnswerMaterialResponse'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'newStage'),
      alias: null,
      arguments: [],
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
);
const documentNodeFragmentAnswerMaterialResponse = DocumentNode(definitions: [
  fragmentDefinitionAnswerMaterialResponse,
  fragmentDefinitionDetailedStage,
  fragmentDefinitionStage,
  fragmentDefinitionLevels,
  fragmentDefinitionStagePart,
  fragmentDefinitionStagePartMaterial,
  fragmentDefinitionStagePartDocumentation,
  fragmentDefinitionStageSentence,
  fragmentDefinitionStageWord,
]);

extension ClientExtension$Fragment$AnswerMaterialResponse
    on graphql.GraphQLClient {
  void writeFragment$AnswerMaterialResponse({
    required Fragment$AnswerMaterialResponse data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'AnswerMaterialResponse',
            document: documentNodeFragmentAnswerMaterialResponse,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$AnswerMaterialResponse? readFragment$AnswerMaterialResponse({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'AnswerMaterialResponse',
          document: documentNodeFragmentAnswerMaterialResponse,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Fragment$AnswerMaterialResponse.fromJson(result);
  }
}

class Fragment$UserDocExplanation {
  Fragment$UserDocExplanation({
    required this.type,
    this.ui,
    this.text,
    this.pictureId,
    this.audioId,
    this.$__typename = 'UserDocExplanation',
  });

  factory Fragment$UserDocExplanation.fromJson(Map<String, dynamic> json) {
    final l$type = json['type'];
    final l$ui = json['ui'];
    final l$text = json['text'];
    final l$pictureId = json['pictureId'];
    final l$audioId = json['audioId'];
    final l$$__typename = json['__typename'];
    return Fragment$UserDocExplanation(
      type: fromJson$Enum$UserDocExplanationType((l$type as String)),
      ui: l$ui == null
          ? null
          : fromJson$Enum$UserDocExplanationUI((l$ui as String)),
      text: (l$text as String?),
      pictureId: (l$pictureId as String?),
      audioId: (l$audioId as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final Enum$UserDocExplanationType type;

  final Enum$UserDocExplanationUI? ui;

  final String? text;

  final String? pictureId;

  final String? audioId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$type = type;
    _resultData['type'] = toJson$Enum$UserDocExplanationType(l$type);
    final l$ui = ui;
    _resultData['ui'] =
        l$ui == null ? null : toJson$Enum$UserDocExplanationUI(l$ui);
    final l$text = text;
    _resultData['text'] = l$text;
    final l$pictureId = pictureId;
    _resultData['pictureId'] = l$pictureId;
    final l$audioId = audioId;
    _resultData['audioId'] = l$audioId;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$type = type;
    final l$ui = ui;
    final l$text = text;
    final l$pictureId = pictureId;
    final l$audioId = audioId;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$type,
      l$ui,
      l$text,
      l$pictureId,
      l$audioId,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$UserDocExplanation ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$ui = ui;
    final lOther$ui = other.ui;
    if (l$ui != lOther$ui) {
      return false;
    }
    final l$text = text;
    final lOther$text = other.text;
    if (l$text != lOther$text) {
      return false;
    }
    final l$pictureId = pictureId;
    final lOther$pictureId = other.pictureId;
    if (l$pictureId != lOther$pictureId) {
      return false;
    }
    final l$audioId = audioId;
    final lOther$audioId = other.audioId;
    if (l$audioId != lOther$audioId) {
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

extension UtilityExtension$Fragment$UserDocExplanation
    on Fragment$UserDocExplanation {
  CopyWith$Fragment$UserDocExplanation<Fragment$UserDocExplanation>
      get copyWith => CopyWith$Fragment$UserDocExplanation(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$UserDocExplanation<TRes> {
  factory CopyWith$Fragment$UserDocExplanation(
    Fragment$UserDocExplanation instance,
    TRes Function(Fragment$UserDocExplanation) then,
  ) = _CopyWithImpl$Fragment$UserDocExplanation;

  factory CopyWith$Fragment$UserDocExplanation.stub(TRes res) =
      _CopyWithStubImpl$Fragment$UserDocExplanation;

  TRes call({
    Enum$UserDocExplanationType? type,
    Enum$UserDocExplanationUI? ui,
    String? text,
    String? pictureId,
    String? audioId,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$UserDocExplanation<TRes>
    implements CopyWith$Fragment$UserDocExplanation<TRes> {
  _CopyWithImpl$Fragment$UserDocExplanation(
    this._instance,
    this._then,
  );

  final Fragment$UserDocExplanation _instance;

  final TRes Function(Fragment$UserDocExplanation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? type = _undefined,
    Object? ui = _undefined,
    Object? text = _undefined,
    Object? pictureId = _undefined,
    Object? audioId = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$UserDocExplanation(
        type: type == _undefined || type == null
            ? _instance.type
            : (type as Enum$UserDocExplanationType),
        ui: ui == _undefined
            ? _instance.ui
            : (ui as Enum$UserDocExplanationUI?),
        text: text == _undefined ? _instance.text : (text as String?),
        pictureId: pictureId == _undefined
            ? _instance.pictureId
            : (pictureId as String?),
        audioId:
            audioId == _undefined ? _instance.audioId : (audioId as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$UserDocExplanation<TRes>
    implements CopyWith$Fragment$UserDocExplanation<TRes> {
  _CopyWithStubImpl$Fragment$UserDocExplanation(this._res);

  TRes _res;

  call({
    Enum$UserDocExplanationType? type,
    Enum$UserDocExplanationUI? ui,
    String? text,
    String? pictureId,
    String? audioId,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionUserDocExplanation = FragmentDefinitionNode(
  name: NameNode(value: 'UserDocExplanation'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'UserDocExplanation'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'type'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'ui'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'text'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'pictureId'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'audioId'),
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
);
const documentNodeFragmentUserDocExplanation = DocumentNode(definitions: [
  fragmentDefinitionUserDocExplanation,
]);

extension ClientExtension$Fragment$UserDocExplanation on graphql.GraphQLClient {
  void writeFragment$UserDocExplanation({
    required Fragment$UserDocExplanation data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'UserDocExplanation',
            document: documentNodeFragmentUserDocExplanation,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$UserDocExplanation? readFragment$UserDocExplanation({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'UserDocExplanation',
          document: documentNodeFragmentUserDocExplanation,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$UserDocExplanation.fromJson(result);
  }
}

class Fragment$UserDocTemplate {
  Fragment$UserDocTemplate({
    required this.id,
    required this.title,
    required this.description,
    required this.includes,
    required this.explanations,
    this.$__typename = 'UserDocTemplate',
  });

  factory Fragment$UserDocTemplate.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$includes = json['includes'];
    final l$explanations = json['explanations'];
    final l$$__typename = json['__typename'];
    return Fragment$UserDocTemplate(
      id: (l$id as String),
      title: (l$title as String),
      description: (l$description as String),
      includes:
          (l$includes as List<dynamic>).map((e) => (e as String)).toList(),
      explanations: (l$explanations as List<dynamic>)
          .map((e) =>
              Fragment$UserDocExplanation.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String description;

  final List<String> includes;

  final List<Fragment$UserDocExplanation> explanations;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$includes = includes;
    _resultData['includes'] = l$includes.map((e) => e).toList();
    final l$explanations = explanations;
    _resultData['explanations'] =
        l$explanations.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$description = description;
    final l$includes = includes;
    final l$explanations = explanations;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$description,
      Object.hashAll(l$includes.map((v) => v)),
      Object.hashAll(l$explanations.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$UserDocTemplate ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$includes = includes;
    final lOther$includes = other.includes;
    if (l$includes.length != lOther$includes.length) {
      return false;
    }
    for (int i = 0; i < l$includes.length; i++) {
      final l$includes$entry = l$includes[i];
      final lOther$includes$entry = lOther$includes[i];
      if (l$includes$entry != lOther$includes$entry) {
        return false;
      }
    }
    final l$explanations = explanations;
    final lOther$explanations = other.explanations;
    if (l$explanations.length != lOther$explanations.length) {
      return false;
    }
    for (int i = 0; i < l$explanations.length; i++) {
      final l$explanations$entry = l$explanations[i];
      final lOther$explanations$entry = lOther$explanations[i];
      if (l$explanations$entry != lOther$explanations$entry) {
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

extension UtilityExtension$Fragment$UserDocTemplate
    on Fragment$UserDocTemplate {
  CopyWith$Fragment$UserDocTemplate<Fragment$UserDocTemplate> get copyWith =>
      CopyWith$Fragment$UserDocTemplate(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$UserDocTemplate<TRes> {
  factory CopyWith$Fragment$UserDocTemplate(
    Fragment$UserDocTemplate instance,
    TRes Function(Fragment$UserDocTemplate) then,
  ) = _CopyWithImpl$Fragment$UserDocTemplate;

  factory CopyWith$Fragment$UserDocTemplate.stub(TRes res) =
      _CopyWithStubImpl$Fragment$UserDocTemplate;

  TRes call({
    String? id,
    String? title,
    String? description,
    List<String>? includes,
    List<Fragment$UserDocExplanation>? explanations,
    String? $__typename,
  });
  TRes explanations(
      Iterable<Fragment$UserDocExplanation> Function(
              Iterable<
                  CopyWith$Fragment$UserDocExplanation<
                      Fragment$UserDocExplanation>>)
          _fn);
}

class _CopyWithImpl$Fragment$UserDocTemplate<TRes>
    implements CopyWith$Fragment$UserDocTemplate<TRes> {
  _CopyWithImpl$Fragment$UserDocTemplate(
    this._instance,
    this._then,
  );

  final Fragment$UserDocTemplate _instance;

  final TRes Function(Fragment$UserDocTemplate) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? includes = _undefined,
    Object? explanations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$UserDocTemplate(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        description: description == _undefined || description == null
            ? _instance.description
            : (description as String),
        includes: includes == _undefined || includes == null
            ? _instance.includes
            : (includes as List<String>),
        explanations: explanations == _undefined || explanations == null
            ? _instance.explanations
            : (explanations as List<Fragment$UserDocExplanation>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes explanations(
          Iterable<Fragment$UserDocExplanation> Function(
                  Iterable<
                      CopyWith$Fragment$UserDocExplanation<
                          Fragment$UserDocExplanation>>)
              _fn) =>
      call(
          explanations: _fn(_instance.explanations
              .map((e) => CopyWith$Fragment$UserDocExplanation(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Fragment$UserDocTemplate<TRes>
    implements CopyWith$Fragment$UserDocTemplate<TRes> {
  _CopyWithStubImpl$Fragment$UserDocTemplate(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? description,
    List<String>? includes,
    List<Fragment$UserDocExplanation>? explanations,
    String? $__typename,
  }) =>
      _res;

  explanations(_fn) => _res;
}

const fragmentDefinitionUserDocTemplate = FragmentDefinitionNode(
  name: NameNode(value: 'UserDocTemplate'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'UserDocTemplate'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'id'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'title'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'description'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'includes'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'explanations'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FragmentSpreadNode(
          name: NameNode(value: 'UserDocExplanation'),
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
);
const documentNodeFragmentUserDocTemplate = DocumentNode(definitions: [
  fragmentDefinitionUserDocTemplate,
  fragmentDefinitionUserDocExplanation,
]);

extension ClientExtension$Fragment$UserDocTemplate on graphql.GraphQLClient {
  void writeFragment$UserDocTemplate({
    required Fragment$UserDocTemplate data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'UserDocTemplate',
            document: documentNodeFragmentUserDocTemplate,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$UserDocTemplate? readFragment$UserDocTemplate({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'UserDocTemplate',
          document: documentNodeFragmentUserDocTemplate,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$UserDocTemplate.fromJson(result);
  }
}

class Fragment$UserDoc {
  Fragment$UserDoc({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.template_ID,
    required this.user_ID,
    required this.journey_ID,
    required this.template,
    this.$__typename = 'UserDoc',
  });

  factory Fragment$UserDoc.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$template_ID = json['template_ID'];
    final l$user_ID = json['user_ID'];
    final l$journey_ID = json['journey_ID'];
    final l$template = json['template'];
    final l$$__typename = json['__typename'];
    return Fragment$UserDoc(
      id: (l$id as String),
      createdAt: dateTimeFromJson(l$createdAt),
      updatedAt: dateTimeFromJson(l$updatedAt),
      template_ID: (l$template_ID as String),
      user_ID: (l$user_ID as String),
      journey_ID: (l$journey_ID as String),
      template: Fragment$UserDocTemplate.fromJson(
          (l$template as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final DateTime createdAt;

  final DateTime updatedAt;

  final String template_ID;

  final String user_ID;

  final String journey_ID;

  final Fragment$UserDocTemplate template;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = dateTimeToJson(l$createdAt);
    final l$updatedAt = updatedAt;
    _resultData['updatedAt'] = dateTimeToJson(l$updatedAt);
    final l$template_ID = template_ID;
    _resultData['template_ID'] = l$template_ID;
    final l$user_ID = user_ID;
    _resultData['user_ID'] = l$user_ID;
    final l$journey_ID = journey_ID;
    _resultData['journey_ID'] = l$journey_ID;
    final l$template = template;
    _resultData['template'] = l$template.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$createdAt = createdAt;
    final l$updatedAt = updatedAt;
    final l$template_ID = template_ID;
    final l$user_ID = user_ID;
    final l$journey_ID = journey_ID;
    final l$template = template;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$createdAt,
      l$updatedAt,
      l$template_ID,
      l$user_ID,
      l$journey_ID,
      l$template,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$UserDoc || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$updatedAt = updatedAt;
    final lOther$updatedAt = other.updatedAt;
    if (l$updatedAt != lOther$updatedAt) {
      return false;
    }
    final l$template_ID = template_ID;
    final lOther$template_ID = other.template_ID;
    if (l$template_ID != lOther$template_ID) {
      return false;
    }
    final l$user_ID = user_ID;
    final lOther$user_ID = other.user_ID;
    if (l$user_ID != lOther$user_ID) {
      return false;
    }
    final l$journey_ID = journey_ID;
    final lOther$journey_ID = other.journey_ID;
    if (l$journey_ID != lOther$journey_ID) {
      return false;
    }
    final l$template = template;
    final lOther$template = other.template;
    if (l$template != lOther$template) {
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

extension UtilityExtension$Fragment$UserDoc on Fragment$UserDoc {
  CopyWith$Fragment$UserDoc<Fragment$UserDoc> get copyWith =>
      CopyWith$Fragment$UserDoc(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$UserDoc<TRes> {
  factory CopyWith$Fragment$UserDoc(
    Fragment$UserDoc instance,
    TRes Function(Fragment$UserDoc) then,
  ) = _CopyWithImpl$Fragment$UserDoc;

  factory CopyWith$Fragment$UserDoc.stub(TRes res) =
      _CopyWithStubImpl$Fragment$UserDoc;

  TRes call({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? template_ID,
    String? user_ID,
    String? journey_ID,
    Fragment$UserDocTemplate? template,
    String? $__typename,
  });
  CopyWith$Fragment$UserDocTemplate<TRes> get template;
}

class _CopyWithImpl$Fragment$UserDoc<TRes>
    implements CopyWith$Fragment$UserDoc<TRes> {
  _CopyWithImpl$Fragment$UserDoc(
    this._instance,
    this._then,
  );

  final Fragment$UserDoc _instance;

  final TRes Function(Fragment$UserDoc) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? template_ID = _undefined,
    Object? user_ID = _undefined,
    Object? journey_ID = _undefined,
    Object? template = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$UserDoc(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as DateTime),
        updatedAt: updatedAt == _undefined || updatedAt == null
            ? _instance.updatedAt
            : (updatedAt as DateTime),
        template_ID: template_ID == _undefined || template_ID == null
            ? _instance.template_ID
            : (template_ID as String),
        user_ID: user_ID == _undefined || user_ID == null
            ? _instance.user_ID
            : (user_ID as String),
        journey_ID: journey_ID == _undefined || journey_ID == null
            ? _instance.journey_ID
            : (journey_ID as String),
        template: template == _undefined || template == null
            ? _instance.template
            : (template as Fragment$UserDocTemplate),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$UserDocTemplate<TRes> get template {
    final local$template = _instance.template;
    return CopyWith$Fragment$UserDocTemplate(
        local$template, (e) => call(template: e));
  }
}

class _CopyWithStubImpl$Fragment$UserDoc<TRes>
    implements CopyWith$Fragment$UserDoc<TRes> {
  _CopyWithStubImpl$Fragment$UserDoc(this._res);

  TRes _res;

  call({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? template_ID,
    String? user_ID,
    String? journey_ID,
    Fragment$UserDocTemplate? template,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$UserDocTemplate<TRes> get template =>
      CopyWith$Fragment$UserDocTemplate.stub(_res);
}

const fragmentDefinitionUserDoc = FragmentDefinitionNode(
  name: NameNode(value: 'UserDoc'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'UserDoc'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'id'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'updatedAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'template_ID'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'user_ID'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'journey_ID'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'template'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FragmentSpreadNode(
          name: NameNode(value: 'UserDocTemplate'),
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
);
const documentNodeFragmentUserDoc = DocumentNode(definitions: [
  fragmentDefinitionUserDoc,
  fragmentDefinitionUserDocTemplate,
  fragmentDefinitionUserDocExplanation,
]);

extension ClientExtension$Fragment$UserDoc on graphql.GraphQLClient {
  void writeFragment$UserDoc({
    required Fragment$UserDoc data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'UserDoc',
            document: documentNodeFragmentUserDoc,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$UserDoc? readFragment$UserDoc({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'UserDoc',
          document: documentNodeFragmentUserDoc,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$UserDoc.fromJson(result);
  }
}

class Fragment$ModelSet {
  Fragment$ModelSet({
    required this.id,
    required this.name,
    required this.description,
    this.$__typename = 'ModelSet',
  });

  factory Fragment$ModelSet.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$$__typename = json['__typename'];
    return Fragment$ModelSet(
      id: (l$id as String),
      name: (l$name as String),
      description: (l$description as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String description;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$description = description;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$description,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$ModelSet || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
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

extension UtilityExtension$Fragment$ModelSet on Fragment$ModelSet {
  CopyWith$Fragment$ModelSet<Fragment$ModelSet> get copyWith =>
      CopyWith$Fragment$ModelSet(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$ModelSet<TRes> {
  factory CopyWith$Fragment$ModelSet(
    Fragment$ModelSet instance,
    TRes Function(Fragment$ModelSet) then,
  ) = _CopyWithImpl$Fragment$ModelSet;

  factory CopyWith$Fragment$ModelSet.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ModelSet;

  TRes call({
    String? id,
    String? name,
    String? description,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$ModelSet<TRes>
    implements CopyWith$Fragment$ModelSet<TRes> {
  _CopyWithImpl$Fragment$ModelSet(
    this._instance,
    this._then,
  );

  final Fragment$ModelSet _instance;

  final TRes Function(Fragment$ModelSet) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$ModelSet(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        description: description == _undefined || description == null
            ? _instance.description
            : (description as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$ModelSet<TRes>
    implements CopyWith$Fragment$ModelSet<TRes> {
  _CopyWithStubImpl$Fragment$ModelSet(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? description,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionModelSet = FragmentDefinitionNode(
  name: NameNode(value: 'ModelSet'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'ModelSet'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'id'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'name'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'description'),
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
);
const documentNodeFragmentModelSet = DocumentNode(definitions: [
  fragmentDefinitionModelSet,
]);

extension ClientExtension$Fragment$ModelSet on graphql.GraphQLClient {
  void writeFragment$ModelSet({
    required Fragment$ModelSet data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'ModelSet',
            document: documentNodeFragmentModelSet,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$ModelSet? readFragment$ModelSet({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'ModelSet',
          document: documentNodeFragmentModelSet,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$ModelSet.fromJson(result);
  }
}

class Fragment$SupportedLanguage {
  Fragment$SupportedLanguage({
    required this.id,
    required this.name,
    required this.tag,
    required this.direction,
    this.country,
    this.$__typename = 'SupportedLanguage',
  });

  factory Fragment$SupportedLanguage.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$tag = json['tag'];
    final l$direction = json['direction'];
    final l$country = json['country'];
    final l$$__typename = json['__typename'];
    return Fragment$SupportedLanguage(
      id: (l$id as String),
      name: (l$name as String),
      tag: (l$tag as String),
      direction: (l$direction as String),
      country: (l$country as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String tag;

  final String direction;

  final String? country;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$tag = tag;
    _resultData['tag'] = l$tag;
    final l$direction = direction;
    _resultData['direction'] = l$direction;
    final l$country = country;
    _resultData['country'] = l$country;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$tag = tag;
    final l$direction = direction;
    final l$country = country;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$tag,
      l$direction,
      l$country,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$SupportedLanguage ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$tag = tag;
    final lOther$tag = other.tag;
    if (l$tag != lOther$tag) {
      return false;
    }
    final l$direction = direction;
    final lOther$direction = other.direction;
    if (l$direction != lOther$direction) {
      return false;
    }
    final l$country = country;
    final lOther$country = other.country;
    if (l$country != lOther$country) {
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

extension UtilityExtension$Fragment$SupportedLanguage
    on Fragment$SupportedLanguage {
  CopyWith$Fragment$SupportedLanguage<Fragment$SupportedLanguage>
      get copyWith => CopyWith$Fragment$SupportedLanguage(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$SupportedLanguage<TRes> {
  factory CopyWith$Fragment$SupportedLanguage(
    Fragment$SupportedLanguage instance,
    TRes Function(Fragment$SupportedLanguage) then,
  ) = _CopyWithImpl$Fragment$SupportedLanguage;

  factory CopyWith$Fragment$SupportedLanguage.stub(TRes res) =
      _CopyWithStubImpl$Fragment$SupportedLanguage;

  TRes call({
    String? id,
    String? name,
    String? tag,
    String? direction,
    String? country,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$SupportedLanguage<TRes>
    implements CopyWith$Fragment$SupportedLanguage<TRes> {
  _CopyWithImpl$Fragment$SupportedLanguage(
    this._instance,
    this._then,
  );

  final Fragment$SupportedLanguage _instance;

  final TRes Function(Fragment$SupportedLanguage) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? tag = _undefined,
    Object? direction = _undefined,
    Object? country = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$SupportedLanguage(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        tag: tag == _undefined || tag == null ? _instance.tag : (tag as String),
        direction: direction == _undefined || direction == null
            ? _instance.direction
            : (direction as String),
        country:
            country == _undefined ? _instance.country : (country as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$SupportedLanguage<TRes>
    implements CopyWith$Fragment$SupportedLanguage<TRes> {
  _CopyWithStubImpl$Fragment$SupportedLanguage(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? tag,
    String? direction,
    String? country,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionSupportedLanguage = FragmentDefinitionNode(
  name: NameNode(value: 'SupportedLanguage'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'SupportedLanguage'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'id'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'name'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'tag'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'direction'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'country'),
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
);
const documentNodeFragmentSupportedLanguage = DocumentNode(definitions: [
  fragmentDefinitionSupportedLanguage,
]);

extension ClientExtension$Fragment$SupportedLanguage on graphql.GraphQLClient {
  void writeFragment$SupportedLanguage({
    required Fragment$SupportedLanguage data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'SupportedLanguage',
            document: documentNodeFragmentSupportedLanguage,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$SupportedLanguage? readFragment$SupportedLanguage({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'SupportedLanguage',
          document: documentNodeFragmentSupportedLanguage,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$SupportedLanguage.fromJson(result);
  }
}

class Fragment$DetailedSupportedLanguage implements Fragment$SupportedLanguage {
  Fragment$DetailedSupportedLanguage({
    required this.sentences_to_voice,
    required this.sentences_to_translate,
    required this.id,
    required this.name,
    required this.tag,
    required this.direction,
    this.country,
    this.$__typename = 'SupportedLanguage',
  });

  factory Fragment$DetailedSupportedLanguage.fromJson(
      Map<String, dynamic> json) {
    final l$sentences_to_voice = json['sentences_to_voice'];
    final l$sentences_to_translate = json['sentences_to_translate'];
    final l$id = json['id'];
    final l$name = json['name'];
    final l$tag = json['tag'];
    final l$direction = json['direction'];
    final l$country = json['country'];
    final l$$__typename = json['__typename'];
    return Fragment$DetailedSupportedLanguage(
      sentences_to_voice: (l$sentences_to_voice as List<dynamic>)
          .map((e) => (e as String))
          .toList(),
      sentences_to_translate: (l$sentences_to_translate as List<dynamic>)
          .map((e) => (e as String))
          .toList(),
      id: (l$id as String),
      name: (l$name as String),
      tag: (l$tag as String),
      direction: (l$direction as String),
      country: (l$country as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final List<String> sentences_to_voice;

  final List<String> sentences_to_translate;

  final String id;

  final String name;

  final String tag;

  final String direction;

  final String? country;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$sentences_to_voice = sentences_to_voice;
    _resultData['sentences_to_voice'] =
        l$sentences_to_voice.map((e) => e).toList();
    final l$sentences_to_translate = sentences_to_translate;
    _resultData['sentences_to_translate'] =
        l$sentences_to_translate.map((e) => e).toList();
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$tag = tag;
    _resultData['tag'] = l$tag;
    final l$direction = direction;
    _resultData['direction'] = l$direction;
    final l$country = country;
    _resultData['country'] = l$country;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$sentences_to_voice = sentences_to_voice;
    final l$sentences_to_translate = sentences_to_translate;
    final l$id = id;
    final l$name = name;
    final l$tag = tag;
    final l$direction = direction;
    final l$country = country;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$sentences_to_voice.map((v) => v)),
      Object.hashAll(l$sentences_to_translate.map((v) => v)),
      l$id,
      l$name,
      l$tag,
      l$direction,
      l$country,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$DetailedSupportedLanguage ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$sentences_to_voice = sentences_to_voice;
    final lOther$sentences_to_voice = other.sentences_to_voice;
    if (l$sentences_to_voice.length != lOther$sentences_to_voice.length) {
      return false;
    }
    for (int i = 0; i < l$sentences_to_voice.length; i++) {
      final l$sentences_to_voice$entry = l$sentences_to_voice[i];
      final lOther$sentences_to_voice$entry = lOther$sentences_to_voice[i];
      if (l$sentences_to_voice$entry != lOther$sentences_to_voice$entry) {
        return false;
      }
    }
    final l$sentences_to_translate = sentences_to_translate;
    final lOther$sentences_to_translate = other.sentences_to_translate;
    if (l$sentences_to_translate.length !=
        lOther$sentences_to_translate.length) {
      return false;
    }
    for (int i = 0; i < l$sentences_to_translate.length; i++) {
      final l$sentences_to_translate$entry = l$sentences_to_translate[i];
      final lOther$sentences_to_translate$entry =
          lOther$sentences_to_translate[i];
      if (l$sentences_to_translate$entry !=
          lOther$sentences_to_translate$entry) {
        return false;
      }
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$tag = tag;
    final lOther$tag = other.tag;
    if (l$tag != lOther$tag) {
      return false;
    }
    final l$direction = direction;
    final lOther$direction = other.direction;
    if (l$direction != lOther$direction) {
      return false;
    }
    final l$country = country;
    final lOther$country = other.country;
    if (l$country != lOther$country) {
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

extension UtilityExtension$Fragment$DetailedSupportedLanguage
    on Fragment$DetailedSupportedLanguage {
  CopyWith$Fragment$DetailedSupportedLanguage<
          Fragment$DetailedSupportedLanguage>
      get copyWith => CopyWith$Fragment$DetailedSupportedLanguage(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$DetailedSupportedLanguage<TRes> {
  factory CopyWith$Fragment$DetailedSupportedLanguage(
    Fragment$DetailedSupportedLanguage instance,
    TRes Function(Fragment$DetailedSupportedLanguage) then,
  ) = _CopyWithImpl$Fragment$DetailedSupportedLanguage;

  factory CopyWith$Fragment$DetailedSupportedLanguage.stub(TRes res) =
      _CopyWithStubImpl$Fragment$DetailedSupportedLanguage;

  TRes call({
    List<String>? sentences_to_voice,
    List<String>? sentences_to_translate,
    String? id,
    String? name,
    String? tag,
    String? direction,
    String? country,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$DetailedSupportedLanguage<TRes>
    implements CopyWith$Fragment$DetailedSupportedLanguage<TRes> {
  _CopyWithImpl$Fragment$DetailedSupportedLanguage(
    this._instance,
    this._then,
  );

  final Fragment$DetailedSupportedLanguage _instance;

  final TRes Function(Fragment$DetailedSupportedLanguage) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? sentences_to_voice = _undefined,
    Object? sentences_to_translate = _undefined,
    Object? id = _undefined,
    Object? name = _undefined,
    Object? tag = _undefined,
    Object? direction = _undefined,
    Object? country = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$DetailedSupportedLanguage(
        sentences_to_voice:
            sentences_to_voice == _undefined || sentences_to_voice == null
                ? _instance.sentences_to_voice
                : (sentences_to_voice as List<String>),
        sentences_to_translate: sentences_to_translate == _undefined ||
                sentences_to_translate == null
            ? _instance.sentences_to_translate
            : (sentences_to_translate as List<String>),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        tag: tag == _undefined || tag == null ? _instance.tag : (tag as String),
        direction: direction == _undefined || direction == null
            ? _instance.direction
            : (direction as String),
        country:
            country == _undefined ? _instance.country : (country as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$DetailedSupportedLanguage<TRes>
    implements CopyWith$Fragment$DetailedSupportedLanguage<TRes> {
  _CopyWithStubImpl$Fragment$DetailedSupportedLanguage(this._res);

  TRes _res;

  call({
    List<String>? sentences_to_voice,
    List<String>? sentences_to_translate,
    String? id,
    String? name,
    String? tag,
    String? direction,
    String? country,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionDetailedSupportedLanguage = FragmentDefinitionNode(
  name: NameNode(value: 'DetailedSupportedLanguage'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'SupportedLanguage'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'sentences_to_voice'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'sentences_to_translate'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FragmentSpreadNode(
      name: NameNode(value: 'SupportedLanguage'),
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
);
const documentNodeFragmentDetailedSupportedLanguage =
    DocumentNode(definitions: [
  fragmentDefinitionDetailedSupportedLanguage,
  fragmentDefinitionSupportedLanguage,
]);

extension ClientExtension$Fragment$DetailedSupportedLanguage
    on graphql.GraphQLClient {
  void writeFragment$DetailedSupportedLanguage({
    required Fragment$DetailedSupportedLanguage data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'DetailedSupportedLanguage',
            document: documentNodeFragmentDetailedSupportedLanguage,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$DetailedSupportedLanguage? readFragment$DetailedSupportedLanguage({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'DetailedSupportedLanguage',
          document: documentNodeFragmentDetailedSupportedLanguage,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Fragment$DetailedSupportedLanguage.fromJson(result);
  }
}

class Fragment$SupportedLocale {
  Fragment$SupportedLocale({
    required this.id,
    required this.name,
    required this.tag,
    this.country,
    required this.direction,
    this.$__typename = 'SupportedLocale',
  });

  factory Fragment$SupportedLocale.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$tag = json['tag'];
    final l$country = json['country'];
    final l$direction = json['direction'];
    final l$$__typename = json['__typename'];
    return Fragment$SupportedLocale(
      id: (l$id as String),
      name: (l$name as String),
      tag: (l$tag as String),
      country: (l$country as String?),
      direction: (l$direction as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String tag;

  final String? country;

  final String direction;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$tag = tag;
    _resultData['tag'] = l$tag;
    final l$country = country;
    _resultData['country'] = l$country;
    final l$direction = direction;
    _resultData['direction'] = l$direction;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$tag = tag;
    final l$country = country;
    final l$direction = direction;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$tag,
      l$country,
      l$direction,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$SupportedLocale ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$tag = tag;
    final lOther$tag = other.tag;
    if (l$tag != lOther$tag) {
      return false;
    }
    final l$country = country;
    final lOther$country = other.country;
    if (l$country != lOther$country) {
      return false;
    }
    final l$direction = direction;
    final lOther$direction = other.direction;
    if (l$direction != lOther$direction) {
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

extension UtilityExtension$Fragment$SupportedLocale
    on Fragment$SupportedLocale {
  CopyWith$Fragment$SupportedLocale<Fragment$SupportedLocale> get copyWith =>
      CopyWith$Fragment$SupportedLocale(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$SupportedLocale<TRes> {
  factory CopyWith$Fragment$SupportedLocale(
    Fragment$SupportedLocale instance,
    TRes Function(Fragment$SupportedLocale) then,
  ) = _CopyWithImpl$Fragment$SupportedLocale;

  factory CopyWith$Fragment$SupportedLocale.stub(TRes res) =
      _CopyWithStubImpl$Fragment$SupportedLocale;

  TRes call({
    String? id,
    String? name,
    String? tag,
    String? country,
    String? direction,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$SupportedLocale<TRes>
    implements CopyWith$Fragment$SupportedLocale<TRes> {
  _CopyWithImpl$Fragment$SupportedLocale(
    this._instance,
    this._then,
  );

  final Fragment$SupportedLocale _instance;

  final TRes Function(Fragment$SupportedLocale) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? tag = _undefined,
    Object? country = _undefined,
    Object? direction = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$SupportedLocale(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        tag: tag == _undefined || tag == null ? _instance.tag : (tag as String),
        country:
            country == _undefined ? _instance.country : (country as String?),
        direction: direction == _undefined || direction == null
            ? _instance.direction
            : (direction as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$SupportedLocale<TRes>
    implements CopyWith$Fragment$SupportedLocale<TRes> {
  _CopyWithStubImpl$Fragment$SupportedLocale(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? tag,
    String? country,
    String? direction,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionSupportedLocale = FragmentDefinitionNode(
  name: NameNode(value: 'SupportedLocale'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'SupportedLocale'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'id'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'name'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'tag'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'country'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'direction'),
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
);
const documentNodeFragmentSupportedLocale = DocumentNode(definitions: [
  fragmentDefinitionSupportedLocale,
]);

extension ClientExtension$Fragment$SupportedLocale on graphql.GraphQLClient {
  void writeFragment$SupportedLocale({
    required Fragment$SupportedLocale data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'SupportedLocale',
            document: documentNodeFragmentSupportedLocale,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$SupportedLocale? readFragment$SupportedLocale({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'SupportedLocale',
          document: documentNodeFragmentSupportedLocale,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$SupportedLocale.fromJson(result);
  }
}
