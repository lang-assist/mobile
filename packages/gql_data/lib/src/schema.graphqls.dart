import 'package:api/api.dart';

class Input$LoginEmailRequest {
  factory Input$LoginEmailRequest({
    required String email,
    required String password,
  }) =>
      Input$LoginEmailRequest._({
        r'email': email,
        r'password': password,
      });

  Input$LoginEmailRequest._(this._$data);

  factory Input$LoginEmailRequest.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    final l$password = data['password'];
    result$data['password'] = (l$password as String);
    return Input$LoginEmailRequest._(result$data);
  }

  Map<String, dynamic> _$data;

  String get email => (_$data['email'] as String);

  String get password => (_$data['password'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$email = email;
    result$data['email'] = l$email;
    final l$password = password;
    result$data['password'] = l$password;
    return result$data;
  }

  CopyWith$Input$LoginEmailRequest<Input$LoginEmailRequest> get copyWith =>
      CopyWith$Input$LoginEmailRequest(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$LoginEmailRequest || runtimeType != other.runtimeType) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$password = password;
    final lOther$password = other.password;
    if (l$password != lOther$password) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$email = email;
    final l$password = password;
    return Object.hashAll([
      l$email,
      l$password,
    ]);
  }
}

abstract class CopyWith$Input$LoginEmailRequest<TRes> {
  factory CopyWith$Input$LoginEmailRequest(
    Input$LoginEmailRequest instance,
    TRes Function(Input$LoginEmailRequest) then,
  ) = _CopyWithImpl$Input$LoginEmailRequest;

  factory CopyWith$Input$LoginEmailRequest.stub(TRes res) =
      _CopyWithStubImpl$Input$LoginEmailRequest;

  TRes call({
    String? email,
    String? password,
  });
}

class _CopyWithImpl$Input$LoginEmailRequest<TRes>
    implements CopyWith$Input$LoginEmailRequest<TRes> {
  _CopyWithImpl$Input$LoginEmailRequest(
    this._instance,
    this._then,
  );

  final Input$LoginEmailRequest _instance;

  final TRes Function(Input$LoginEmailRequest) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? email = _undefined,
    Object? password = _undefined,
  }) =>
      _then(Input$LoginEmailRequest._({
        ..._instance._$data,
        if (email != _undefined && email != null) 'email': (email as String),
        if (password != _undefined && password != null)
          'password': (password as String),
      }));
}

class _CopyWithStubImpl$Input$LoginEmailRequest<TRes>
    implements CopyWith$Input$LoginEmailRequest<TRes> {
  _CopyWithStubImpl$Input$LoginEmailRequest(this._res);

  TRes _res;

  call({
    String? email,
    String? password,
  }) =>
      _res;
}

class Input$LoginPhoneRequest {
  factory Input$LoginPhoneRequest({
    required String phone,
    required String password,
  }) =>
      Input$LoginPhoneRequest._({
        r'phone': phone,
        r'password': password,
      });

  Input$LoginPhoneRequest._(this._$data);

  factory Input$LoginPhoneRequest.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$phone = data['phone'];
    result$data['phone'] = (l$phone as String);
    final l$password = data['password'];
    result$data['password'] = (l$password as String);
    return Input$LoginPhoneRequest._(result$data);
  }

  Map<String, dynamic> _$data;

  String get phone => (_$data['phone'] as String);

  String get password => (_$data['password'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$phone = phone;
    result$data['phone'] = l$phone;
    final l$password = password;
    result$data['password'] = l$password;
    return result$data;
  }

  CopyWith$Input$LoginPhoneRequest<Input$LoginPhoneRequest> get copyWith =>
      CopyWith$Input$LoginPhoneRequest(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$LoginPhoneRequest || runtimeType != other.runtimeType) {
      return false;
    }
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) {
      return false;
    }
    final l$password = password;
    final lOther$password = other.password;
    if (l$password != lOther$password) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$phone = phone;
    final l$password = password;
    return Object.hashAll([
      l$phone,
      l$password,
    ]);
  }
}

abstract class CopyWith$Input$LoginPhoneRequest<TRes> {
  factory CopyWith$Input$LoginPhoneRequest(
    Input$LoginPhoneRequest instance,
    TRes Function(Input$LoginPhoneRequest) then,
  ) = _CopyWithImpl$Input$LoginPhoneRequest;

  factory CopyWith$Input$LoginPhoneRequest.stub(TRes res) =
      _CopyWithStubImpl$Input$LoginPhoneRequest;

  TRes call({
    String? phone,
    String? password,
  });
}

class _CopyWithImpl$Input$LoginPhoneRequest<TRes>
    implements CopyWith$Input$LoginPhoneRequest<TRes> {
  _CopyWithImpl$Input$LoginPhoneRequest(
    this._instance,
    this._then,
  );

  final Input$LoginPhoneRequest _instance;

  final TRes Function(Input$LoginPhoneRequest) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? phone = _undefined,
    Object? password = _undefined,
  }) =>
      _then(Input$LoginPhoneRequest._({
        ..._instance._$data,
        if (phone != _undefined && phone != null) 'phone': (phone as String),
        if (password != _undefined && password != null)
          'password': (password as String),
      }));
}

class _CopyWithStubImpl$Input$LoginPhoneRequest<TRes>
    implements CopyWith$Input$LoginPhoneRequest<TRes> {
  _CopyWithStubImpl$Input$LoginPhoneRequest(this._res);

  TRes _res;

  call({
    String? phone,
    String? password,
  }) =>
      _res;
}

class Input$LoginGoogleRequest {
  factory Input$LoginGoogleRequest({required String code}) =>
      Input$LoginGoogleRequest._({
        r'code': code,
      });

  Input$LoginGoogleRequest._(this._$data);

  factory Input$LoginGoogleRequest.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$code = data['code'];
    result$data['code'] = (l$code as String);
    return Input$LoginGoogleRequest._(result$data);
  }

  Map<String, dynamic> _$data;

  String get code => (_$data['code'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$code = code;
    result$data['code'] = l$code;
    return result$data;
  }

  CopyWith$Input$LoginGoogleRequest<Input$LoginGoogleRequest> get copyWith =>
      CopyWith$Input$LoginGoogleRequest(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$LoginGoogleRequest ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$code = code;
    return Object.hashAll([l$code]);
  }
}

abstract class CopyWith$Input$LoginGoogleRequest<TRes> {
  factory CopyWith$Input$LoginGoogleRequest(
    Input$LoginGoogleRequest instance,
    TRes Function(Input$LoginGoogleRequest) then,
  ) = _CopyWithImpl$Input$LoginGoogleRequest;

  factory CopyWith$Input$LoginGoogleRequest.stub(TRes res) =
      _CopyWithStubImpl$Input$LoginGoogleRequest;

  TRes call({String? code});
}

class _CopyWithImpl$Input$LoginGoogleRequest<TRes>
    implements CopyWith$Input$LoginGoogleRequest<TRes> {
  _CopyWithImpl$Input$LoginGoogleRequest(
    this._instance,
    this._then,
  );

  final Input$LoginGoogleRequest _instance;

  final TRes Function(Input$LoginGoogleRequest) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? code = _undefined}) => _then(Input$LoginGoogleRequest._({
        ..._instance._$data,
        if (code != _undefined && code != null) 'code': (code as String),
      }));
}

class _CopyWithStubImpl$Input$LoginGoogleRequest<TRes>
    implements CopyWith$Input$LoginGoogleRequest<TRes> {
  _CopyWithStubImpl$Input$LoginGoogleRequest(this._res);

  TRes _res;

  call({String? code}) => _res;
}

class Input$LoginAppleRequest {
  factory Input$LoginAppleRequest({required String code}) =>
      Input$LoginAppleRequest._({
        r'code': code,
      });

  Input$LoginAppleRequest._(this._$data);

  factory Input$LoginAppleRequest.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$code = data['code'];
    result$data['code'] = (l$code as String);
    return Input$LoginAppleRequest._(result$data);
  }

  Map<String, dynamic> _$data;

  String get code => (_$data['code'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$code = code;
    result$data['code'] = l$code;
    return result$data;
  }

  CopyWith$Input$LoginAppleRequest<Input$LoginAppleRequest> get copyWith =>
      CopyWith$Input$LoginAppleRequest(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$LoginAppleRequest || runtimeType != other.runtimeType) {
      return false;
    }
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$code = code;
    return Object.hashAll([l$code]);
  }
}

abstract class CopyWith$Input$LoginAppleRequest<TRes> {
  factory CopyWith$Input$LoginAppleRequest(
    Input$LoginAppleRequest instance,
    TRes Function(Input$LoginAppleRequest) then,
  ) = _CopyWithImpl$Input$LoginAppleRequest;

  factory CopyWith$Input$LoginAppleRequest.stub(TRes res) =
      _CopyWithStubImpl$Input$LoginAppleRequest;

  TRes call({String? code});
}

class _CopyWithImpl$Input$LoginAppleRequest<TRes>
    implements CopyWith$Input$LoginAppleRequest<TRes> {
  _CopyWithImpl$Input$LoginAppleRequest(
    this._instance,
    this._then,
  );

  final Input$LoginAppleRequest _instance;

  final TRes Function(Input$LoginAppleRequest) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? code = _undefined}) => _then(Input$LoginAppleRequest._({
        ..._instance._$data,
        if (code != _undefined && code != null) 'code': (code as String),
      }));
}

class _CopyWithStubImpl$Input$LoginAppleRequest<TRes>
    implements CopyWith$Input$LoginAppleRequest<TRes> {
  _CopyWithStubImpl$Input$LoginAppleRequest(this._res);

  TRes _res;

  call({String? code}) => _res;
}

class Input$ResetPasswordRequest {
  factory Input$ResetPasswordRequest({required String email}) =>
      Input$ResetPasswordRequest._({
        r'email': email,
      });

  Input$ResetPasswordRequest._(this._$data);

  factory Input$ResetPasswordRequest.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    return Input$ResetPasswordRequest._(result$data);
  }

  Map<String, dynamic> _$data;

  String get email => (_$data['email'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$email = email;
    result$data['email'] = l$email;
    return result$data;
  }

  CopyWith$Input$ResetPasswordRequest<Input$ResetPasswordRequest>
      get copyWith => CopyWith$Input$ResetPasswordRequest(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$ResetPasswordRequest ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$email = email;
    return Object.hashAll([l$email]);
  }
}

abstract class CopyWith$Input$ResetPasswordRequest<TRes> {
  factory CopyWith$Input$ResetPasswordRequest(
    Input$ResetPasswordRequest instance,
    TRes Function(Input$ResetPasswordRequest) then,
  ) = _CopyWithImpl$Input$ResetPasswordRequest;

  factory CopyWith$Input$ResetPasswordRequest.stub(TRes res) =
      _CopyWithStubImpl$Input$ResetPasswordRequest;

  TRes call({String? email});
}

class _CopyWithImpl$Input$ResetPasswordRequest<TRes>
    implements CopyWith$Input$ResetPasswordRequest<TRes> {
  _CopyWithImpl$Input$ResetPasswordRequest(
    this._instance,
    this._then,
  );

  final Input$ResetPasswordRequest _instance;

  final TRes Function(Input$ResetPasswordRequest) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? email = _undefined}) =>
      _then(Input$ResetPasswordRequest._({
        ..._instance._$data,
        if (email != _undefined && email != null) 'email': (email as String),
      }));
}

class _CopyWithStubImpl$Input$ResetPasswordRequest<TRes>
    implements CopyWith$Input$ResetPasswordRequest<TRes> {
  _CopyWithStubImpl$Input$ResetPasswordRequest(this._res);

  TRes _res;

  call({String? email}) => _res;
}

class Input$VerifyForgotPasswordRequest {
  factory Input$VerifyForgotPasswordRequest({
    required String email,
    required String code,
  }) =>
      Input$VerifyForgotPasswordRequest._({
        r'email': email,
        r'code': code,
      });

  Input$VerifyForgotPasswordRequest._(this._$data);

  factory Input$VerifyForgotPasswordRequest.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    final l$code = data['code'];
    result$data['code'] = (l$code as String);
    return Input$VerifyForgotPasswordRequest._(result$data);
  }

  Map<String, dynamic> _$data;

  String get email => (_$data['email'] as String);

  String get code => (_$data['code'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$email = email;
    result$data['email'] = l$email;
    final l$code = code;
    result$data['code'] = l$code;
    return result$data;
  }

  CopyWith$Input$VerifyForgotPasswordRequest<Input$VerifyForgotPasswordRequest>
      get copyWith => CopyWith$Input$VerifyForgotPasswordRequest(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$VerifyForgotPasswordRequest ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$email = email;
    final l$code = code;
    return Object.hashAll([
      l$email,
      l$code,
    ]);
  }
}

abstract class CopyWith$Input$VerifyForgotPasswordRequest<TRes> {
  factory CopyWith$Input$VerifyForgotPasswordRequest(
    Input$VerifyForgotPasswordRequest instance,
    TRes Function(Input$VerifyForgotPasswordRequest) then,
  ) = _CopyWithImpl$Input$VerifyForgotPasswordRequest;

  factory CopyWith$Input$VerifyForgotPasswordRequest.stub(TRes res) =
      _CopyWithStubImpl$Input$VerifyForgotPasswordRequest;

  TRes call({
    String? email,
    String? code,
  });
}

class _CopyWithImpl$Input$VerifyForgotPasswordRequest<TRes>
    implements CopyWith$Input$VerifyForgotPasswordRequest<TRes> {
  _CopyWithImpl$Input$VerifyForgotPasswordRequest(
    this._instance,
    this._then,
  );

  final Input$VerifyForgotPasswordRequest _instance;

  final TRes Function(Input$VerifyForgotPasswordRequest) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? email = _undefined,
    Object? code = _undefined,
  }) =>
      _then(Input$VerifyForgotPasswordRequest._({
        ..._instance._$data,
        if (email != _undefined && email != null) 'email': (email as String),
        if (code != _undefined && code != null) 'code': (code as String),
      }));
}

class _CopyWithStubImpl$Input$VerifyForgotPasswordRequest<TRes>
    implements CopyWith$Input$VerifyForgotPasswordRequest<TRes> {
  _CopyWithStubImpl$Input$VerifyForgotPasswordRequest(this._res);

  TRes _res;

  call({
    String? email,
    String? code,
  }) =>
      _res;
}

class Input$ChangePasswordRequest {
  factory Input$ChangePasswordRequest({
    required String token,
    required String newPassword,
  }) =>
      Input$ChangePasswordRequest._({
        r'token': token,
        r'newPassword': newPassword,
      });

  Input$ChangePasswordRequest._(this._$data);

  factory Input$ChangePasswordRequest.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$token = data['token'];
    result$data['token'] = (l$token as String);
    final l$newPassword = data['newPassword'];
    result$data['newPassword'] = (l$newPassword as String);
    return Input$ChangePasswordRequest._(result$data);
  }

  Map<String, dynamic> _$data;

  String get token => (_$data['token'] as String);

  String get newPassword => (_$data['newPassword'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$token = token;
    result$data['token'] = l$token;
    final l$newPassword = newPassword;
    result$data['newPassword'] = l$newPassword;
    return result$data;
  }

  CopyWith$Input$ChangePasswordRequest<Input$ChangePasswordRequest>
      get copyWith => CopyWith$Input$ChangePasswordRequest(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$ChangePasswordRequest ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$token = token;
    final lOther$token = other.token;
    if (l$token != lOther$token) {
      return false;
    }
    final l$newPassword = newPassword;
    final lOther$newPassword = other.newPassword;
    if (l$newPassword != lOther$newPassword) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$token = token;
    final l$newPassword = newPassword;
    return Object.hashAll([
      l$token,
      l$newPassword,
    ]);
  }
}

