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
      if (timer.tick > timerMaxSeconds) {
        timer.cancel();
        state = state.copyWith(
          title1: '開始',
          timer2: '00：10',
        );

        //TODO バイブレーションを鳴らす。
        startVibration();

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

  void startVibration() async {
    //TODO バイブレーションを鳴らす。

    //ちょい振動
    // Vibration.vibrate();

    //時間をおく
    // await Future.delayed(const Duration(seconds: 2));

    //ちょい振動
    // Vibration.vibrate(amplitude: 128);

    // await Future.delayed(const Duration(seconds: 2));

    //ちょい振動
    // Vibration.vibrate(duration: 1000);

    // await Future.delayed(const Duration(seconds: 2));

    // Vibration.vibrate(duration: 1000, amplitude: 128);

    // await Future.delayed(const Duration(seconds: 2));

    //断続的に振動がある。
    Vibration.vibrate(pattern: [500, 1000, 500, 2000]);

    // await Future.delayed(const Duration(seconds: 2));

    // Vibration.vibrate(pattern: [500, 1000, 500, 2000], intensities: [1, 255]);



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
