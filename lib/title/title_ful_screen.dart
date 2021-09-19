import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:vibration_timer/conponent/button.dart';
import 'package:vibration/vibration.dart';

class TitleFulScreen extends StatefulWidget {
  const TitleFulScreen({Key? key}) : super(key: key);

  @override
  _TitleFulScreenState createState() => _TitleFulScreenState();
}

class _TitleFulScreenState extends State<TitleFulScreen> {
  var time = '';
  var time2 = '';
  Duration initialTimer = const Duration();
  final CountdownController _controller = CountdownController(autoStart: true);

  bool isStart = false;
  bool isPause = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          isStart
              ? SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  child: Countdown(
                    controller: _controller,
                    //秒数 => 後で渡してあげる。
                    seconds: 5,
                    build: (_, double time) => Center(
                      child: Text(
                        time.toString(),
                        style: const TextStyle(
                          fontSize: 100,
                        ),
                      ),
                    ),
                    //区間
                    interval: const Duration(milliseconds: 100),
                    onFinished: () {
                      setState(() {
                        isStart = false;
                        isPause = false;
                      });
                      //終わったらバイブレーションを鳴らす。
                      Vibration.vibrate(pattern: [500, 1000, 500, 2000]);
                    },
                  ),
                )
              : SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  child: CupertinoTimerPicker(
                    mode: CupertinoTimerPickerMode.hms,
                    minuteInterval: 1,
                    secondInterval: 1,
                    initialTimerDuration: initialTimer,
                    onTimerDurationChanged: (Duration value) {
                      setState(() {
                        initialTimer = value;
                        time2 = value.toString();
                      });
                    },
                  ),
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonWidget(
                title: 'キャンセル',
                onTap: () {
                  setState(() {
                    //強制的にタイマーを終わらせる。
                    isStart = isPause = false;
                    _controller.pause();
                  });
                },
              ),
              ButtonWidget(
                // title: isStart ? '一時停止' : '開始',
                title: isPause ? '一時停止' : '開始',
                onTap: () {
                  setState(() {
                    isPause = !isPause;
                    if (isStart) {
                      _controller.pause();
                    } else {
                      isStart = !isStart;
                    }
                    if (isPause) {
                      _controller.start();
                    } else {
                      _controller.pause();
                    }
                  });
                },
              ),
            ],
          ),
          Text(time2 + '下'),
        ],
      ),
    );
  }
}