abstract class CopyWith$Input$ChangePasswordRequest<TRes> {
  factory CopyWith$Input$ChangePasswordRequest(
    Input$ChangePasswordRequest instance,
    TRes Function(Input$ChangePasswordRequest) then,
  ) = _CopyWithImpl$Input$ChangePasswordRequest;

  factory CopyWith$Input$ChangePasswordRequest.stub(TRes res) =
      _CopyWithStubImpl$Input$ChangePasswordRequest;

  TRes call({
    String? token,
    String? newPassword,
  });
}

class _CopyWithImpl$Input$ChangePasswordRequest<TRes>
    implements CopyWith$Input$ChangePasswordRequest<TRes> {
  _CopyWithImpl$Input$ChangePasswordRequest(
    this._instance,
    this._then,
  );

  final Input$ChangePasswordRequest _instance;

  final TRes Function(Input$ChangePasswordRequest) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? token = _undefined,
    Object? newPassword = _undefined,
  }) =>
      _then(Input$ChangePasswordRequest._({
        ..._instance._$data,
        if (token != _undefined && token != null) 'token': (token as String),
        if (newPassword != _undefined && newPassword != null)
          'newPassword': (newPassword as String),
      }));
}

class _CopyWithStubImpl$Input$ChangePasswordRequest<TRes>
    implements CopyWith$Input$ChangePasswordRequest<TRes> {
  _CopyWithStubImpl$Input$ChangePasswordRequest(this._res);

  TRes _res;

  call({
    String? token,
    String? newPassword,
  }) =>
      _res;
}

class Input$VerifyEmailRequest {
  factory Input$VerifyEmailRequest({
    required String v_session,
    required String code,
  }) =>
      Input$VerifyEmailRequest._({
        r'v_session': v_session,
        r'code': code,
      });

  Input$VerifyEmailRequest._(this._$data);

  factory Input$VerifyEmailRequest.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$v_session = data['v_session'];
    result$data['v_session'] = (l$v_session as String);
    final l$code = data['code'];
    result$data['code'] = (l$code as String);
    return Input$VerifyEmailRequest._(result$data);
  }

  Map<String, dynamic> _$data;

  String get v_session => (_$data['v_session'] as String);

  String get code => (_$data['code'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$v_session = v_session;
    result$data['v_session'] = l$v_session;
    final l$code = code;
    result$data['code'] = l$code;
    return result$data;
  }

  CopyWith$Input$VerifyEmailRequest<Input$VerifyEmailRequest> get copyWith =>
      CopyWith$Input$VerifyEmailRequest(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$VerifyEmailRequest ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$v_session = v_session;
    final lOther$v_session = other.v_session;
    if (l$v_session != lOther$v_session) {
      return false;
    }
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$v_session = v_session;
    final l$code = code;
    return Object.hashAll([
      l$v_session,
      l$code,
    ]);
  }
}

abstract class CopyWith$Input$VerifyEmailRequest<TRes> {
  factory CopyWith$Input$VerifyEmailRequest(
    Input$VerifyEmailRequest instance,
    TRes Function(Input$VerifyEmailRequest) then,
  ) = _CopyWithImpl$Input$VerifyEmailRequest;

  factory CopyWith$Input$VerifyEmailRequest.stub(TRes res) =
      _CopyWithStubImpl$Input$VerifyEmailRequest;

  TRes call({
    String? v_session,
    String? code,
  });
}

class _CopyWithImpl$Input$VerifyEmailRequest<TRes>
    implements CopyWith$Input$VerifyEmailRequest<TRes> {
  _CopyWithImpl$Input$VerifyEmailRequest(
    this._instance,
    this._then,
  );

  final Input$VerifyEmailRequest _instance;

  final TRes Function(Input$VerifyEmailRequest) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? v_session = _undefined,
    Object? code = _undefined,
  }) =>
      _then(Input$VerifyEmailRequest._({
        ..._instance._$data,
        if (v_session != _undefined && v_session != null)
          'v_session': (v_session as String),
        if (code != _undefined && code != null) 'code': (code as String),
      }));
}

class _CopyWithStubImpl$Input$VerifyEmailRequest<TRes>
    implements CopyWith$Input$VerifyEmailRequest<TRes> {
  _CopyWithStubImpl$Input$VerifyEmailRequest(this._res);

  TRes _res;

  call({
    String? v_session,
    String? code,
  }) =>
      _res;
}

class Input$RegisterEmailRequest {
  factory Input$RegisterEmailRequest({
    required String name,
    required String email,
    required String password,
  }) =>
      Input$RegisterEmailRequest._({
        r'name': name,
        r'email': email,
        r'password': password,
      });

  Input$RegisterEmailRequest._(this._$data);

  factory Input$RegisterEmailRequest.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    final l$password = data['password'];
    result$data['password'] = (l$password as String);
    return Input$RegisterEmailRequest._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);

  String get email => (_$data['email'] as String);

  String get password => (_$data['password'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    final l$email = email;
    result$data['email'] = l$email;
    final l$password = password;
    result$data['password'] = l$password;
    return result$data;
  }

  CopyWith$Input$RegisterEmailRequest<Input$RegisterEmailRequest>
      get copyWith => CopyWith$Input$RegisterEmailRequest(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$RegisterEmailRequest ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$password = password;
    final lOther$password = other.password;
    if (l$password != lOther$password) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$email = email;
    final l$password = password;
    return Object.hashAll([
      l$name,
      l$email,
      l$password,
    ]);
  }
}

abstract class CopyWith$Input$RegisterEmailRequest<TRes> {
  factory CopyWith$Input$RegisterEmailRequest(
    Input$RegisterEmailRequest instance,
    TRes Function(Input$RegisterEmailRequest) then,
  ) = _CopyWithImpl$Input$RegisterEmailRequest;

  factory CopyWith$Input$RegisterEmailRequest.stub(TRes res) =
      _CopyWithStubImpl$Input$RegisterEmailRequest;

  TRes call({
    String? name,
    String? email,
    String? password,
  });
}

class _CopyWithImpl$Input$RegisterEmailRequest<TRes>
    implements CopyWith$Input$RegisterEmailRequest<TRes> {
  _CopyWithImpl$Input$RegisterEmailRequest(
    this._instance,
    this._then,
  );

  final Input$RegisterEmailRequest _instance;

  final TRes Function(Input$RegisterEmailRequest) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? email = _undefined,
    Object? password = _undefined,
  }) =>
      _then(Input$RegisterEmailRequest._({
        ..._instance._$data,
        if (name != _undefined && name != null) 'name': (name as String),
        if (email != _undefined && email != null) 'email': (email as String),
        if (password != _undefined && password != null)
          'password': (password as String),
      }));
}

class _CopyWithStubImpl$Input$RegisterEmailRequest<TRes>
    implements CopyWith$Input$RegisterEmailRequest<TRes> {
  _CopyWithStubImpl$Input$RegisterEmailRequest(this._res);

  TRes _res;

  call({
    String? name,
    String? email,
    String? password,
  }) =>
      _res;
}

class Input$RegisterPhoneRequest {
  factory Input$RegisterPhoneRequest({
    required String name,
    required String phone,
    required String password,
  }) =>
      Input$RegisterPhoneRequest._({
        r'name': name,
        r'phone': phone,
        r'password': password,
      });

  Input$RegisterPhoneRequest._(this._$data);

  factory Input$RegisterPhoneRequest.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    final l$phone = data['phone'];
    result$data['phone'] = (l$phone as String);
    final l$password = data['password'];
    result$data['password'] = (l$password as String);
    return Input$RegisterPhoneRequest._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);

  String get phone => (_$data['phone'] as String);

  String get password => (_$data['password'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    final l$phone = phone;
    result$data['phone'] = l$phone;
    final l$password = password;
    result$data['password'] = l$password;
    return result$data;
  }

  CopyWith$Input$RegisterPhoneRequest<Input$RegisterPhoneRequest>
      get copyWith => CopyWith$Input$RegisterPhoneRequest(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$RegisterPhoneRequest ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) {
      return false;
    }
    final l$password = password;
    final lOther$password = other.password;
    if (l$password != lOther$password) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$phone = phone;
    final l$password = password;
    return Object.hashAll([
      l$name,
      l$phone,
      l$password,
    ]);
  }
}

abstract class CopyWith$Input$RegisterPhoneRequest<TRes> {
  factory CopyWith$Input$RegisterPhoneRequest(
    Input$RegisterPhoneRequest instance,
    TRes Function(Input$RegisterPhoneRequest) then,
  ) = _CopyWithImpl$Input$RegisterPhoneRequest;

  factory CopyWith$Input$RegisterPhoneRequest.stub(TRes res) =
      _CopyWithStubImpl$Input$RegisterPhoneRequest;

  TRes call({
    String? name,
    String? phone,
    String? password,
  });
}

class _CopyWithImpl$Input$RegisterPhoneRequest<TRes>
    implements CopyWith$Input$RegisterPhoneRequest<TRes> {
  _CopyWithImpl$Input$RegisterPhoneRequest(
    this._instance,
    this._then,
  );

  final Input$RegisterPhoneRequest _instance;

  final TRes Function(Input$RegisterPhoneRequest) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? phone = _undefined,
    Object? password = _undefined,
  }) =>
      _then(Input$RegisterPhoneRequest._({
        ..._instance._$data,
        if (name != _undefined && name != null) 'name': (name as String),
        if (phone != _undefined && phone != null) 'phone': (phone as String),
        if (password != _undefined && password != null)
          'password': (password as String),
      }));
}

class _CopyWithStubImpl$Input$RegisterPhoneRequest<TRes>
    implements CopyWith$Input$RegisterPhoneRequest<TRes> {
  _CopyWithStubImpl$Input$RegisterPhoneRequest(this._res);

  TRes _res;

  call({
    String? name,
    String? phone,
    String? password,
  }) =>
      _res;
}

class Input$ResendVerifyEmailRequest {
  factory Input$ResendVerifyEmailRequest({required String email}) =>
      Input$ResendVerifyEmailRequest._({
        r'email': email,
      });

  Input$ResendVerifyEmailRequest._(this._$data);

  factory Input$ResendVerifyEmailRequest.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    return Input$ResendVerifyEmailRequest._(result$data);
  }

  Map<String, dynamic> _$data;

  String get email => (_$data['email'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$email = email;
    result$data['email'] = l$email;
    return result$data;
  }

  CopyWith$Input$ResendVerifyEmailRequest<Input$ResendVerifyEmailRequest>
      get copyWith => CopyWith$Input$ResendVerifyEmailRequest(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$ResendVerifyEmailRequest ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$email = email;
    return Object.hashAll([l$email]);
  }
}

abstract class CopyWith$Input$ResendVerifyEmailRequest<TRes> {
  factory CopyWith$Input$ResendVerifyEmailRequest(
    Input$ResendVerifyEmailRequest instance,
    TRes Function(Input$ResendVerifyEmailRequest) then,
  ) = _CopyWithImpl$Input$ResendVerifyEmailRequest;

  factory CopyWith$Input$ResendVerifyEmailRequest.stub(TRes res) =
      _CopyWithStubImpl$Input$ResendVerifyEmailRequest;

  TRes call({String? email});
}

class _CopyWithImpl$Input$ResendVerifyEmailRequest<TRes>
    implements CopyWith$Input$ResendVerifyEmailRequest<TRes> {
  _CopyWithImpl$Input$ResendVerifyEmailRequest(
    this._instance,
    this._then,
  );

  final Input$ResendVerifyEmailRequest _instance;

  final TRes Function(Input$ResendVerifyEmailRequest) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? email = _undefined}) =>
      _then(Input$ResendVerifyEmailRequest._({
        ..._instance._$data,
        if (email != _undefined && email != null) 'email': (email as String),
      }));
}

class _CopyWithStubImpl$Input$ResendVerifyEmailRequest<TRes>
    implements CopyWith$Input$ResendVerifyEmailRequest<TRes> {
  _CopyWithStubImpl$Input$ResendVerifyEmailRequest(this._res);

  TRes _res;

  call({String? email}) => _res;
}

class Input$FeedbackRequest {
  factory Input$FeedbackRequest({
    required Enum$FeedbackType type,
    String? comment,
    List<String>? images,
  }) =>
      Input$FeedbackRequest._({
        r'type': type,
        if (comment != null) r'comment': comment,
        if (images != null) r'images': images,
      });

  Input$FeedbackRequest._(this._$data);

  factory Input$FeedbackRequest.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$type = data['type'];
    result$data['type'] = fromJson$Enum$FeedbackType((l$type as String));
    if (data.containsKey('comment')) {
      final l$comment = data['comment'];
      result$data['comment'] = (l$comment as String?);
    }
    if (data.containsKey('images')) {
      final l$images = data['images'];
      result$data['images'] =
          (l$images as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    return Input$FeedbackRequest._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$FeedbackType get type => (_$data['type'] as Enum$FeedbackType);

  String? get comment => (_$data['comment'] as String?);

  List<String>? get images => (_$data['images'] as List<String>?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$type = type;
    result$data['type'] = toJson$Enum$FeedbackType(l$type);
    if (_$data.containsKey('comment')) {
      final l$comment = comment;
      result$data['comment'] = l$comment;
    }
    if (_$data.containsKey('images')) {
      final l$images = images;
      result$data['images'] = l$images?.map((e) => e).toList();
    }
    return result$data;
  }

  CopyWith$Input$FeedbackRequest<Input$FeedbackRequest> get copyWith =>
      CopyWith$Input$FeedbackRequest(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$FeedbackRequest || runtimeType != other.runtimeType) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$comment = comment;
    final lOther$comment = other.comment;
    if (_$data.containsKey('comment') != other._$data.containsKey('comment')) {
      return false;
    }
    if (l$comment != lOther$comment) {
      return false;
    }
    final l$images = images;
    final lOther$images = other.images;
    if (_$data.containsKey('images') != other._$data.containsKey('images')) {
      return false;
    }
    if (l$images != null && lOther$images != null) {
      if (l$images.length != lOther$images.length) {
        return false;
      }
      for (int i = 0; i < l$images.length; i++) {
        final l$images$entry = l$images[i];
        final lOther$images$entry = lOther$images[i];
        if (l$images$entry != lOther$images$entry) {
          return false;
        }
      }
    } else if (l$images != lOther$images) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$type = type;
    final l$comment = comment;
    final l$images = images;
    return Object.hashAll([
      l$type,
      _$data.containsKey('comment') ? l$comment : const {},
      _$data.containsKey('images')
          ? l$images == null
              ? null
              : Object.hashAll(l$images.map((v) => v))
          : const {},
    ]);
  }
}

abstract class CopyWith$Input$FeedbackRequest<TRes> {
  factory CopyWith$Input$FeedbackRequest(
    Input$FeedbackRequest instance,
    TRes Function(Input$FeedbackRequest) then,
  ) = _CopyWithImpl$Input$FeedbackRequest;

