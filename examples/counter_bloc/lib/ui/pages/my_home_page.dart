import 'package:counter_mvi/bloc/counter_bloc.dart';
import 'package:counter_mvi/models/counter/counter_states.dart';
import 'package:counter_mvi/bloc/intents.dart';
import 'package:counter_mvi/ui/widgets/counter/counter_button_widget.dart';
import 'package:counter_mvi/ui/widgets/counter/counter_widget.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    counterBloc.changeState(CounterCalculated(counter: counterBloc.counter));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CounterWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CounterButtonWidget(
                  counterIntent: CounterDecreseIntent(), icon: Icons.remove),
              CounterButtonWidget(
                  counterIntent: CounterSumIntent(), icon: Icons.add),
            ],
          ),
        ],
      )),
    );
  }
}
