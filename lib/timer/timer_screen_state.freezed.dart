// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'timer_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TimerScreenStateTearOff {
  const _$TimerScreenStateTearOff();

  _TimerScreenState call(
      {int timer1 = 30, String timer2 = '00:10', String title1 = '開始'}) {
    return _TimerScreenState(
      timer1: timer1,
      timer2: timer2,
      title1: title1,
    );
  }
}

/// @nodoc
const $TimerScreenState = _$TimerScreenStateTearOff();

/// @nodoc
mixin _$TimerScreenState {
  int get timer1 => throw _privateConstructorUsedError;
  String get timer2 => throw _privateConstructorUsedError;
  String get title1 => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimerScreenStateCopyWith<TimerScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerScreenStateCopyWith<$Res> {
  factory $TimerScreenStateCopyWith(
          TimerScreenState value, $Res Function(TimerScreenState) then) =
      _$TimerScreenStateCopyWithImpl<$Res>;
  $Res call({int timer1, String timer2, String title1});
}

/// @nodoc
class _$TimerScreenStateCopyWithImpl<$Res>
    implements $TimerScreenStateCopyWith<$Res> {
  _$TimerScreenStateCopyWithImpl(this._value, this._then);

  final TimerScreenState _value;
  // ignore: unused_field
  final $Res Function(TimerScreenState) _then;

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
abstract class _$TimerScreenStateCopyWith<$Res>
    implements $TimerScreenStateCopyWith<$Res> {
  factory _$TimerScreenStateCopyWith(
          _TimerScreenState value, $Res Function(_TimerScreenState) then) =
      __$TimerScreenStateCopyWithImpl<$Res>;
  @override
  $Res call({int timer1, String timer2, String title1});
}

/// @nodoc
class __$TimerScreenStateCopyWithImpl<$Res>
    extends _$TimerScreenStateCopyWithImpl<$Res>
    implements _$TimerScreenStateCopyWith<$Res> {
  __$TimerScreenStateCopyWithImpl(
      _TimerScreenState _value, $Res Function(_TimerScreenState) _then)
      : super(_value, (v) => _then(v as _TimerScreenState));

  @override
  _TimerScreenState get _value => super._value as _TimerScreenState;

  @override
  $Res call({
    Object? timer1 = freezed,
    Object? timer2 = freezed,
    Object? title1 = freezed,
  }) {
    return _then(_TimerScreenState(
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

class _$_TimerScreenState implements _TimerScreenState {
  const _$_TimerScreenState(
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
    return 'TimerScreenState(timer1: $timer1, timer2: $timer2, title1: $title1)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TimerScreenState &&
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
  _$TimerScreenStateCopyWith<_TimerScreenState> get copyWith =>
      __$TimerScreenStateCopyWithImpl<_TimerScreenState>(this, _$identity);
}

abstract class _TimerScreenState implements TimerScreenState {
  const factory _TimerScreenState({int timer1, String timer2, String title1}) =
      _$_TimerScreenState;

  @override
  int get timer1 => throw _privateConstructorUsedError;
  @override
  String get timer2 => throw _privateConstructorUsedError;
  @override
  String get title1 => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TimerScreenStateCopyWith<_TimerScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