  factory CopyWith$Input$FeedbackRequest.stub(TRes res) =
      _CopyWithStubImpl$Input$FeedbackRequest;

  TRes call({
    Enum$FeedbackType? type,
    String? comment,
    List<String>? images,
  });
}

class _CopyWithImpl$Input$FeedbackRequest<TRes>
    implements CopyWith$Input$FeedbackRequest<TRes> {
  _CopyWithImpl$Input$FeedbackRequest(
    this._instance,
    this._then,
  );

  final Input$FeedbackRequest _instance;

  final TRes Function(Input$FeedbackRequest) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? type = _undefined,
    Object? comment = _undefined,
    Object? images = _undefined,
  }) =>
      _then(Input$FeedbackRequest._({
        ..._instance._$data,
        if (type != _undefined && type != null)
          'type': (type as Enum$FeedbackType),
        if (comment != _undefined) 'comment': (comment as String?),
        if (images != _undefined) 'images': (images as List<String>?),
      }));
}

class _CopyWithStubImpl$Input$FeedbackRequest<TRes>
    implements CopyWith$Input$FeedbackRequest<TRes> {
  _CopyWithStubImpl$Input$FeedbackRequest(this._res);

  TRes _res;

  call({
    Enum$FeedbackType? type,
    String? comment,
    List<String>? images,
  }) =>
      _res;
}

class Input$SetDeviceIdInput {
  factory Input$SetDeviceIdInput({
    String? fcm_token,
    String? apns_token,
    String? locales,
    String? ip,
    String? country,
    String? os,
    String? app_version,
    String? forwarded_from,
  }) =>
      Input$SetDeviceIdInput._({
        if (fcm_token != null) r'fcm_token': fcm_token,
        if (apns_token != null) r'apns_token': apns_token,
        if (locales != null) r'locales': locales,
        if (ip != null) r'ip': ip,
        if (country != null) r'country': country,
        if (os != null) r'os': os,
        if (app_version != null) r'app_version': app_version,
        if (forwarded_from != null) r'forwarded_from': forwarded_from,
      });

  Input$SetDeviceIdInput._(this._$data);

  factory Input$SetDeviceIdInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('fcm_token')) {
      final l$fcm_token = data['fcm_token'];
      result$data['fcm_token'] = (l$fcm_token as String?);
    }
    if (data.containsKey('apns_token')) {
      final l$apns_token = data['apns_token'];
      result$data['apns_token'] = (l$apns_token as String?);
    }
    if (data.containsKey('locales')) {
      final l$locales = data['locales'];
      result$data['locales'] = (l$locales as String?);
    }
    if (data.containsKey('ip')) {
      final l$ip = data['ip'];
      result$data['ip'] = (l$ip as String?);
    }
    if (data.containsKey('country')) {
      final l$country = data['country'];
      result$data['country'] = (l$country as String?);
    }
    if (data.containsKey('os')) {
      final l$os = data['os'];
      result$data['os'] = (l$os as String?);
    }
    if (data.containsKey('app_version')) {
      final l$app_version = data['app_version'];
      result$data['app_version'] = (l$app_version as String?);
    }
    if (data.containsKey('forwarded_from')) {
      final l$forwarded_from = data['forwarded_from'];
      result$data['forwarded_from'] = (l$forwarded_from as String?);
    }
    return Input$SetDeviceIdInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get fcm_token => (_$data['fcm_token'] as String?);

  String? get apns_token => (_$data['apns_token'] as String?);

  String? get locales => (_$data['locales'] as String?);

  String? get ip => (_$data['ip'] as String?);

  String? get country => (_$data['country'] as String?);

  String? get os => (_$data['os'] as String?);

  String? get app_version => (_$data['app_version'] as String?);

  String? get forwarded_from => (_$data['forwarded_from'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('fcm_token')) {
      final l$fcm_token = fcm_token;
      result$data['fcm_token'] = l$fcm_token;
    }
    if (_$data.containsKey('apns_token')) {
      final l$apns_token = apns_token;
      result$data['apns_token'] = l$apns_token;
    }
    if (_$data.containsKey('locales')) {
      final l$locales = locales;
      result$data['locales'] = l$locales;
    }
    if (_$data.containsKey('ip')) {
      final l$ip = ip;
      result$data['ip'] = l$ip;
    }
    if (_$data.containsKey('country')) {
      final l$country = country;
      result$data['country'] = l$country;
    }
    if (_$data.containsKey('os')) {
      final l$os = os;
      result$data['os'] = l$os;
    }
    if (_$data.containsKey('app_version')) {
      final l$app_version = app_version;
      result$data['app_version'] = l$app_version;
    }
    if (_$data.containsKey('forwarded_from')) {
      final l$forwarded_from = forwarded_from;
      result$data['forwarded_from'] = l$forwarded_from;
    }
    return result$data;
  }

  CopyWith$Input$SetDeviceIdInput<Input$SetDeviceIdInput> get copyWith =>
      CopyWith$Input$SetDeviceIdInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$SetDeviceIdInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$fcm_token = fcm_token;
    final lOther$fcm_token = other.fcm_token;
    if (_$data.containsKey('fcm_token') !=
        other._$data.containsKey('fcm_token')) {
      return false;
    }
    if (l$fcm_token != lOther$fcm_token) {
      return false;
    }
    final l$apns_token = apns_token;
    final lOther$apns_token = other.apns_token;
    if (_$data.containsKey('apns_token') !=
        other._$data.containsKey('apns_token')) {
      return false;
    }
    if (l$apns_token != lOther$apns_token) {
      return false;
    }
    final l$locales = locales;
    final lOther$locales = other.locales;
    if (_$data.containsKey('locales') != other._$data.containsKey('locales')) {
      return false;
    }
    if (l$locales != lOther$locales) {
      return false;
    }
    final l$ip = ip;
    final lOther$ip = other.ip;
    if (_$data.containsKey('ip') != other._$data.containsKey('ip')) {
      return false;
    }
    if (l$ip != lOther$ip) {
      return false;
    }
    final l$country = country;
    final lOther$country = other.country;
    if (_$data.containsKey('country') != other._$data.containsKey('country')) {
      return false;
    }
    if (l$country != lOther$country) {
      return false;
    }
    final l$os = os;
    final lOther$os = other.os;
    if (_$data.containsKey('os') != other._$data.containsKey('os')) {
      return false;
    }
    if (l$os != lOther$os) {
      return false;
    }
    final l$app_version = app_version;
    final lOther$app_version = other.app_version;
    if (_$data.containsKey('app_version') !=
        other._$data.containsKey('app_version')) {
      return false;
    }
    if (l$app_version != lOther$app_version) {
      return false;
    }
    final l$forwarded_from = forwarded_from;
    final lOther$forwarded_from = other.forwarded_from;
    if (_$data.containsKey('forwarded_from') !=
        other._$data.containsKey('forwarded_from')) {
      return false;
    }
    if (l$forwarded_from != lOther$forwarded_from) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$fcm_token = fcm_token;
    final l$apns_token = apns_token;
    final l$locales = locales;
    final l$ip = ip;
    final l$country = country;
    final l$os = os;
    final l$app_version = app_version;
    final l$forwarded_from = forwarded_from;
    return Object.hashAll([
      _$data.containsKey('fcm_token') ? l$fcm_token : const {},
      _$data.containsKey('apns_token') ? l$apns_token : const {},
      _$data.containsKey('locales') ? l$locales : const {},
      _$data.containsKey('ip') ? l$ip : const {},
      _$data.containsKey('country') ? l$country : const {},
      _$data.containsKey('os') ? l$os : const {},
      _$data.containsKey('app_version') ? l$app_version : const {},
      _$data.containsKey('forwarded_from') ? l$forwarded_from : const {},
    ]);
  }
}

abstract class CopyWith$Input$SetDeviceIdInput<TRes> {
  factory CopyWith$Input$SetDeviceIdInput(
    Input$SetDeviceIdInput instance,
    TRes Function(Input$SetDeviceIdInput) then,
  ) = _CopyWithImpl$Input$SetDeviceIdInput;

  factory CopyWith$Input$SetDeviceIdInput.stub(TRes res) =
      _CopyWithStubImpl$Input$SetDeviceIdInput;

  TRes call({
    String? fcm_token,
    String? apns_token,
    String? locales,
    String? ip,
    String? country,
    String? os,
    String? app_version,
    String? forwarded_from,
  });
}

class _CopyWithImpl$Input$SetDeviceIdInput<TRes>
    implements CopyWith$Input$SetDeviceIdInput<TRes> {
  _CopyWithImpl$Input$SetDeviceIdInput(
    this._instance,
    this._then,
  );

  final Input$SetDeviceIdInput _instance;

  final TRes Function(Input$SetDeviceIdInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? fcm_token = _undefined,
    Object? apns_token = _undefined,
    Object? locales = _undefined,
    Object? ip = _undefined,
    Object? country = _undefined,
    Object? os = _undefined,
    Object? app_version = _undefined,
    Object? forwarded_from = _undefined,
  }) =>
      _then(Input$SetDeviceIdInput._({
        ..._instance._$data,
        if (fcm_token != _undefined) 'fcm_token': (fcm_token as String?),
        if (apns_token != _undefined) 'apns_token': (apns_token as String?),
        if (locales != _undefined) 'locales': (locales as String?),
        if (ip != _undefined) 'ip': (ip as String?),
        if (country != _undefined) 'country': (country as String?),
        if (os != _undefined) 'os': (os as String?),
        if (app_version != _undefined) 'app_version': (app_version as String?),
        if (forwarded_from != _undefined)
          'forwarded_from': (forwarded_from as String?),
      }));
}

class _CopyWithStubImpl$Input$SetDeviceIdInput<TRes>
    implements CopyWith$Input$SetDeviceIdInput<TRes> {
  _CopyWithStubImpl$Input$SetDeviceIdInput(this._res);

  TRes _res;

  call({
    String? fcm_token,
    String? apns_token,
    String? locales,
    String? ip,
    String? country,
    String? os,
    String? app_version,
    String? forwarded_from,
  }) =>
      _res;
}

class Input$SetForwardedFromInput {
  factory Input$SetForwardedFromInput({required String forwarded_from}) =>
      Input$SetForwardedFromInput._({
        r'forwarded_from': forwarded_from,
      });

  Input$SetForwardedFromInput._(this._$data);

  factory Input$SetForwardedFromInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$forwarded_from = data['forwarded_from'];
    result$data['forwarded_from'] = (l$forwarded_from as String);
    return Input$SetForwardedFromInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get forwarded_from => (_$data['forwarded_from'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$forwarded_from = forwarded_from;
    result$data['forwarded_from'] = l$forwarded_from;
    return result$data;
  }

  CopyWith$Input$SetForwardedFromInput<Input$SetForwardedFromInput>
      get copyWith => CopyWith$Input$SetForwardedFromInput(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$SetForwardedFromInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$forwarded_from = forwarded_from;
    final lOther$forwarded_from = other.forwarded_from;
    if (l$forwarded_from != lOther$forwarded_from) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$forwarded_from = forwarded_from;
    return Object.hashAll([l$forwarded_from]);
  }
}

abstract class CopyWith$Input$SetForwardedFromInput<TRes> {
  factory CopyWith$Input$SetForwardedFromInput(
    Input$SetForwardedFromInput instance,
    TRes Function(Input$SetForwardedFromInput) then,
  ) = _CopyWithImpl$Input$SetForwardedFromInput;

  factory CopyWith$Input$SetForwardedFromInput.stub(TRes res) =
      _CopyWithStubImpl$Input$SetForwardedFromInput;

  TRes call({String? forwarded_from});
}

class _CopyWithImpl$Input$SetForwardedFromInput<TRes>
    implements CopyWith$Input$SetForwardedFromInput<TRes> {
  _CopyWithImpl$Input$SetForwardedFromInput(
    this._instance,
    this._then,
  );

  final Input$SetForwardedFromInput _instance;

  final TRes Function(Input$SetForwardedFromInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? forwarded_from = _undefined}) =>
      _then(Input$SetForwardedFromInput._({
        ..._instance._$data,
        if (forwarded_from != _undefined && forwarded_from != null)
          'forwarded_from': (forwarded_from as String),
      }));
}

class _CopyWithStubImpl$Input$SetForwardedFromInput<TRes>
    implements CopyWith$Input$SetForwardedFromInput<TRes> {
  _CopyWithStubImpl$Input$SetForwardedFromInput(this._res);

  TRes _res;

  call({String? forwarded_from}) => _res;
}

class Input$SetFcmTokenInput {
  factory Input$SetFcmTokenInput({
    required String fcm_token,
    String? apns_token,
  }) =>
      Input$SetFcmTokenInput._({
        r'fcm_token': fcm_token,
        if (apns_token != null) r'apns_token': apns_token,
      });

  Input$SetFcmTokenInput._(this._$data);

  factory Input$SetFcmTokenInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$fcm_token = data['fcm_token'];
    result$data['fcm_token'] = (l$fcm_token as String);
    if (data.containsKey('apns_token')) {
      final l$apns_token = data['apns_token'];
      result$data['apns_token'] = (l$apns_token as String?);
    }
    return Input$SetFcmTokenInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get fcm_token => (_$data['fcm_token'] as String);

  String? get apns_token => (_$data['apns_token'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$fcm_token = fcm_token;
    result$data['fcm_token'] = l$fcm_token;
    if (_$data.containsKey('apns_token')) {
      final l$apns_token = apns_token;
      result$data['apns_token'] = l$apns_token;
    }
    return result$data;
  }

  CopyWith$Input$SetFcmTokenInput<Input$SetFcmTokenInput> get copyWith =>
      CopyWith$Input$SetFcmTokenInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$SetFcmTokenInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$fcm_token = fcm_token;
    final lOther$fcm_token = other.fcm_token;
    if (l$fcm_token != lOther$fcm_token) {
      return false;
    }
    final l$apns_token = apns_token;
    final lOther$apns_token = other.apns_token;
    if (_$data.containsKey('apns_token') !=
        other._$data.containsKey('apns_token')) {
      return false;
    }
    if (l$apns_token != lOther$apns_token) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$fcm_token = fcm_token;
    final l$apns_token = apns_token;
    return Object.hashAll([
      l$fcm_token,
      _$data.containsKey('apns_token') ? l$apns_token : const {},
    ]);
  }
}

abstract class CopyWith$Input$SetFcmTokenInput<TRes> {
  factory CopyWith$Input$SetFcmTokenInput(
    Input$SetFcmTokenInput instance,
    TRes Function(Input$SetFcmTokenInput) then,
  ) = _CopyWithImpl$Input$SetFcmTokenInput;

  factory CopyWith$Input$SetFcmTokenInput.stub(TRes res) =
      _CopyWithStubImpl$Input$SetFcmTokenInput;

  TRes call({
    String? fcm_token,
    String? apns_token,
  });
}

