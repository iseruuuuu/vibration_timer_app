import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:vibration/vibration.dart';

part 'home_screen_state.freezed.dart';

@freezed
abstract class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState({
    @Default(30) int timer1,
    @Default('開始') String title1,
  }) = _HomeScreenState;
}

class HomeScreenController extends StateNotifier<HomeScreenState>
    with LocatorMixin {
  HomeScreenController({
    required this.context,
  }) : super(const HomeScreenState());

  final BuildContext context;

  int start30 = 30;
  int start60 = 60;

  int _start = 30;
  bool isStart = true;

  @override
  void initState() {
    super.initState();
  }

  void startTimer() {
    Timer _timer;
    const oneSec = Duration(seconds: 1);
    if (isStart) {
      _timer = Timer.periodic(
        oneSec,
            (Timer timer) {
          if (_start == 0) {
            timer.cancel();
            state = state.copyWith(
              title1: '開始',
              timer1: 30,
            );
          } else {
            _start--;
            isStart != isStart;
            state = state.copyWith(
              title1: '停止',
              timer1: _start,
            );
          };
        },
      );
    } else {
      _timer = Timer.periodic(
        oneSec,
            (Timer timer) {
          timer.cancel();
          isStart != isStart;
          state = state.copyWith(
            title1: '開始',
            timer1: 30,
          );
        },
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

// void onStart30 () {
  //   CountDownTimer countDownTimer = new CountDown
  //
  // }

  void onStart() {
    //TODO 一度バイブレーションを鳴る。
    Vibration.vibrate(pattern: [0, 10, 0, 2000]);
  }

  void onStop() {
    Vibration.cancel();
  }
}
