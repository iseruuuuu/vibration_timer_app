import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibration_timer/conponent/timer_card.dart';
import 'home_screen_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<HomeScreenController, HomeScreenState>(
      create: (context) => HomeScreenController(
        context: context,
      ),
      builder: (context, _) {

        final timer1 = context.select<HomeScreenState, int>((state) => state.timer1);
        final title1 = context.select<HomeScreenState, String>((state) => state.title1);
        final title2 = context.select<HomeScreenState, String>((state) => state.timer2);
        return Scaffold(
          appBar: AppBar(
            elevation: 1,
            backgroundColor: Colors.white,
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TimerCard(
                  onTap: () => context.read<HomeScreenController>().startTimer(),
                  buttonText: '$timer1',
                  timerText: title1,
                ),
                TimerCard(
                  onTap: () => context.read<HomeScreenController>().startTimeout(),
                  buttonText: title2,
                  timerText: title1,
                ),

                TimerCard(
                  onTap: () => context.read<HomeScreenController>().onStart(),
                  buttonText: '01:30',
                  timerText: '開始',
                ),

                TimerCard(
                  onTap: () => context.read<HomeScreenController>().onStart(),
                  buttonText: '02:00',
                  timerText: '開始',
                ),

                TimerCard(
                  onTap: () => context.read<HomeScreenController>().onStart(),
                  buttonText: '02:30',
                  timerText: '開始',
                ),

                TimerCard(
                  onTap: () => context.read<HomeScreenController>().onStart(),
                  buttonText: '03:00',
                  timerText: '開始',
                ),

                TimerCard(
                  onTap: () => context.read<HomeScreenController>().onStart(),
                  buttonText: '03:30',
                  timerText: '開始',
                ),

                TimerCard(
                  onTap: () => context.read<HomeScreenController>().onStart(),
                  buttonText: '03:30',
                  timerText: '開始',
                ),

                TimerCard(
                  onTap: () => context.read<HomeScreenController>().onStart(),
                  buttonText: '03:30',
                  timerText: '開始',
                ),

                TimerCard(
                  onTap: () => context.read<HomeScreenController>().onStart(),
                  buttonText: '03:30',
                  timerText: '開始',
                ),

                TimerCard(
                  onTap: () => context.read<HomeScreenController>().onStart(),
                  buttonText: '03:30',
                  timerText: '開始',
                ),

                TimerCard(
                  onTap: () => context.read<HomeScreenController>().onStart(),
                  buttonText: '03:30',
                  timerText: '開始',
                ),




                TextButton(
                    onPressed: () => context.read<HomeScreenController>().onStart(),
                    child: const Text('開始')
                ),

                TextButton(
                    onPressed: () => context.read<HomeScreenController>().onStop(),
                    child: const Text('開始')
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}