class _CopyWithImpl$Input$SetFcmTokenInput<TRes>
    implements CopyWith$Input$SetFcmTokenInput<TRes> {
  _CopyWithImpl$Input$SetFcmTokenInput(
    this._instance,
    this._then,
  );

  final Input$SetFcmTokenInput _instance;

  final TRes Function(Input$SetFcmTokenInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? fcm_token = _undefined,
    Object? apns_token = _undefined,
  }) =>
      _then(Input$SetFcmTokenInput._({
        ..._instance._$data,
        if (fcm_token != _undefined && fcm_token != null)
          'fcm_token': (fcm_token as String),
        if (apns_token != _undefined) 'apns_token': (apns_token as String?),
      }));
}

class _CopyWithStubImpl$Input$SetFcmTokenInput<TRes>
    implements CopyWith$Input$SetFcmTokenInput<TRes> {
  _CopyWithStubImpl$Input$SetFcmTokenInput(this._res);

  TRes _res;

  call({
    String? fcm_token,
    String? apns_token,
  }) =>
      _res;
}

class Input$UploadingHsl {
  factory Input$UploadingHsl({required String hsl}) => Input$UploadingHsl._({
        r'hsl': hsl,
      });

  Input$UploadingHsl._(this._$data);

  factory Input$UploadingHsl.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$hsl = data['hsl'];
    result$data['hsl'] = (l$hsl as String);
    return Input$UploadingHsl._(result$data);
  }

  Map<String, dynamic> _$data;

  String get hsl => (_$data['hsl'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$hsl = hsl;
    result$data['hsl'] = l$hsl;
    return result$data;
  }

  CopyWith$Input$UploadingHsl<Input$UploadingHsl> get copyWith =>
      CopyWith$Input$UploadingHsl(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$UploadingHsl || runtimeType != other.runtimeType) {
      return false;
    }
    final l$hsl = hsl;
    final lOther$hsl = other.hsl;
    if (l$hsl != lOther$hsl) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$hsl = hsl;
    return Object.hashAll([l$hsl]);
  }
}

abstract class CopyWith$Input$UploadingHsl<TRes> {
  factory CopyWith$Input$UploadingHsl(
    Input$UploadingHsl instance,
    TRes Function(Input$UploadingHsl) then,
  ) = _CopyWithImpl$Input$UploadingHsl;

  factory CopyWith$Input$UploadingHsl.stub(TRes res) =
      _CopyWithStubImpl$Input$UploadingHsl;

  TRes call({String? hsl});
}

class _CopyWithImpl$Input$UploadingHsl<TRes>
    implements CopyWith$Input$UploadingHsl<TRes> {
  _CopyWithImpl$Input$UploadingHsl(
    this._instance,
    this._then,
  );

  final Input$UploadingHsl _instance;

  final TRes Function(Input$UploadingHsl) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? hsl = _undefined}) => _then(Input$UploadingHsl._({
        ..._instance._$data,
        if (hsl != _undefined && hsl != null) 'hsl': (hsl as String),
      }));
}

class _CopyWithStubImpl$Input$UploadingHsl<TRes>
    implements CopyWith$Input$UploadingHsl<TRes> {
  _CopyWithStubImpl$Input$UploadingHsl(this._res);

  TRes _res;

  call({String? hsl}) => _res;
}

class Input$UploadingFile {
  factory Input$UploadingFile({
    required String mimeType,
    String? encoding,
    String? filename,
    required Uint8List data,
  }) =>
      Input$UploadingFile._({
        r'mimeType': mimeType,
        if (encoding != null) r'encoding': encoding,
        if (filename != null) r'filename': filename,
        r'data': data,
      });

  Input$UploadingFile._(this._$data);

  factory Input$UploadingFile.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$mimeType = data['mimeType'];
    result$data['mimeType'] = (l$mimeType as String);
    if (data.containsKey('encoding')) {
      final l$encoding = data['encoding'];
      result$data['encoding'] = (l$encoding as String?);
    }
    if (data.containsKey('filename')) {
      final l$filename = data['filename'];
      result$data['filename'] = (l$filename as String?);
    }
    final l$data = data['data'];
    result$data['data'] = base64DataFromJson(l$data);
    return Input$UploadingFile._(result$data);
  }

  Map<String, dynamic> _$data;

  String get mimeType => (_$data['mimeType'] as String);

  String? get encoding => (_$data['encoding'] as String?);

  String? get filename => (_$data['filename'] as String?);

  Uint8List get data => (_$data['data'] as Uint8List);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$mimeType = mimeType;
    result$data['mimeType'] = l$mimeType;
    if (_$data.containsKey('encoding')) {
      final l$encoding = encoding;
      result$data['encoding'] = l$encoding;
    }
    if (_$data.containsKey('filename')) {
      final l$filename = filename;
      result$data['filename'] = l$filename;
    }
    final l$data = data;
    result$data['data'] = base64DataToJson(l$data);
    return result$data;
  }

  CopyWith$Input$UploadingFile<Input$UploadingFile> get copyWith =>
      CopyWith$Input$UploadingFile(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$UploadingFile || runtimeType != other.runtimeType) {
      return false;
    }
    final l$mimeType = mimeType;
    final lOther$mimeType = other.mimeType;
    if (l$mimeType != lOther$mimeType) {
      return false;
    }
    final l$encoding = encoding;
    final lOther$encoding = other.encoding;
    if (_$data.containsKey('encoding') !=
        other._$data.containsKey('encoding')) {
      return false;
    }
    if (l$encoding != lOther$encoding) {
      return false;
    }
    final l$filename = filename;
    final lOther$filename = other.filename;
    if (_$data.containsKey('filename') !=
        other._$data.containsKey('filename')) {
      return false;
    }
    if (l$filename != lOther$filename) {
      return false;
    }
    final l$data = data;
    final lOther$data = other.data;
    if (l$data != lOther$data) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$mimeType = mimeType;
    final l$encoding = encoding;
    final l$filename = filename;
    final l$data = data;
    return Object.hashAll([
      l$mimeType,
      _$data.containsKey('encoding') ? l$encoding : const {},
      _$data.containsKey('filename') ? l$filename : const {},
      l$data,
    ]);
  }
}

abstract class CopyWith$Input$UploadingFile<TRes> {
  factory CopyWith$Input$UploadingFile(
    Input$UploadingFile instance,
    TRes Function(Input$UploadingFile) then,
  ) = _CopyWithImpl$Input$UploadingFile;

  factory CopyWith$Input$UploadingFile.stub(TRes res) =
      _CopyWithStubImpl$Input$UploadingFile;

  TRes call({
    String? mimeType,
    String? encoding,
    String? filename,
    Uint8List? data,
  });
}

class _CopyWithImpl$Input$UploadingFile<TRes>
    implements CopyWith$Input$UploadingFile<TRes> {
  _CopyWithImpl$Input$UploadingFile(
    this._instance,
    this._then,
  );

  final Input$UploadingFile _instance;

  final TRes Function(Input$UploadingFile) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? mimeType = _undefined,
    Object? encoding = _undefined,
    Object? filename = _undefined,
    Object? data = _undefined,
  }) =>
      _then(Input$UploadingFile._({
        ..._instance._$data,
        if (mimeType != _undefined && mimeType != null)
          'mimeType': (mimeType as String),
        if (encoding != _undefined) 'encoding': (encoding as String?),
        if (filename != _undefined) 'filename': (filename as String?),
        if (data != _undefined && data != null) 'data': (data as Uint8List),
      }));
}

class _CopyWithStubImpl$Input$UploadingFile<TRes>
    implements CopyWith$Input$UploadingFile<TRes> {
  _CopyWithStubImpl$Input$UploadingFile(this._res);

  TRes _res;

  call({
    String? mimeType,
    String? encoding,
    String? filename,
    Uint8List? data,
  }) =>
      _res;
}

class Input$PaginationInput {
  factory Input$PaginationInput({
    dynamic? filter,
    String? sort,
    int? limit,
    String? cursor,
  }) =>
      Input$PaginationInput._({
        if (filter != null) r'filter': filter,
        if (sort != null) r'sort': sort,
        if (limit != null) r'limit': limit,
        if (cursor != null) r'cursor': cursor,
      });

  Input$PaginationInput._(this._$data);

  factory Input$PaginationInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('filter')) {
      final l$filter = data['filter'];
      result$data['filter'] =
          l$filter == null ? null : jsonFromString(l$filter);
    }
    if (data.containsKey('sort')) {
      final l$sort = data['sort'];
      result$data['sort'] = (l$sort as String?);
    }
    if (data.containsKey('limit')) {
      final l$limit = data['limit'];
      result$data['limit'] = (l$limit as int?);
    }
    if (data.containsKey('cursor')) {
      final l$cursor = data['cursor'];
      result$data['cursor'] = (l$cursor as String?);
    }
    return Input$PaginationInput._(result$data);
  }

  Map<String, dynamic> _$data;

  dynamic? get filter => (_$data['filter'] as dynamic?);

  String? get sort => (_$data['sort'] as String?);

  int? get limit => (_$data['limit'] as int?);

  String? get cursor => (_$data['cursor'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('filter')) {
      final l$filter = filter;
      result$data['filter'] = l$filter == null ? null : jsonToString(l$filter);
    }
    if (_$data.containsKey('sort')) {
      final l$sort = sort;
      result$data['sort'] = l$sort;
    }
    if (_$data.containsKey('limit')) {
      final l$limit = limit;
      result$data['limit'] = l$limit;
    }
    if (_$data.containsKey('cursor')) {
      final l$cursor = cursor;
      result$data['cursor'] = l$cursor;
    }
    return result$data;
  }

  CopyWith$Input$PaginationInput<Input$PaginationInput> get copyWith =>
      CopyWith$Input$PaginationInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$PaginationInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$filter = filter;
    final lOther$filter = other.filter;
    if (_$data.containsKey('filter') != other._$data.containsKey('filter')) {
      return false;
    }
    if (l$filter != lOther$filter) {
      return false;
    }
    final l$sort = sort;
    final lOther$sort = other.sort;
    if (_$data.containsKey('sort') != other._$data.containsKey('sort')) {
      return false;
    }
    if (l$sort != lOther$sort) {
      return false;
    }
    final l$limit = limit;
    final lOther$limit = other.limit;
    if (_$data.containsKey('limit') != other._$data.containsKey('limit')) {
      return false;
    }
    if (l$limit != lOther$limit) {
      return false;
    }
    final l$cursor = cursor;
    final lOther$cursor = other.cursor;
    if (_$data.containsKey('cursor') != other._$data.containsKey('cursor')) {
      return false;
    }
    if (l$cursor != lOther$cursor) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$filter = filter;
    final l$sort = sort;
    final l$limit = limit;
    final l$cursor = cursor;
    return Object.hashAll([
      _$data.containsKey('filter') ? l$filter : const {},
      _$data.containsKey('sort') ? l$sort : const {},
      _$data.containsKey('limit') ? l$limit : const {},
      _$data.containsKey('cursor') ? l$cursor : const {},
    ]);
  }
}

abstract class CopyWith$Input$PaginationInput<TRes> {
  factory CopyWith$Input$PaginationInput(
    Input$PaginationInput instance,
    TRes Function(Input$PaginationInput) then,
  ) = _CopyWithImpl$Input$PaginationInput;

  factory CopyWith$Input$PaginationInput.stub(TRes res) =
      _CopyWithStubImpl$Input$PaginationInput;

  TRes call({
    dynamic? filter,
    String? sort,
    int? limit,
    String? cursor,
  });
}

class _CopyWithImpl$Input$PaginationInput<TRes>
    implements CopyWith$Input$PaginationInput<TRes> {
  _CopyWithImpl$Input$PaginationInput(
    this._instance,
    this._then,
  );

  final Input$PaginationInput _instance;

  final TRes Function(Input$PaginationInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? filter = _undefined,
    Object? sort = _undefined,
    Object? limit = _undefined,
    Object? cursor = _undefined,
  }) =>
      _then(Input$PaginationInput._({
        ..._instance._$data,
        if (filter != _undefined) 'filter': (filter as dynamic?),
        if (sort != _undefined) 'sort': (sort as String?),
        if (limit != _undefined) 'limit': (limit as int?),
        if (cursor != _undefined) 'cursor': (cursor as String?),
      }));
}

class _CopyWithStubImpl$Input$PaginationInput<TRes>
    implements CopyWith$Input$PaginationInput<TRes> {
  _CopyWithStubImpl$Input$PaginationInput(this._res);

  TRes _res;

  call({
    dynamic? filter,
    String? sort,
    int? limit,
    String? cursor,
  }) =>
      _res;
}

class Input$CreateJourneyInput {
  factory Input$CreateJourneyInput({
    required String to,
    required String from,
    required String name,
    required Input$UploadingHsl avatar,
    required String modelSet,
    required String referenceText,
    String? recording,
    String? repating,
    String? description,
    String? introduction,
  }) =>
      Input$CreateJourneyInput._({
        r'to': to,
        r'from': from,
        r'name': name,
        r'avatar': avatar,
        r'modelSet': modelSet,
        r'referenceText': referenceText,
        if (recording != null) r'recording': recording,
        if (repating != null) r'repating': repating,
        if (description != null) r'description': description,
        if (introduction != null) r'introduction': introduction,
      });

  Input$CreateJourneyInput._(this._$data);

  factory Input$CreateJourneyInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$to = data['to'];
    result$data['to'] = (l$to as String);
    final l$from = data['from'];
    result$data['from'] = (l$from as String);
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    final l$avatar = data['avatar'];
    result$data['avatar'] =
        Input$UploadingHsl.fromJson((l$avatar as Map<String, dynamic>));
    final l$modelSet = data['modelSet'];
    result$data['modelSet'] = (l$modelSet as String);
    final l$referenceText = data['referenceText'];
    result$data['referenceText'] = (l$referenceText as String);
    if (data.containsKey('recording')) {
      final l$recording = data['recording'];
      result$data['recording'] = (l$recording as String?);
    }
    if (data.containsKey('repating')) {
      final l$repating = data['repating'];
      result$data['repating'] = (l$repating as String?);
    }
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    if (data.containsKey('introduction')) {
      final l$introduction = data['introduction'];
      result$data['introduction'] = (l$introduction as String?);
    }
    return Input$CreateJourneyInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get to => (_$data['to'] as String);

  String get from => (_$data['from'] as String);

  String get name => (_$data['name'] as String);

  Input$UploadingHsl get avatar => (_$data['avatar'] as Input$UploadingHsl);

  String get modelSet => (_$data['modelSet'] as String);

  String get referenceText => (_$data['referenceText'] as String);

  String? get recording => (_$data['recording'] as String?);

  String? get repating => (_$data['repating'] as String?);

  String? get description => (_$data['description'] as String?);

  String? get introduction => (_$data['introduction'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$to = to;
    result$data['to'] = l$to;
    final l$from = from;
    result$data['from'] = l$from;
    final l$name = name;
    result$data['name'] = l$name;
    final l$avatar = avatar;
    result$data['avatar'] = l$avatar.toJson();
    final l$modelSet = modelSet;
    result$data['modelSet'] = l$modelSet;
    final l$referenceText = referenceText;
    result$data['referenceText'] = l$referenceText;
    if (_$data.containsKey('recording')) {
      final l$recording = recording;
      result$data['recording'] = l$recording;
    }
    if (_$data.containsKey('repating')) {
      final l$repating = repating;
      result$data['repating'] = l$repating;
    }
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description;
    }
    if (_$data.containsKey('introduction')) {
      final l$introduction = introduction;
      result$data['introduction'] = l$introduction;
    }
    return result$data;
  }

