import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:vibration/vibration.dart';

part 'home_screen_state.freezed.dart';

@freezed
abstract class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState({
    @Default('') String FaceBookID,
  }) = _HomeScreenState;
}

class HomeScreenController extends StateNotifier<HomeScreenState> with LocatorMixin {
  HomeScreenController({
    required this.context,
  }) : super (const HomeScreenState());

  final BuildContext context;

  int start30 = 30;
  int start60 = 60;

  @override
  void initState() {
    super.initState();
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