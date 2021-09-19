import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:vibration/vibration.dart';

class TimerFulScreen extends StatefulWidget {
  const TimerFulScreen({Key? key}) : super(key: key);

  @override
  _TimerFulScreenState createState() => _TimerFulScreenState();
}

class _TimerFulScreenState extends State<TimerFulScreen> {
  final CountdownController _controller = CountdownController(autoStart: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // Start
                  ElevatedButton(
                    child: const Text('Start'),
                    onPressed: () {
                      _controller.start();
                    },
                  ),
                  // Pause
                  ElevatedButton(
                    child: const Text('Pause'),
                    onPressed: () {
                      _controller.pause();
                    },
                  ),
                  // Resume
                  ElevatedButton(
                    child: const Text('Resume'),
                    onPressed: () {
                      _controller.resume();
                    },
                  ),
                  // Stop
                  ElevatedButton(
                    child: const Text('Restart'),
                    onPressed: () {
                      _controller.restart();
                    },
                  ),
                ],
              ),
            ),
            Countdown(
              controller: _controller,
              //秒数 => 後で渡してあげる。
              seconds: 5,
              build: (_, double time) => Text(
                time.toString(),
                style: const TextStyle(
                  fontSize: 100,
                ),
              ),
              //区間
              interval: const Duration(milliseconds: 100),
              //終わったらバイブレーションを鳴らす。
              onFinished: () {
                Vibration.vibrate(pattern: [500, 1000, 500, 2000]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