  CopyWith$Input$CreateJourneyInput<Input$CreateJourneyInput> get copyWith =>
      CopyWith$Input$CreateJourneyInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CreateJourneyInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$to = to;
    final lOther$to = other.to;
    if (l$to != lOther$to) {
      return false;
    }
    final l$from = from;
    final lOther$from = other.from;
    if (l$from != lOther$from) {
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
    final l$modelSet = modelSet;
    final lOther$modelSet = other.modelSet;
    if (l$modelSet != lOther$modelSet) {
      return false;
    }
    final l$referenceText = referenceText;
    final lOther$referenceText = other.referenceText;
    if (l$referenceText != lOther$referenceText) {
      return false;
    }
    final l$recording = recording;
    final lOther$recording = other.recording;
    if (_$data.containsKey('recording') !=
        other._$data.containsKey('recording')) {
      return false;
    }
    if (l$recording != lOther$recording) {
      return false;
    }
    final l$repating = repating;
    final lOther$repating = other.repating;
    if (_$data.containsKey('repating') !=
        other._$data.containsKey('repating')) {
      return false;
    }
    if (l$repating != lOther$repating) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (_$data.containsKey('description') !=
        other._$data.containsKey('description')) {
      return false;
    }
    if (l$description != lOther$description) {
      return false;
    }
    final l$introduction = introduction;
    final lOther$introduction = other.introduction;
    if (_$data.containsKey('introduction') !=
        other._$data.containsKey('introduction')) {
      return false;
    }
    if (l$introduction != lOther$introduction) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$to = to;
    final l$from = from;
    final l$name = name;
    final l$avatar = avatar;
    final l$modelSet = modelSet;
    final l$referenceText = referenceText;
    final l$recording = recording;
    final l$repating = repating;
    final l$description = description;
    final l$introduction = introduction;
    return Object.hashAll([
      l$to,
      l$from,
      l$name,
      l$avatar,
      l$modelSet,
      l$referenceText,
      _$data.containsKey('recording') ? l$recording : const {},
      _$data.containsKey('repating') ? l$repating : const {},
      _$data.containsKey('description') ? l$description : const {},
      _$data.containsKey('introduction') ? l$introduction : const {},
    ]);
  }
}

abstract class CopyWith$Input$CreateJourneyInput<TRes> {
  factory CopyWith$Input$CreateJourneyInput(
    Input$CreateJourneyInput instance,
    TRes Function(Input$CreateJourneyInput) then,
  ) = _CopyWithImpl$Input$CreateJourneyInput;

  factory CopyWith$Input$CreateJourneyInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreateJourneyInput;

  TRes call({
    String? to,
    String? from,
    String? name,
    Input$UploadingHsl? avatar,
    String? modelSet,
    String? referenceText,
    String? recording,
    String? repating,
    String? description,
    String? introduction,
  });
  CopyWith$Input$UploadingHsl<TRes> get avatar;
}

class _CopyWithImpl$Input$CreateJourneyInput<TRes>
    implements CopyWith$Input$CreateJourneyInput<TRes> {
  _CopyWithImpl$Input$CreateJourneyInput(
    this._instance,
    this._then,
  );

  final Input$CreateJourneyInput _instance;

  final TRes Function(Input$CreateJourneyInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? to = _undefined,
    Object? from = _undefined,
    Object? name = _undefined,
    Object? avatar = _undefined,
    Object? modelSet = _undefined,
    Object? referenceText = _undefined,
    Object? recording = _undefined,
    Object? repating = _undefined,
    Object? description = _undefined,
    Object? introduction = _undefined,
  }) =>
      _then(Input$CreateJourneyInput._({
        ..._instance._$data,
        if (to != _undefined && to != null) 'to': (to as String),
        if (from != _undefined && from != null) 'from': (from as String),
        if (name != _undefined && name != null) 'name': (name as String),
        if (avatar != _undefined && avatar != null)
          'avatar': (avatar as Input$UploadingHsl),
        if (modelSet != _undefined && modelSet != null)
          'modelSet': (modelSet as String),
        if (referenceText != _undefined && referenceText != null)
          'referenceText': (referenceText as String),
        if (recording != _undefined) 'recording': (recording as String?),
        if (repating != _undefined) 'repating': (repating as String?),
        if (description != _undefined) 'description': (description as String?),
        if (introduction != _undefined)
          'introduction': (introduction as String?),
      }));

  CopyWith$Input$UploadingHsl<TRes> get avatar {
    final local$avatar = _instance.avatar;
    return CopyWith$Input$UploadingHsl(local$avatar, (e) => call(avatar: e));
  }
}

class _CopyWithStubImpl$Input$CreateJourneyInput<TRes>
    implements CopyWith$Input$CreateJourneyInput<TRes> {
  _CopyWithStubImpl$Input$CreateJourneyInput(this._res);

  TRes _res;

  call({
    String? to,
    String? from,
    String? name,
    Input$UploadingHsl? avatar,
    String? modelSet,
    String? referenceText,
    String? recording,
    String? repating,
    String? description,
    String? introduction,
  }) =>
      _res;

  CopyWith$Input$UploadingHsl<TRes> get avatar =>
      CopyWith$Input$UploadingHsl.stub(_res);
}

class Input$UpdateJourneyInput {
  factory Input$UpdateJourneyInput({
    String? name,
    String? avatar,
  }) =>
      Input$UpdateJourneyInput._({
        if (name != null) r'name': name,
        if (avatar != null) r'avatar': avatar,
      });

  Input$UpdateJourneyInput._(this._$data);

  factory Input$UpdateJourneyInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('avatar')) {
      final l$avatar = data['avatar'];
      result$data['avatar'] = (l$avatar as String?);
    }
    return Input$UpdateJourneyInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get name => (_$data['name'] as String?);

  String? get avatar => (_$data['avatar'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('avatar')) {
      final l$avatar = avatar;
      result$data['avatar'] = l$avatar;
    }
    return result$data;
  }

  CopyWith$Input$UpdateJourneyInput<Input$UpdateJourneyInput> get copyWith =>
      CopyWith$Input$UpdateJourneyInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$UpdateJourneyInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$avatar = avatar;
    final lOther$avatar = other.avatar;
    if (_$data.containsKey('avatar') != other._$data.containsKey('avatar')) {
      return false;
    }
    if (l$avatar != lOther$avatar) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$avatar = avatar;
    return Object.hashAll([
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('avatar') ? l$avatar : const {},
    ]);
  }
}

abstract class CopyWith$Input$UpdateJourneyInput<TRes> {
  factory CopyWith$Input$UpdateJourneyInput(
    Input$UpdateJourneyInput instance,
    TRes Function(Input$UpdateJourneyInput) then,
  ) = _CopyWithImpl$Input$UpdateJourneyInput;

  factory CopyWith$Input$UpdateJourneyInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdateJourneyInput;

  TRes call({
    String? name,
    String? avatar,
  });
}

class _CopyWithImpl$Input$UpdateJourneyInput<TRes>
    implements CopyWith$Input$UpdateJourneyInput<TRes> {
  _CopyWithImpl$Input$UpdateJourneyInput(
    this._instance,
    this._then,
  );

  final Input$UpdateJourneyInput _instance;

  final TRes Function(Input$UpdateJourneyInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? avatar = _undefined,
  }) =>
      _then(Input$UpdateJourneyInput._({
        ..._instance._$data,
        if (name != _undefined) 'name': (name as String?),
        if (avatar != _undefined) 'avatar': (avatar as String?),
      }));
}

class _CopyWithStubImpl$Input$UpdateJourneyInput<TRes>
    implements CopyWith$Input$UpdateJourneyInput<TRes> {
  _CopyWithStubImpl$Input$UpdateJourneyInput(this._res);

  TRes _res;

  call({
    String? name,
    String? avatar,
  }) =>
      _res;
}

class Input$DocumentationInput {
  factory Input$DocumentationInput({
    required String journeyId,
    required String title,
    required String searchTerm,
  }) =>
      Input$DocumentationInput._({
        r'journeyId': journeyId,
        r'title': title,
        r'searchTerm': searchTerm,
      });

  Input$DocumentationInput._(this._$data);

  factory Input$DocumentationInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$journeyId = data['journeyId'];
    result$data['journeyId'] = (l$journeyId as String);
    final l$title = data['title'];
    result$data['title'] = (l$title as String);
    final l$searchTerm = data['searchTerm'];
    result$data['searchTerm'] = (l$searchTerm as String);
    return Input$DocumentationInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get journeyId => (_$data['journeyId'] as String);

  String get title => (_$data['title'] as String);

  String get searchTerm => (_$data['searchTerm'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$journeyId = journeyId;
    result$data['journeyId'] = l$journeyId;
    final l$title = title;
    result$data['title'] = l$title;
    final l$searchTerm = searchTerm;
    result$data['searchTerm'] = l$searchTerm;
    return result$data;
  }

  CopyWith$Input$DocumentationInput<Input$DocumentationInput> get copyWith =>
      CopyWith$Input$DocumentationInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$DocumentationInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$journeyId = journeyId;
    final lOther$journeyId = other.journeyId;
    if (l$journeyId != lOther$journeyId) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$searchTerm = searchTerm;
    final lOther$searchTerm = other.searchTerm;
    if (l$searchTerm != lOther$searchTerm) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$journeyId = journeyId;
    final l$title = title;
    final l$searchTerm = searchTerm;
    return Object.hashAll([
      l$journeyId,
      l$title,
      l$searchTerm,
    ]);
  }
}

abstract class CopyWith$Input$DocumentationInput<TRes> {
  factory CopyWith$Input$DocumentationInput(
    Input$DocumentationInput instance,
    TRes Function(Input$DocumentationInput) then,
  ) = _CopyWithImpl$Input$DocumentationInput;

  factory CopyWith$Input$DocumentationInput.stub(TRes res) =
      _CopyWithStubImpl$Input$DocumentationInput;

  TRes call({
    String? journeyId,
    String? title,
    String? searchTerm,
  });
}

class _CopyWithImpl$Input$DocumentationInput<TRes>
    implements CopyWith$Input$DocumentationInput<TRes> {
  _CopyWithImpl$Input$DocumentationInput(
    this._instance,
    this._then,
  );

  final Input$DocumentationInput _instance;

  final TRes Function(Input$DocumentationInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? journeyId = _undefined,
    Object? title = _undefined,
    Object? searchTerm = _undefined,
  }) =>
      _then(Input$DocumentationInput._({
        ..._instance._$data,
        if (journeyId != _undefined && journeyId != null)
          'journeyId': (journeyId as String),
        if (title != _undefined && title != null) 'title': (title as String),
        if (searchTerm != _undefined && searchTerm != null)
          'searchTerm': (searchTerm as String),
      }));
}

class _CopyWithStubImpl$Input$DocumentationInput<TRes>
    implements CopyWith$Input$DocumentationInput<TRes> {
  _CopyWithStubImpl$Input$DocumentationInput(this._res);

  TRes _res;

  call({
    String? journeyId,
    String? title,
    String? searchTerm,
  }) =>
      _res;
}

class Input$CreateMaterialInput {
  factory Input$CreateMaterialInput({required String journeyId}) =>
      Input$CreateMaterialInput._({
        r'journeyId': journeyId,
      });

  Input$CreateMaterialInput._(this._$data);

  factory Input$CreateMaterialInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$journeyId = data['journeyId'];
    result$data['journeyId'] = (l$journeyId as String);
    return Input$CreateMaterialInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get journeyId => (_$data['journeyId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$journeyId = journeyId;
    result$data['journeyId'] = l$journeyId;
    return result$data;
  }

  CopyWith$Input$CreateMaterialInput<Input$CreateMaterialInput> get copyWith =>
      CopyWith$Input$CreateMaterialInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CreateMaterialInput ||
        runtimeType != other.runtimeType) {
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
    final l$journeyId = journeyId;
    return Object.hashAll([l$journeyId]);
  }
}

abstract class CopyWith$Input$CreateMaterialInput<TRes> {
  factory CopyWith$Input$CreateMaterialInput(
    Input$CreateMaterialInput instance,
    TRes Function(Input$CreateMaterialInput) then,
  ) = _CopyWithImpl$Input$CreateMaterialInput;

  factory CopyWith$Input$CreateMaterialInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreateMaterialInput;

  TRes call({String? journeyId});
}

class _CopyWithImpl$Input$CreateMaterialInput<TRes>
    implements CopyWith$Input$CreateMaterialInput<TRes> {
  _CopyWithImpl$Input$CreateMaterialInput(
    this._instance,
    this._then,
  );

  final Input$CreateMaterialInput _instance;

  final TRes Function(Input$CreateMaterialInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? journeyId = _undefined}) =>
      _then(Input$CreateMaterialInput._({
        ..._instance._$data,
        if (journeyId != _undefined && journeyId != null)
          'journeyId': (journeyId as String),
      }));
}

class _CopyWithStubImpl$Input$CreateMaterialInput<TRes>
    implements CopyWith$Input$CreateMaterialInput<TRes> {
  _CopyWithStubImpl$Input$CreateMaterialInput(this._res);

  TRes _res;

  call({String? journeyId}) => _res;
}

class Input$AnswerMaterialInput {
  factory Input$AnswerMaterialInput({
    required String materialId,
    required String stageId,
    required String partId,
    required dynamic answer,
  }) =>
      Input$AnswerMaterialInput._({
        r'materialId': materialId,
        r'stageId': stageId,
        r'partId': partId,
        r'answer': answer,
      });

  Input$AnswerMaterialInput._(this._$data);

  factory Input$AnswerMaterialInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$materialId = data['materialId'];
    result$data['materialId'] = (l$materialId as String);
    final l$stageId = data['stageId'];
    result$data['stageId'] = (l$stageId as String);
    final l$partId = data['partId'];
    result$data['partId'] = (l$partId as String);
    final l$answer = data['answer'];
    result$data['answer'] = jsonFromString(l$answer);
    return Input$AnswerMaterialInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get materialId => (_$data['materialId'] as String);

  String get stageId => (_$data['stageId'] as String);

  String get partId => (_$data['partId'] as String);

  dynamic get answer => (_$data['answer'] as dynamic);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$materialId = materialId;
    result$data['materialId'] = l$materialId;
    final l$stageId = stageId;
    result$data['stageId'] = l$stageId;
    final l$partId = partId;
    result$data['partId'] = l$partId;
    final l$answer = answer;
    result$data['answer'] = jsonToString(l$answer);
    return result$data;
  }

  CopyWith$Input$AnswerMaterialInput<Input$AnswerMaterialInput> get copyWith =>
      CopyWith$Input$AnswerMaterialInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$AnswerMaterialInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$materialId = materialId;
    final lOther$materialId = other.materialId;
    if (l$materialId != lOther$materialId) {
      return false;
    }
    final l$stageId = stageId;
    final lOther$stageId = other.stageId;
    if (l$stageId != lOther$stageId) {
      return false;
    }
    final l$partId = partId;
    final lOther$partId = other.partId;
    if (l$partId != lOther$partId) {
      return false;
    }
    final l$answer = answer;
    final lOther$answer = other.answer;
    if (l$answer != lOther$answer) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$materialId = materialId;
    final l$stageId = stageId;
    final l$partId = partId;
    final l$answer = answer;
    return Object.hashAll([
      l$materialId,
      l$stageId,
      l$partId,
      l$answer,
    ]);
  }
}

