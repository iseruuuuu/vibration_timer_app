// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:vibration/vibration.dart';

part 'timer_screen_state.freezed.dart';

@freezed
abstract class TimerScreenState with _$TimerScreenState {
  const factory TimerScreenState({
    @Default(30) int timer1,
    @Default('00:10') String timer2,
    @Default('開始') String title1,
  }) = _TimerScreenState;
}

class TimerScreenController extends StateNotifier<TimerScreenState>
    with LocatorMixin {
  TimerScreenController({
    required this.context,
  }) : super(const TimerScreenState());

  final BuildContext context;

  //コントローラーを定義
  final CountdownController _controller = CountdownController(autoStart: true);

  //タイマーをスタートする
  void startTimer() {
    _controller.start();
  }

  //タイマーを一時停止する
  void pauseTimer() {
    _controller.pause();
  }

  //タイマーを再スタートする
  void resumeTimer() {
    _controller.resume();
  }

  //タイマーを停止する。
  void stopTimer() {
    _controller.restart();
  }

  void finishTimer() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Timer is done!'),
      ),
    );
  }
}
