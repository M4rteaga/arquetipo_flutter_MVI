import 'package:flutter/material.dart';

import '../../../bloc/counter_bloc.dart';
import '../../../models/counter/counter_states.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CounterPartialState>(
        stream: counterBloc.counterController.stream,
        builder: (context, AsyncSnapshot<CounterPartialState> snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(snapshot.data.runtimeType == CounterCalculating
                    ? (snapshot.data as CounterCalculating).msg
                    : ''),
                snapshot.data.runtimeType == CounterCalculated
                    ? Text(
                        '${(snapshot.data as CounterCalculated).counter.number}',
                        style: Theme.of(context).textTheme.headline4,
                      )
                    : const Text('...'),
              ],
            );
          } else {
            return const Text('no data yet');
          }
        });
  }
}