abstract class CopyWith$Input$AnswerMaterialInput<TRes> {
  factory CopyWith$Input$AnswerMaterialInput(
    Input$AnswerMaterialInput instance,
    TRes Function(Input$AnswerMaterialInput) then,
  ) = _CopyWithImpl$Input$AnswerMaterialInput;

  factory CopyWith$Input$AnswerMaterialInput.stub(TRes res) =
      _CopyWithStubImpl$Input$AnswerMaterialInput;

  TRes call({
    String? materialId,
    String? stageId,
    String? partId,
    dynamic? answer,
  });
}

class _CopyWithImpl$Input$AnswerMaterialInput<TRes>
    implements CopyWith$Input$AnswerMaterialInput<TRes> {
  _CopyWithImpl$Input$AnswerMaterialInput(
    this._instance,
    this._then,
  );

  final Input$AnswerMaterialInput _instance;

  final TRes Function(Input$AnswerMaterialInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? materialId = _undefined,
    Object? stageId = _undefined,
    Object? partId = _undefined,
    Object? answer = _undefined,
  }) =>
      _then(Input$AnswerMaterialInput._({
        ..._instance._$data,
        if (materialId != _undefined && materialId != null)
          'materialId': (materialId as String),
        if (stageId != _undefined && stageId != null)
          'stageId': (stageId as String),
        if (partId != _undefined && partId != null)
          'partId': (partId as String),
        if (answer != _undefined && answer != null)
          'answer': (answer as dynamic),
      }));
}

class _CopyWithStubImpl$Input$AnswerMaterialInput<TRes>
    implements CopyWith$Input$AnswerMaterialInput<TRes> {
  _CopyWithStubImpl$Input$AnswerMaterialInput(this._res);

  TRes _res;

  call({
    String? materialId,
    String? stageId,
    String? partId,
    dynamic? answer,
  }) =>
      _res;
}

class Input$StartConversationInput {
  factory Input$StartConversationInput({required String materialId}) =>
      Input$StartConversationInput._({
        r'materialId': materialId,
      });

  Input$StartConversationInput._(this._$data);

  factory Input$StartConversationInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$materialId = data['materialId'];
    result$data['materialId'] = (l$materialId as String);
    return Input$StartConversationInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get materialId => (_$data['materialId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$materialId = materialId;
    result$data['materialId'] = l$materialId;
    return result$data;
  }

  CopyWith$Input$StartConversationInput<Input$StartConversationInput>
      get copyWith => CopyWith$Input$StartConversationInput(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$StartConversationInput ||
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

abstract class CopyWith$Input$StartConversationInput<TRes> {
  factory CopyWith$Input$StartConversationInput(
    Input$StartConversationInput instance,
    TRes Function(Input$StartConversationInput) then,
  ) = _CopyWithImpl$Input$StartConversationInput;

  factory CopyWith$Input$StartConversationInput.stub(TRes res) =
      _CopyWithStubImpl$Input$StartConversationInput;

  TRes call({String? materialId});
}

class _CopyWithImpl$Input$StartConversationInput<TRes>
    implements CopyWith$Input$StartConversationInput<TRes> {
  _CopyWithImpl$Input$StartConversationInput(
    this._instance,
    this._then,
  );

  final Input$StartConversationInput _instance;

  final TRes Function(Input$StartConversationInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? materialId = _undefined}) =>
      _then(Input$StartConversationInput._({
        ..._instance._$data,
        if (materialId != _undefined && materialId != null)
          'materialId': (materialId as String),
      }));
}

class _CopyWithStubImpl$Input$StartConversationInput<TRes>
    implements CopyWith$Input$StartConversationInput<TRes> {
  _CopyWithStubImpl$Input$StartConversationInput(this._res);

  TRes _res;

  call({String? materialId}) => _res;
}

class Input$AddUserInputInput {
  factory Input$AddUserInputInput({
    required String materialId,
    String? text,
    String? audio_ID,
  }) =>
      Input$AddUserInputInput._({
        r'materialId': materialId,
        if (text != null) r'text': text,
        if (audio_ID != null) r'audio_ID': audio_ID,
      });

  Input$AddUserInputInput._(this._$data);

  factory Input$AddUserInputInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$materialId = data['materialId'];
    result$data['materialId'] = (l$materialId as String);
    if (data.containsKey('text')) {
      final l$text = data['text'];
      result$data['text'] = (l$text as String?);
    }
    if (data.containsKey('audio_ID')) {
      final l$audio_ID = data['audio_ID'];
      result$data['audio_ID'] = (l$audio_ID as String?);
    }
    return Input$AddUserInputInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get materialId => (_$data['materialId'] as String);

  String? get text => (_$data['text'] as String?);

  String? get audio_ID => (_$data['audio_ID'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$materialId = materialId;
    result$data['materialId'] = l$materialId;
    if (_$data.containsKey('text')) {
      final l$text = text;
      result$data['text'] = l$text;
    }
    if (_$data.containsKey('audio_ID')) {
      final l$audio_ID = audio_ID;
      result$data['audio_ID'] = l$audio_ID;
    }
    return result$data;
  }

  CopyWith$Input$AddUserInputInput<Input$AddUserInputInput> get copyWith =>
      CopyWith$Input$AddUserInputInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$AddUserInputInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$materialId = materialId;
    final lOther$materialId = other.materialId;
    if (l$materialId != lOther$materialId) {
      return false;
    }
    final l$text = text;
    final lOther$text = other.text;
    if (_$data.containsKey('text') != other._$data.containsKey('text')) {
      return false;
    }
    if (l$text != lOther$text) {
      return false;
    }
    final l$audio_ID = audio_ID;
    final lOther$audio_ID = other.audio_ID;
    if (_$data.containsKey('audio_ID') !=
        other._$data.containsKey('audio_ID')) {
      return false;
    }
    if (l$audio_ID != lOther$audio_ID) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$materialId = materialId;
    final l$text = text;
    final l$audio_ID = audio_ID;
    return Object.hashAll([
      l$materialId,
      _$data.containsKey('text') ? l$text : const {},
      _$data.containsKey('audio_ID') ? l$audio_ID : const {},
    ]);
  }
}

abstract class CopyWith$Input$AddUserInputInput<TRes> {
  factory CopyWith$Input$AddUserInputInput(
    Input$AddUserInputInput instance,
    TRes Function(Input$AddUserInputInput) then,
  ) = _CopyWithImpl$Input$AddUserInputInput;

  factory CopyWith$Input$AddUserInputInput.stub(TRes res) =
      _CopyWithStubImpl$Input$AddUserInputInput;

  TRes call({
    String? materialId,
    String? text,
    String? audio_ID,
  });
}

class _CopyWithImpl$Input$AddUserInputInput<TRes>
    implements CopyWith$Input$AddUserInputInput<TRes> {
  _CopyWithImpl$Input$AddUserInputInput(
    this._instance,
    this._then,
  );

  final Input$AddUserInputInput _instance;

  final TRes Function(Input$AddUserInputInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? materialId = _undefined,
    Object? text = _undefined,
    Object? audio_ID = _undefined,
  }) =>
      _then(Input$AddUserInputInput._({
        ..._instance._$data,
        if (materialId != _undefined && materialId != null)
          'materialId': (materialId as String),
        if (text != _undefined) 'text': (text as String?),
        if (audio_ID != _undefined) 'audio_ID': (audio_ID as String?),
      }));
}

class _CopyWithStubImpl$Input$AddUserInputInput<TRes>
    implements CopyWith$Input$AddUserInputInput<TRes> {
  _CopyWithStubImpl$Input$AddUserInputInput(this._res);

  TRes _res;

  call({
    String? materialId,
    String? text,
    String? audio_ID,
  }) =>
      _res;
}

class Input$GenMaterialInput {
  factory Input$GenMaterialInput({
    required String journeyId,
    required String stageId,
    required Enum$MaterialType type,
  }) =>
      Input$GenMaterialInput._({
        r'journeyId': journeyId,
        r'stageId': stageId,
        r'type': type,
      });

  Input$GenMaterialInput._(this._$data);

  factory Input$GenMaterialInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$journeyId = data['journeyId'];
    result$data['journeyId'] = (l$journeyId as String);
    final l$stageId = data['stageId'];
    result$data['stageId'] = (l$stageId as String);
    final l$type = data['type'];
    result$data['type'] = fromJson$Enum$MaterialType((l$type as String));
    return Input$GenMaterialInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get journeyId => (_$data['journeyId'] as String);

  String get stageId => (_$data['stageId'] as String);

  Enum$MaterialType get type => (_$data['type'] as Enum$MaterialType);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$journeyId = journeyId;
    result$data['journeyId'] = l$journeyId;
    final l$stageId = stageId;
    result$data['stageId'] = l$stageId;
    final l$type = type;
    result$data['type'] = toJson$Enum$MaterialType(l$type);
    return result$data;
  }

  CopyWith$Input$GenMaterialInput<Input$GenMaterialInput> get copyWith =>
      CopyWith$Input$GenMaterialInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$GenMaterialInput || runtimeType != other.runtimeType) {
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
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$journeyId = journeyId;
    final l$stageId = stageId;
    final l$type = type;
    return Object.hashAll([
      l$journeyId,
      l$stageId,
      l$type,
    ]);
  }
}

abstract class CopyWith$Input$GenMaterialInput<TRes> {
  factory CopyWith$Input$GenMaterialInput(
    Input$GenMaterialInput instance,
    TRes Function(Input$GenMaterialInput) then,
  ) = _CopyWithImpl$Input$GenMaterialInput;

  factory CopyWith$Input$GenMaterialInput.stub(TRes res) =
      _CopyWithStubImpl$Input$GenMaterialInput;

  TRes call({
    String? journeyId,
    String? stageId,
    Enum$MaterialType? type,
  });
}

class _CopyWithImpl$Input$GenMaterialInput<TRes>
    implements CopyWith$Input$GenMaterialInput<TRes> {
  _CopyWithImpl$Input$GenMaterialInput(
    this._instance,
    this._then,
  );

  final Input$GenMaterialInput _instance;

  final TRes Function(Input$GenMaterialInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? journeyId = _undefined,
    Object? stageId = _undefined,
    Object? type = _undefined,
  }) =>
      _then(Input$GenMaterialInput._({
        ..._instance._$data,
        if (journeyId != _undefined && journeyId != null)
          'journeyId': (journeyId as String),
        if (stageId != _undefined && stageId != null)
          'stageId': (stageId as String),
        if (type != _undefined && type != null)
          'type': (type as Enum$MaterialType),
      }));
}

class _CopyWithStubImpl$Input$GenMaterialInput<TRes>
    implements CopyWith$Input$GenMaterialInput<TRes> {
  _CopyWithStubImpl$Input$GenMaterialInput(this._res);

  TRes _res;

  call({
    String? journeyId,
    String? stageId,
    Enum$MaterialType? type,
  }) =>
      _res;
}

enum Enum$Domains {
  user,
  org,
  admin,
  public,
  auth,
  $unknown;

  factory Enum$Domains.fromJson(String value) => fromJson$Enum$Domains(value);

  String toJson() => toJson$Enum$Domains(this);
}

String toJson$Enum$Domains(Enum$Domains e) {
  switch (e) {
    case Enum$Domains.user:
      return r'user';
    case Enum$Domains.org:
      return r'org';
    case Enum$Domains.admin:
      return r'admin';
    case Enum$Domains.public:
      return r'public';
    case Enum$Domains.auth:
      return r'auth';
    case Enum$Domains.$unknown:
      return r'$unknown';
  }
}

Enum$Domains fromJson$Enum$Domains(String value) {
  switch (value) {
    case r'user':
      return Enum$Domains.user;
    case r'org':
      return Enum$Domains.org;
    case r'admin':
      return Enum$Domains.admin;
    case r'public':
      return Enum$Domains.public;
    case r'auth':
      return Enum$Domains.auth;
    default:
      return Enum$Domains.$unknown;
  }
}

enum Enum$Providers {
  EMAIL,
  PHONE,
  GOOGLE,
  APPLE,
  $unknown;

  factory Enum$Providers.fromJson(String value) =>
      fromJson$Enum$Providers(value);

  String toJson() => toJson$Enum$Providers(this);
}

String toJson$Enum$Providers(Enum$Providers e) {
  switch (e) {
    case Enum$Providers.EMAIL:
      return r'EMAIL';
    case Enum$Providers.PHONE:
      return r'PHONE';
    case Enum$Providers.GOOGLE:
      return r'GOOGLE';
    case Enum$Providers.APPLE:
      return r'APPLE';
    case Enum$Providers.$unknown:
      return r'$unknown';
  }
}

Enum$Providers fromJson$Enum$Providers(String value) {
  switch (value) {
    case r'EMAIL':
      return Enum$Providers.EMAIL;
    case r'PHONE':
      return Enum$Providers.PHONE;
    case r'GOOGLE':
      return Enum$Providers.GOOGLE;
    case r'APPLE':
      return Enum$Providers.APPLE;
    default:
      return Enum$Providers.$unknown;
  }
}

enum Enum$FeedbackType {
  FEEDBACK,
  COMPLAINT,
  $unknown;

  factory Enum$FeedbackType.fromJson(String value) =>
      fromJson$Enum$FeedbackType(value);

  String toJson() => toJson$Enum$FeedbackType(this);
}

String toJson$Enum$FeedbackType(Enum$FeedbackType e) {
  switch (e) {
    case Enum$FeedbackType.FEEDBACK:
      return r'FEEDBACK';
    case Enum$FeedbackType.COMPLAINT:
      return r'COMPLAINT';
    case Enum$FeedbackType.$unknown:
      return r'$unknown';
  }
}

Enum$FeedbackType fromJson$Enum$FeedbackType(String value) {
  switch (value) {
    case r'FEEDBACK':
      return Enum$FeedbackType.FEEDBACK;
    case r'COMPLAINT':
      return Enum$FeedbackType.COMPLAINT;
    default:
      return Enum$FeedbackType.$unknown;
  }
}

enum Enum$FeedbackStatus {
  PENDING,
  APPROVED,
  REJECTED,
  $unknown;

  factory Enum$FeedbackStatus.fromJson(String value) =>
      fromJson$Enum$FeedbackStatus(value);

  String toJson() => toJson$Enum$FeedbackStatus(this);
}

String toJson$Enum$FeedbackStatus(Enum$FeedbackStatus e) {
  switch (e) {
    case Enum$FeedbackStatus.PENDING:
      return r'PENDING';
    case Enum$FeedbackStatus.APPROVED:
      return r'APPROVED';
    case Enum$FeedbackStatus.REJECTED:
      return r'REJECTED';
    case Enum$FeedbackStatus.$unknown:
      return r'$unknown';
  }
}

