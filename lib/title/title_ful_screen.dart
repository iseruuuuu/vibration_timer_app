import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:vibration_timer/conponent/button.dart';
import 'package:vibration/vibration.dart';
import 'package:vibration_timer/conponent/timer_label.dart';

class TitleFulScreen extends StatefulWidget {
  const TitleFulScreen({Key? key}) : super(key: key);

  @override
  _TitleFulScreenState createState() => _TitleFulScreenState();
}

class _TitleFulScreenState extends State<TitleFulScreen> {
  Duration initialTimer = const Duration();
  final CountdownController _controller = CountdownController(autoStart: true);
  bool isStart = false;
  bool isPause = false;
  int setTime = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          isStart
              ? SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  child: Countdown(
                    controller: _controller,
                    //秒数 => 後で渡してあげる。
                    seconds: setTime,
                    build: (_, double time) => TimerLabel(
                      title: time.toString(),
                    ),
                    //区間
                    interval: const Duration(milliseconds: 100),
                    onFinished: () {
                      setState(() {
                        isStart = isPause = false;
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
                        //TODO 時間を全部秒に直してあげる
                        int i3 = value.inSeconds;
                        //print(i3);//62
                        //TODO 時間を渡してあげる
                        setTime = i3;
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
                  if(setTime == 0) {
                    //何もしない。
                  }else{
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
                  }
                },
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
