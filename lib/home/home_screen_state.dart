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
    @Default('00:10') String timer2,
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
  bool isStart = false;


  final interval = const Duration(seconds: 1);
  final int timerMaxSeconds = 10;
  int currentSeconds = 0;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';


  startTimeout() {

    //TODO 開始と一時停止の２種類があるといい。

    var duration = interval;
    Timer.periodic(duration, (timer) {
      currentSeconds = timer.tick;

      //TODO 時間になったら、バイブレーションを鳴らす。
      if (timer.tick > timerMaxSeconds) {
        timer.cancel();
        print("das");
        state = state.copyWith(
          title1: '開始zasa',
          timer2: '00:10',
        );
      }else{
        state = state.copyWith(
          title1: '停止',
          timer2: timerText,
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  void startTimer() {
    Timer _timer;
    const oneSec = Duration(seconds: 1);
    isStart = !isStart;
    if (isStart) {
      _timer = Timer.periodic(
        oneSec,
            (Timer timer) {
          if (_start == 0) {
            timer.cancel();
            state = state.copyWith(
              title1: '開始za',
              timer1: 30,
            );
          } else {
            _start--;
            isStart != isStart;
            state = state.copyWith(
              title1: '停止s',
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
            title1: '開始i',
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
    //TODO 強制的に止める方法が知りたい
  }

  void onStop() {
    Vibration.cancel();
  }
}