Enum$FeedbackStatus fromJson$Enum$FeedbackStatus(String value) {
  switch (value) {
    case r'PENDING':
      return Enum$FeedbackStatus.PENDING;
    case r'APPROVED':
      return Enum$FeedbackStatus.APPROVED;
    case r'REJECTED':
      return Enum$FeedbackStatus.REJECTED;
    default:
      return Enum$FeedbackStatus.$unknown;
  }
}

enum Enum$FeedbackCategory {
  SERVICE,
  SERVICER,
  ORGANIZATION,
  USER,
  REVIEW,
  OTHER,
  $unknown;

  factory Enum$FeedbackCategory.fromJson(String value) =>
      fromJson$Enum$FeedbackCategory(value);

  String toJson() => toJson$Enum$FeedbackCategory(this);
}

String toJson$Enum$FeedbackCategory(Enum$FeedbackCategory e) {
  switch (e) {
    case Enum$FeedbackCategory.SERVICE:
      return r'SERVICE';
    case Enum$FeedbackCategory.SERVICER:
      return r'SERVICER';
    case Enum$FeedbackCategory.ORGANIZATION:
      return r'ORGANIZATION';
    case Enum$FeedbackCategory.USER:
      return r'USER';
    case Enum$FeedbackCategory.REVIEW:
      return r'REVIEW';
    case Enum$FeedbackCategory.OTHER:
      return r'OTHER';
    case Enum$FeedbackCategory.$unknown:
      return r'$unknown';
  }
}

Enum$FeedbackCategory fromJson$Enum$FeedbackCategory(String value) {
  switch (value) {
    case r'SERVICE':
      return Enum$FeedbackCategory.SERVICE;
    case r'SERVICER':
      return Enum$FeedbackCategory.SERVICER;
    case r'ORGANIZATION':
      return Enum$FeedbackCategory.ORGANIZATION;
    case r'USER':
      return Enum$FeedbackCategory.USER;
    case r'REVIEW':
      return Enum$FeedbackCategory.REVIEW;
    case r'OTHER':
      return Enum$FeedbackCategory.OTHER;
    default:
      return Enum$FeedbackCategory.$unknown;
  }
}

enum Enum$StageStatus {
  GENERATING,
  GENERATED,
  COMPLETED,
  $unknown;

  factory Enum$StageStatus.fromJson(String value) =>
      fromJson$Enum$StageStatus(value);

  String toJson() => toJson$Enum$StageStatus(this);
}

String toJson$Enum$StageStatus(Enum$StageStatus e) {
  switch (e) {
    case Enum$StageStatus.GENERATING:
      return r'GENERATING';
    case Enum$StageStatus.GENERATED:
      return r'GENERATED';
    case Enum$StageStatus.COMPLETED:
      return r'COMPLETED';
    case Enum$StageStatus.$unknown:
      return r'$unknown';
  }
}

Enum$StageStatus fromJson$Enum$StageStatus(String value) {
  switch (value) {
    case r'GENERATING':
      return Enum$StageStatus.GENERATING;
    case r'GENERATED':
      return Enum$StageStatus.GENERATED;
    case r'COMPLETED':
      return Enum$StageStatus.COMPLETED;
    default:
      return Enum$StageStatus.$unknown;
  }
}

enum Enum$StagePartType {
  DOCUMENTATION,
  TEST,
  WORDS,
  SENTENCES,
  GRAPHEMES,
  $unknown;

  factory Enum$StagePartType.fromJson(String value) =>
      fromJson$Enum$StagePartType(value);

  String toJson() => toJson$Enum$StagePartType(this);
}

String toJson$Enum$StagePartType(Enum$StagePartType e) {
  switch (e) {
    case Enum$StagePartType.DOCUMENTATION:
      return r'DOCUMENTATION';
    case Enum$StagePartType.TEST:
      return r'TEST';
    case Enum$StagePartType.WORDS:
      return r'WORDS';
    case Enum$StagePartType.SENTENCES:
      return r'SENTENCES';
    case Enum$StagePartType.GRAPHEMES:
      return r'GRAPHEMES';
    case Enum$StagePartType.$unknown:
      return r'$unknown';
  }
}

Enum$StagePartType fromJson$Enum$StagePartType(String value) {
  switch (value) {
    case r'DOCUMENTATION':
      return Enum$StagePartType.DOCUMENTATION;
    case r'TEST':
      return Enum$StagePartType.TEST;
    case r'WORDS':
      return Enum$StagePartType.WORDS;
    case r'SENTENCES':
      return Enum$StagePartType.SENTENCES;
    case r'GRAPHEMES':
      return Enum$StagePartType.GRAPHEMES;
    default:
      return Enum$StagePartType.$unknown;
  }
}

enum Enum$MaterialType {
  STORY,
  QUIZ,
  CONVERSATION,
  UNKNOWN,
  $unknown;

  factory Enum$MaterialType.fromJson(String value) =>
      fromJson$Enum$MaterialType(value);

  String toJson() => toJson$Enum$MaterialType(this);
}

String toJson$Enum$MaterialType(Enum$MaterialType e) {
  switch (e) {
    case Enum$MaterialType.STORY:
      return r'STORY';
    case Enum$MaterialType.QUIZ:
      return r'QUIZ';
    case Enum$MaterialType.CONVERSATION:
      return r'CONVERSATION';
    case Enum$MaterialType.UNKNOWN:
      return r'UNKNOWN';
    case Enum$MaterialType.$unknown:
      return r'$unknown';
  }
}

Enum$MaterialType fromJson$Enum$MaterialType(String value) {
  switch (value) {
    case r'STORY':
      return Enum$MaterialType.STORY;
    case r'QUIZ':
      return Enum$MaterialType.QUIZ;
    case r'CONVERSATION':
      return Enum$MaterialType.CONVERSATION;
    case r'UNKNOWN':
      return Enum$MaterialType.UNKNOWN;
    default:
      return Enum$MaterialType.$unknown;
  }
}

enum Enum$MaterialGenStatus {
  CREATING,
  PREPARING,
  COMPLETED,
  ERROR,
  $unknown;

  factory Enum$MaterialGenStatus.fromJson(String value) =>
      fromJson$Enum$MaterialGenStatus(value);

  String toJson() => toJson$Enum$MaterialGenStatus(this);
}

String toJson$Enum$MaterialGenStatus(Enum$MaterialGenStatus e) {
  switch (e) {
    case Enum$MaterialGenStatus.CREATING:
      return r'CREATING';
    case Enum$MaterialGenStatus.PREPARING:
      return r'PREPARING';
    case Enum$MaterialGenStatus.COMPLETED:
      return r'COMPLETED';
    case Enum$MaterialGenStatus.ERROR:
      return r'ERROR';
    case Enum$MaterialGenStatus.$unknown:
      return r'$unknown';
  }
}

Enum$MaterialGenStatus fromJson$Enum$MaterialGenStatus(String value) {
  switch (value) {
    case r'CREATING':
      return Enum$MaterialGenStatus.CREATING;
    case r'PREPARING':
      return Enum$MaterialGenStatus.PREPARING;
    case r'COMPLETED':
      return Enum$MaterialGenStatus.COMPLETED;
    case r'ERROR':
      return Enum$MaterialGenStatus.ERROR;
    default:
      return Enum$MaterialGenStatus.$unknown;
  }
}

enum Enum$MaterialCompStatus {
  NOT_STARTED,
  COMPLETED,
  ANALYZING,
  ERROR,
  $unknown;

  factory Enum$MaterialCompStatus.fromJson(String value) =>
      fromJson$Enum$MaterialCompStatus(value);

  String toJson() => toJson$Enum$MaterialCompStatus(this);
}

String toJson$Enum$MaterialCompStatus(Enum$MaterialCompStatus e) {
  switch (e) {
    case Enum$MaterialCompStatus.NOT_STARTED:
      return r'NOT_STARTED';
    case Enum$MaterialCompStatus.COMPLETED:
      return r'COMPLETED';
    case Enum$MaterialCompStatus.ANALYZING:
      return r'ANALYZING';
    case Enum$MaterialCompStatus.ERROR:
      return r'ERROR';
    case Enum$MaterialCompStatus.$unknown:
      return r'$unknown';
  }
}

Enum$MaterialCompStatus fromJson$Enum$MaterialCompStatus(String value) {
  switch (value) {
    case r'NOT_STARTED':
      return Enum$MaterialCompStatus.NOT_STARTED;
    case r'COMPLETED':
      return Enum$MaterialCompStatus.COMPLETED;
    case r'ANALYZING':
      return Enum$MaterialCompStatus.ANALYZING;
    case r'ERROR':
      return Enum$MaterialCompStatus.ERROR;
    default:
      return Enum$MaterialCompStatus.$unknown;
  }
}

enum Enum$MaterialConvStatus {
  NOT_STARTED,
  COMPLETED,
  PENDING,
  $unknown;

  factory Enum$MaterialConvStatus.fromJson(String value) =>
      fromJson$Enum$MaterialConvStatus(value);

  String toJson() => toJson$Enum$MaterialConvStatus(this);
}

String toJson$Enum$MaterialConvStatus(Enum$MaterialConvStatus e) {
  switch (e) {
    case Enum$MaterialConvStatus.NOT_STARTED:
      return r'NOT_STARTED';
    case Enum$MaterialConvStatus.COMPLETED:
      return r'COMPLETED';
    case Enum$MaterialConvStatus.PENDING:
      return r'PENDING';
    case Enum$MaterialConvStatus.$unknown:
      return r'$unknown';
  }
}

Enum$MaterialConvStatus fromJson$Enum$MaterialConvStatus(String value) {
  switch (value) {
    case r'NOT_STARTED':
      return Enum$MaterialConvStatus.NOT_STARTED;
    case r'COMPLETED':
      return Enum$MaterialConvStatus.COMPLETED;
    case r'PENDING':
      return Enum$MaterialConvStatus.PENDING;
    default:
      return Enum$MaterialConvStatus.$unknown;
  }
}

enum Enum$MaterialFeedbackStatus {
  NOT_STARTED,
  GENERATING,
  COMPLETED,
  ERROR,
  $unknown;

  factory Enum$MaterialFeedbackStatus.fromJson(String value) =>
      fromJson$Enum$MaterialFeedbackStatus(value);

  String toJson() => toJson$Enum$MaterialFeedbackStatus(this);
}

String toJson$Enum$MaterialFeedbackStatus(Enum$MaterialFeedbackStatus e) {
  switch (e) {
    case Enum$MaterialFeedbackStatus.NOT_STARTED:
      return r'NOT_STARTED';
    case Enum$MaterialFeedbackStatus.GENERATING:
      return r'GENERATING';
    case Enum$MaterialFeedbackStatus.COMPLETED:
      return r'COMPLETED';
    case Enum$MaterialFeedbackStatus.ERROR:
      return r'ERROR';
    case Enum$MaterialFeedbackStatus.$unknown:
      return r'$unknown';
  }
}

Enum$MaterialFeedbackStatus fromJson$Enum$MaterialFeedbackStatus(String value) {
  switch (value) {
    case r'NOT_STARTED':
      return Enum$MaterialFeedbackStatus.NOT_STARTED;
    case r'GENERATING':
      return Enum$MaterialFeedbackStatus.GENERATING;
    case r'COMPLETED':
      return Enum$MaterialFeedbackStatus.COMPLETED;
    case r'ERROR':
      return Enum$MaterialFeedbackStatus.ERROR;
    default:
      return Enum$MaterialFeedbackStatus.$unknown;
  }
}

enum Enum$StoryPartType {
  NARRATIVE,
  PICTURE,
  AUDIO,
  QUESTION,
  $unknown;

  factory Enum$StoryPartType.fromJson(String value) =>
      fromJson$Enum$StoryPartType(value);

  String toJson() => toJson$Enum$StoryPartType(this);
}

String toJson$Enum$StoryPartType(Enum$StoryPartType e) {
  switch (e) {
    case Enum$StoryPartType.NARRATIVE:
      return r'NARRATIVE';
    case Enum$StoryPartType.PICTURE:
      return r'PICTURE';
    case Enum$StoryPartType.AUDIO:
      return r'AUDIO';
    case Enum$StoryPartType.QUESTION:
      return r'QUESTION';
    case Enum$StoryPartType.$unknown:
      return r'$unknown';
  }
}

Enum$StoryPartType fromJson$Enum$StoryPartType(String value) {
  switch (value) {
    case r'NARRATIVE':
      return Enum$StoryPartType.NARRATIVE;
    case r'PICTURE':
      return Enum$StoryPartType.PICTURE;
    case r'AUDIO':
      return Enum$StoryPartType.AUDIO;
    case r'QUESTION':
      return Enum$StoryPartType.QUESTION;
    default:
      return Enum$StoryPartType.$unknown;
  }
}

enum Enum$QuizPreludeItemType {
  TEXT,
  PICTURE,
  AUDIO,
  $unknown;

  factory Enum$QuizPreludeItemType.fromJson(String value) =>
      fromJson$Enum$QuizPreludeItemType(value);

  String toJson() => toJson$Enum$QuizPreludeItemType(this);
}

String toJson$Enum$QuizPreludeItemType(Enum$QuizPreludeItemType e) {
  switch (e) {
    case Enum$QuizPreludeItemType.TEXT:
      return r'TEXT';
    case Enum$QuizPreludeItemType.PICTURE:
      return r'PICTURE';
    case Enum$QuizPreludeItemType.AUDIO:
      return r'AUDIO';
    case Enum$QuizPreludeItemType.$unknown:
      return r'$unknown';
  }
}

Enum$QuizPreludeItemType fromJson$Enum$QuizPreludeItemType(String value) {
  switch (value) {
    case r'TEXT':
      return Enum$QuizPreludeItemType.TEXT;
    case r'PICTURE':
      return Enum$QuizPreludeItemType.PICTURE;
    case r'AUDIO':
      return Enum$QuizPreludeItemType.AUDIO;
    default:
      return Enum$QuizPreludeItemType.$unknown;
  }
}

enum Enum$QuizQuestionType {
  MULTIPLE_CHOICE,
  CHOICE,
  TRUE_FALSE,
  FILL_BLANK,
  MATCHING,
  ORDERING,
  TEXT_WRITE,
  RECORD,
  $unknown;

  factory Enum$QuizQuestionType.fromJson(String value) =>
      fromJson$Enum$QuizQuestionType(value);

  String toJson() => toJson$Enum$QuizQuestionType(this);
}

String toJson$Enum$QuizQuestionType(Enum$QuizQuestionType e) {
  switch (e) {
    case Enum$QuizQuestionType.MULTIPLE_CHOICE:
      return r'MULTIPLE_CHOICE';
    case Enum$QuizQuestionType.CHOICE:
      return r'CHOICE';
    case Enum$QuizQuestionType.TRUE_FALSE:
      return r'TRUE_FALSE';
    case Enum$QuizQuestionType.FILL_BLANK:
      return r'FILL_BLANK';
    case Enum$QuizQuestionType.MATCHING:
      return r'MATCHING';
    case Enum$QuizQuestionType.ORDERING:
      return r'ORDERING';
    case Enum$QuizQuestionType.TEXT_WRITE:
      return r'TEXT_WRITE';
    case Enum$QuizQuestionType.RECORD:
      return r'RECORD';
    case Enum$QuizQuestionType.$unknown:
      return r'$unknown';
  }
}

