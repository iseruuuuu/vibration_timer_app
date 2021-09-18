import 'package:flutter/cupertino.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:vibration_timer/timer/timer_screen_state.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {

  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<TimerScreenController, TimerScreenState>(
      create: (context) => TimerScreenController(
        context: context,
      ),
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.grey[100],
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Countdown(
                  //秒数
                  seconds: 15,
                  build: (_, double time) => Text(
                    time.toString(),
                    style: const TextStyle(
                      fontSize: 50,
                    ),
                  ),
                  //区間
                  interval: const Duration(milliseconds: 100),
                  //終わったらバイブレーションを鳴らす。
                  onFinished: () => context.read<TimerScreenController>().finishTimer(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () => context.read<TimerScreenController>().startTimer(),
                      child: const Text('スタート'),
                    ),
                    TextButton(
                      onPressed: () => context.read<TimerScreenController>().pauseTimer(),
                      child: const Text('一時停止'),
                    ),
                    TextButton(
                      onPressed: () => context.read<TimerScreenController>().resumeTimer(),
                      child: const Text('再開'),
                    ),
                    TextButton(
                      onPressed: () => context.read<TimerScreenController>().stopTimer(),
                      child: const Text('停止'),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
