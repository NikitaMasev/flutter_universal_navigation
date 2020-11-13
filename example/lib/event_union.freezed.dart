// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'event_union.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$EventUnionTearOff {
  const _$EventUnionTearOff();

// ignore: unused_element
  Empty call() {
    return const Empty();
  }

// ignore: unused_element
  Login login({String data}) {
    return Login(
      data: data,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $EventUnion = _$EventUnionTearOff();

/// @nodoc
mixin _$EventUnion {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result login(String data),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result login(String data),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(Empty value), {
    @required Result login(Login value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(Empty value), {
    Result login(Login value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $EventUnionCopyWith<$Res> {
  factory $EventUnionCopyWith(
          EventUnion value, $Res Function(EventUnion) then) =
      _$EventUnionCopyWithImpl<$Res>;
}

/// @nodoc
class _$EventUnionCopyWithImpl<$Res> implements $EventUnionCopyWith<$Res> {
  _$EventUnionCopyWithImpl(this._value, this._then);

  final EventUnion _value;
  // ignore: unused_field
  final $Res Function(EventUnion) _then;
}

/// @nodoc
abstract class $EmptyCopyWith<$Res> {
  factory $EmptyCopyWith(Empty value, $Res Function(Empty) then) =
      _$EmptyCopyWithImpl<$Res>;
}

/// @nodoc
class _$EmptyCopyWithImpl<$Res> extends _$EventUnionCopyWithImpl<$Res>
    implements $EmptyCopyWith<$Res> {
  _$EmptyCopyWithImpl(Empty _value, $Res Function(Empty) _then)
      : super(_value, (v) => _then(v as Empty));

  @override
  Empty get _value => super._value as Empty;
}

/// @nodoc
class _$Empty with DiagnosticableTreeMixin implements Empty {
  const _$Empty();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EventUnion()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'EventUnion'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Empty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result login(String data),
  }) {
    assert($default != null);
    assert(login != null);
    return $default();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result login(String data),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(Empty value), {
    @required Result login(Login value),
  }) {
    assert($default != null);
    assert(login != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(Empty value), {
    Result login(Login value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class Empty implements EventUnion {
  const factory Empty() = _$Empty;
}

/// @nodoc
abstract class $LoginCopyWith<$Res> {
  factory $LoginCopyWith(Login value, $Res Function(Login) then) =
      _$LoginCopyWithImpl<$Res>;
  $Res call({String data});
}

/// @nodoc
class _$LoginCopyWithImpl<$Res> extends _$EventUnionCopyWithImpl<$Res>
    implements $LoginCopyWith<$Res> {
  _$LoginCopyWithImpl(Login _value, $Res Function(Login) _then)
      : super(_value, (v) => _then(v as Login));

  @override
  Login get _value => super._value as Login;

  @override
  $Res call({
    Object data = freezed,
  }) {
    return _then(Login(
      data: data == freezed ? _value.data : data as String,
    ));
  }
}

/// @nodoc
class _$Login with DiagnosticableTreeMixin implements Login {
  const _$Login({this.data});

  @override
  final String data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EventUnion.login(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EventUnion.login'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Login &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @override
  $LoginCopyWith<Login> get copyWith =>
      _$LoginCopyWithImpl<Login>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result login(String data),
  }) {
    assert($default != null);
    assert(login != null);
    return login(data);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result login(String data),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (login != null) {
      return login(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(Empty value), {
    @required Result login(Login value),
  }) {
    assert($default != null);
    assert(login != null);
    return login(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(Empty value), {
    Result login(Login value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class Login implements EventUnion {
  const factory Login({String data}) = _$Login;

  String get data;
  $LoginCopyWith<Login> get copyWith;
}