Enum$QuizQuestionType fromJson$Enum$QuizQuestionType(String value) {
  switch (value) {
    case r'MULTIPLE_CHOICE':
      return Enum$QuizQuestionType.MULTIPLE_CHOICE;
    case r'CHOICE':
      return Enum$QuizQuestionType.CHOICE;
    case r'TRUE_FALSE':
      return Enum$QuizQuestionType.TRUE_FALSE;
    case r'FILL_BLANK':
      return Enum$QuizQuestionType.FILL_BLANK;
    case r'MATCHING':
      return Enum$QuizQuestionType.MATCHING;
    case r'ORDERING':
      return Enum$QuizQuestionType.ORDERING;
    case r'TEXT_WRITE':
      return Enum$QuizQuestionType.TEXT_WRITE;
    case r'RECORD':
      return Enum$QuizQuestionType.RECORD;
    default:
      return Enum$QuizQuestionType.$unknown;
  }
}

enum Enum$AIFeedbackType {
  CORRECTION,
  RECOMMENDATION,
  EXPLANATION,
  PRACTICE_TIP,
  GENERAL_FEEDBACK,
  OTHER,
  $unknown;

  factory Enum$AIFeedbackType.fromJson(String value) =>
      fromJson$Enum$AIFeedbackType(value);

  String toJson() => toJson$Enum$AIFeedbackType(this);
}

String toJson$Enum$AIFeedbackType(Enum$AIFeedbackType e) {
  switch (e) {
    case Enum$AIFeedbackType.CORRECTION:
      return r'CORRECTION';
    case Enum$AIFeedbackType.RECOMMENDATION:
      return r'RECOMMENDATION';
    case Enum$AIFeedbackType.EXPLANATION:
      return r'EXPLANATION';
    case Enum$AIFeedbackType.PRACTICE_TIP:
      return r'PRACTICE_TIP';
    case Enum$AIFeedbackType.GENERAL_FEEDBACK:
      return r'GENERAL_FEEDBACK';
    case Enum$AIFeedbackType.OTHER:
      return r'OTHER';
    case Enum$AIFeedbackType.$unknown:
      return r'$unknown';
  }
}

Enum$AIFeedbackType fromJson$Enum$AIFeedbackType(String value) {
  switch (value) {
    case r'CORRECTION':
      return Enum$AIFeedbackType.CORRECTION;
    case r'RECOMMENDATION':
      return Enum$AIFeedbackType.RECOMMENDATION;
    case r'EXPLANATION':
      return Enum$AIFeedbackType.EXPLANATION;
    case r'PRACTICE_TIP':
      return Enum$AIFeedbackType.PRACTICE_TIP;
    case r'GENERAL_FEEDBACK':
      return Enum$AIFeedbackType.GENERAL_FEEDBACK;
    case r'OTHER':
      return Enum$AIFeedbackType.OTHER;
    default:
      return Enum$AIFeedbackType.$unknown;
  }
}

enum Enum$AIFeedbackPartType {
  WRONG,
  RIGHT,
  TIP,
  EXPLANATION,
  OTHER,
  $unknown;

  factory Enum$AIFeedbackPartType.fromJson(String value) =>
      fromJson$Enum$AIFeedbackPartType(value);

  String toJson() => toJson$Enum$AIFeedbackPartType(this);
}

String toJson$Enum$AIFeedbackPartType(Enum$AIFeedbackPartType e) {
  switch (e) {
    case Enum$AIFeedbackPartType.WRONG:
      return r'WRONG';
    case Enum$AIFeedbackPartType.RIGHT:
      return r'RIGHT';
    case Enum$AIFeedbackPartType.TIP:
      return r'TIP';
    case Enum$AIFeedbackPartType.EXPLANATION:
      return r'EXPLANATION';
    case Enum$AIFeedbackPartType.OTHER:
      return r'OTHER';
    case Enum$AIFeedbackPartType.$unknown:
      return r'$unknown';
  }
}

Enum$AIFeedbackPartType fromJson$Enum$AIFeedbackPartType(String value) {
  switch (value) {
    case r'WRONG':
      return Enum$AIFeedbackPartType.WRONG;
    case r'RIGHT':
      return Enum$AIFeedbackPartType.RIGHT;
    case r'TIP':
      return Enum$AIFeedbackPartType.TIP;
    case r'EXPLANATION':
      return Enum$AIFeedbackPartType.EXPLANATION;
    case r'OTHER':
      return Enum$AIFeedbackPartType.OTHER;
    default:
      return Enum$AIFeedbackPartType.$unknown;
  }
}

enum Enum$UserDocExplanationType {
  text,
  picture,
  audio,
  $unknown;

  factory Enum$UserDocExplanationType.fromJson(String value) =>
      fromJson$Enum$UserDocExplanationType(value);

  String toJson() => toJson$Enum$UserDocExplanationType(this);
}

String toJson$Enum$UserDocExplanationType(Enum$UserDocExplanationType e) {
  switch (e) {
    case Enum$UserDocExplanationType.text:
      return r'text';
    case Enum$UserDocExplanationType.picture:
      return r'picture';
    case Enum$UserDocExplanationType.audio:
      return r'audio';
    case Enum$UserDocExplanationType.$unknown:
      return r'$unknown';
  }
}

Enum$UserDocExplanationType fromJson$Enum$UserDocExplanationType(String value) {
  switch (value) {
    case r'text':
      return Enum$UserDocExplanationType.text;
    case r'picture':
      return Enum$UserDocExplanationType.picture;
    case r'audio':
      return Enum$UserDocExplanationType.audio;
    default:
      return Enum$UserDocExplanationType.$unknown;
  }
}

enum Enum$UserDocExplanationUI {
  tip,
  example,
  explanation,
  note,
  warning,
  error,
  right,
  $unknown;

  factory Enum$UserDocExplanationUI.fromJson(String value) =>
      fromJson$Enum$UserDocExplanationUI(value);

  String toJson() => toJson$Enum$UserDocExplanationUI(this);
}

String toJson$Enum$UserDocExplanationUI(Enum$UserDocExplanationUI e) {
  switch (e) {
    case Enum$UserDocExplanationUI.tip:
      return r'tip';
    case Enum$UserDocExplanationUI.example:
      return r'example';
    case Enum$UserDocExplanationUI.explanation:
      return r'explanation';
    case Enum$UserDocExplanationUI.note:
      return r'note';
    case Enum$UserDocExplanationUI.warning:
      return r'warning';
    case Enum$UserDocExplanationUI.error:
      return r'error';
    case Enum$UserDocExplanationUI.right:
      return r'right';
    case Enum$UserDocExplanationUI.$unknown:
      return r'$unknown';
  }
}

Enum$UserDocExplanationUI fromJson$Enum$UserDocExplanationUI(String value) {
  switch (value) {
    case r'tip':
      return Enum$UserDocExplanationUI.tip;
    case r'example':
      return Enum$UserDocExplanationUI.example;
    case r'explanation':
      return Enum$UserDocExplanationUI.explanation;
    case r'note':
      return Enum$UserDocExplanationUI.note;
    case r'warning':
      return Enum$UserDocExplanationUI.warning;
    case r'error':
      return Enum$UserDocExplanationUI.error;
    case r'right':
      return Enum$UserDocExplanationUI.right;
    default:
      return Enum$UserDocExplanationUI.$unknown;
  }
}

enum Enum$__TypeKind {
  SCALAR,
  OBJECT,
  INTERFACE,
  UNION,
  ENUM,
  INPUT_OBJECT,
  LIST,
  NON_NULL,
  $unknown;

  factory Enum$__TypeKind.fromJson(String value) =>
      fromJson$Enum$__TypeKind(value);

  String toJson() => toJson$Enum$__TypeKind(this);
}

String toJson$Enum$__TypeKind(Enum$__TypeKind e) {
  switch (e) {
    case Enum$__TypeKind.SCALAR:
      return r'SCALAR';
    case Enum$__TypeKind.OBJECT:
      return r'OBJECT';
    case Enum$__TypeKind.INTERFACE:
      return r'INTERFACE';
    case Enum$__TypeKind.UNION:
      return r'UNION';
    case Enum$__TypeKind.ENUM:
      return r'ENUM';
    case Enum$__TypeKind.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__TypeKind.LIST:
      return r'LIST';
    case Enum$__TypeKind.NON_NULL:
      return r'NON_NULL';
    case Enum$__TypeKind.$unknown:
      return r'$unknown';
  }
}

Enum$__TypeKind fromJson$Enum$__TypeKind(String value) {
  switch (value) {
    case r'SCALAR':
      return Enum$__TypeKind.SCALAR;
    case r'OBJECT':
      return Enum$__TypeKind.OBJECT;
    case r'INTERFACE':
      return Enum$__TypeKind.INTERFACE;
    case r'UNION':
      return Enum$__TypeKind.UNION;
    case r'ENUM':
      return Enum$__TypeKind.ENUM;
    case r'INPUT_OBJECT':
      return Enum$__TypeKind.INPUT_OBJECT;
    case r'LIST':
      return Enum$__TypeKind.LIST;
    case r'NON_NULL':
      return Enum$__TypeKind.NON_NULL;
    default:
      return Enum$__TypeKind.$unknown;
  }
}

enum Enum$__DirectiveLocation {
  QUERY,
  MUTATION,
  SUBSCRIPTION,
  FIELD,
  FRAGMENT_DEFINITION,
  FRAGMENT_SPREAD,
  INLINE_FRAGMENT,
  VARIABLE_DEFINITION,
  SCHEMA,
  SCALAR,
  OBJECT,
  FIELD_DEFINITION,
  ARGUMENT_DEFINITION,
  INTERFACE,
  UNION,
  ENUM,
  ENUM_VALUE,
  INPUT_OBJECT,
  INPUT_FIELD_DEFINITION,
  $unknown;

  factory Enum$__DirectiveLocation.fromJson(String value) =>
      fromJson$Enum$__DirectiveLocation(value);

  String toJson() => toJson$Enum$__DirectiveLocation(this);
}

String toJson$Enum$__DirectiveLocation(Enum$__DirectiveLocation e) {
  switch (e) {
    case Enum$__DirectiveLocation.QUERY:
      return r'QUERY';
    case Enum$__DirectiveLocation.MUTATION:
      return r'MUTATION';
    case Enum$__DirectiveLocation.SUBSCRIPTION:
      return r'SUBSCRIPTION';
    case Enum$__DirectiveLocation.FIELD:
      return r'FIELD';
    case Enum$__DirectiveLocation.FRAGMENT_DEFINITION:
      return r'FRAGMENT_DEFINITION';
    case Enum$__DirectiveLocation.FRAGMENT_SPREAD:
      return r'FRAGMENT_SPREAD';
    case Enum$__DirectiveLocation.INLINE_FRAGMENT:
      return r'INLINE_FRAGMENT';
    case Enum$__DirectiveLocation.VARIABLE_DEFINITION:
      return r'VARIABLE_DEFINITION';
    case Enum$__DirectiveLocation.SCHEMA:
      return r'SCHEMA';
    case Enum$__DirectiveLocation.SCALAR:
      return r'SCALAR';
    case Enum$__DirectiveLocation.OBJECT:
      return r'OBJECT';
    case Enum$__DirectiveLocation.FIELD_DEFINITION:
      return r'FIELD_DEFINITION';
    case Enum$__DirectiveLocation.ARGUMENT_DEFINITION:
      return r'ARGUMENT_DEFINITION';
    case Enum$__DirectiveLocation.INTERFACE:
      return r'INTERFACE';
    case Enum$__DirectiveLocation.UNION:
      return r'UNION';
    case Enum$__DirectiveLocation.ENUM:
      return r'ENUM';
    case Enum$__DirectiveLocation.ENUM_VALUE:
      return r'ENUM_VALUE';
    case Enum$__DirectiveLocation.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION:
      return r'INPUT_FIELD_DEFINITION';
    case Enum$__DirectiveLocation.$unknown:
      return r'$unknown';
  }
}

Enum$__DirectiveLocation fromJson$Enum$__DirectiveLocation(String value) {
  switch (value) {
    case r'QUERY':
      return Enum$__DirectiveLocation.QUERY;
    case r'MUTATION':
      return Enum$__DirectiveLocation.MUTATION;
    case r'SUBSCRIPTION':
      return Enum$__DirectiveLocation.SUBSCRIPTION;
    case r'FIELD':
      return Enum$__DirectiveLocation.FIELD;
    case r'FRAGMENT_DEFINITION':
      return Enum$__DirectiveLocation.FRAGMENT_DEFINITION;
    case r'FRAGMENT_SPREAD':
      return Enum$__DirectiveLocation.FRAGMENT_SPREAD;
    case r'INLINE_FRAGMENT':
      return Enum$__DirectiveLocation.INLINE_FRAGMENT;
    case r'VARIABLE_DEFINITION':
      return Enum$__DirectiveLocation.VARIABLE_DEFINITION;
    case r'SCHEMA':
      return Enum$__DirectiveLocation.SCHEMA;
    case r'SCALAR':
      return Enum$__DirectiveLocation.SCALAR;
    case r'OBJECT':
      return Enum$__DirectiveLocation.OBJECT;
    case r'FIELD_DEFINITION':
      return Enum$__DirectiveLocation.FIELD_DEFINITION;
    case r'ARGUMENT_DEFINITION':
      return Enum$__DirectiveLocation.ARGUMENT_DEFINITION;
    case r'INTERFACE':
      return Enum$__DirectiveLocation.INTERFACE;
    case r'UNION':
      return Enum$__DirectiveLocation.UNION;
    case r'ENUM':
      return Enum$__DirectiveLocation.ENUM;
    case r'ENUM_VALUE':
      return Enum$__DirectiveLocation.ENUM_VALUE;
    case r'INPUT_OBJECT':
      return Enum$__DirectiveLocation.INPUT_OBJECT;
    case r'INPUT_FIELD_DEFINITION':
      return Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION;
    default:
      return Enum$__DirectiveLocation.$unknown;
  }
}

const possibleTypesMap = <String, Set<String>>{
  'Node': {
    'User',
    'AuthMethod',
    'AdminRole',
    'Admin',
    'SupportedLanguage',
    'SupportedLocale',
    'Journey',
    'Stage',
    'StagePart',
    'Material',
    'UserAnswer',
    'ConversationTurn',
    'AIFeedback',
    'UserDoc',
    'UserDocTemplate',
    'ModelSet',
  },
  'Connection': {
    'UserConnection',
    'AuthMethodConnection',
    'AdminConnection',
    'SupportedLanguageConnection',
    'SupportedLocaleConnection',
    'JourneyConnection',
    'StageConnection',
    'StagePartConnection',
    'MaterialConnection',
    'UserAnswerConnection',
    'ConversationTurnConnection',
    'AIFeedbackConnection',
    'UserDocConnection',
    'ModelSetConnection',
  },
  'MaterialDetails': {
    'StoryDetails',
    'QuizDetails',
    'ConversationDetails',
  },
};
