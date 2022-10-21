import 'package:counter_mvi/bloc/counter_bloc.dart';
import 'package:counter_mvi/bloc/intents.dart';
import 'package:flutter/material.dart';

class CounterButtonWidget extends StatelessWidget {
  final CounterIntent counterIntent;
  final String label;
  final IconData icon;

  const CounterButtonWidget(
      {super.key,
      required this.counterIntent,
      required this.icon,
      this.label = ''});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: (() => counterBloc.interactWithIntent(counterIntent)),
        icon: Icon(icon),
        label: Text(label));
  }
}
