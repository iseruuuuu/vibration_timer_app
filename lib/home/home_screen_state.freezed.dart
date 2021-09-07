// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomeScreenStateTearOff {
  const _$HomeScreenStateTearOff();

  _HomeScreenState call(
      {int timer1 = 30, String timer2 = '00:10', String title1 = '開始'}) {
    return _HomeScreenState(
      timer1: timer1,
      timer2: timer2,
      title1: title1,
    );
  }
}

/// @nodoc
const $HomeScreenState = _$HomeScreenStateTearOff();

/// @nodoc
mixin _$HomeScreenState {
  int get timer1 => throw _privateConstructorUsedError;
  String get timer2 => throw _privateConstructorUsedError;
  String get title1 => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeScreenStateCopyWith<HomeScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeScreenStateCopyWith<$Res> {
  factory $HomeScreenStateCopyWith(
          HomeScreenState value, $Res Function(HomeScreenState) then) =
      _$HomeScreenStateCopyWithImpl<$Res>;
  $Res call({int timer1, String timer2, String title1});
}

/// @nodoc
class _$HomeScreenStateCopyWithImpl<$Res>
    implements $HomeScreenStateCopyWith<$Res> {
  _$HomeScreenStateCopyWithImpl(this._value, this._then);

  final HomeScreenState _value;
  // ignore: unused_field
  final $Res Function(HomeScreenState) _then;

  @override
  $Res call({
    Object? timer1 = freezed,
    Object? timer2 = freezed,
    Object? title1 = freezed,
  }) {
    return _then(_value.copyWith(
      timer1: timer1 == freezed
          ? _value.timer1
          : timer1 // ignore: cast_nullable_to_non_nullable
              as int,
      timer2: timer2 == freezed
          ? _value.timer2
          : timer2 // ignore: cast_nullable_to_non_nullable
              as String,
      title1: title1 == freezed
          ? _value.title1
          : title1 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$HomeScreenStateCopyWith<$Res>
    implements $HomeScreenStateCopyWith<$Res> {
  factory _$HomeScreenStateCopyWith(
          _HomeScreenState value, $Res Function(_HomeScreenState) then) =
      __$HomeScreenStateCopyWithImpl<$Res>;
  @override
  $Res call({int timer1, String timer2, String title1});
}

/// @nodoc
class __$HomeScreenStateCopyWithImpl<$Res>
    extends _$HomeScreenStateCopyWithImpl<$Res>
    implements _$HomeScreenStateCopyWith<$Res> {
  __$HomeScreenStateCopyWithImpl(
      _HomeScreenState _value, $Res Function(_HomeScreenState) _then)
      : super(_value, (v) => _then(v as _HomeScreenState));

  @override
  _HomeScreenState get _value => super._value as _HomeScreenState;

  @override
  $Res call({
    Object? timer1 = freezed,
    Object? timer2 = freezed,
    Object? title1 = freezed,
  }) {
    return _then(_HomeScreenState(
      timer1: timer1 == freezed
          ? _value.timer1
          : timer1 // ignore: cast_nullable_to_non_nullable
              as int,
      timer2: timer2 == freezed
          ? _value.timer2
          : timer2 // ignore: cast_nullable_to_non_nullable
              as String,
      title1: title1 == freezed
          ? _value.title1
          : title1 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_HomeScreenState implements _HomeScreenState {
  const _$_HomeScreenState(
      {this.timer1 = 30, this.timer2 = '00:10', this.title1 = '開始'});

  @JsonKey(defaultValue: 30)
  @override
  final int timer1;
  @JsonKey(defaultValue: '00:10')
  @override
  final String timer2;
  @JsonKey(defaultValue: '開始')
  @override
  final String title1;

  @override
  String toString() {
    return 'HomeScreenState(timer1: $timer1, timer2: $timer2, title1: $title1)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HomeScreenState &&
            (identical(other.timer1, timer1) ||
                const DeepCollectionEquality().equals(other.timer1, timer1)) &&
            (identical(other.timer2, timer2) ||
                const DeepCollectionEquality().equals(other.timer2, timer2)) &&
            (identical(other.title1, title1) ||
                const DeepCollectionEquality().equals(other.title1, title1)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(timer1) ^
      const DeepCollectionEquality().hash(timer2) ^
      const DeepCollectionEquality().hash(title1);

  @JsonKey(ignore: true)
  @override
  _$HomeScreenStateCopyWith<_HomeScreenState> get copyWith =>
      __$HomeScreenStateCopyWithImpl<_HomeScreenState>(this, _$identity);
}

abstract class _HomeScreenState implements HomeScreenState {
  const factory _HomeScreenState({int timer1, String timer2, String title1}) =
      _$_HomeScreenState;

  @override
  int get timer1 => throw _privateConstructorUsedError;
  @override
  String get timer2 => throw _privateConstructorUsedError;
  @override
  String get title1 => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$HomeScreenStateCopyWith<_HomeScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
