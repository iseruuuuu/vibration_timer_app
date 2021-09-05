import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        return GestureDetector(
          onTap: () => context.read<HomeScreenController>().initState(),
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
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

