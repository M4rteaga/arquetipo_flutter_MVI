import 'package:flutter/material.dart';
import 'package:mvi_architecture/intent/counter_intent.dart';
import 'package:mvi_architecture/model/counter_model.dart';

////
///
///

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.homeModel}) : super(key: key);
  final CounterModel homeModel;

  @override
  Widget build(BuildContext context) {
    final intent = HomeIntent(homeModel: homeModel);
    intent.init();
    return Scaffold(
      appBar: AppBar(
        title: const Text('MVI Architecture'),
      ),
      body: StreamBuilder<StateCounter>(
          stream: intent.streamStatus,
          builder: (context, AsyncSnapshot<StateCounter> snapshot) {
            if (snapshot.hasData) {
              StateCounter? data = snapshot.data;
              if (data is DecrementingCounter) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      CircularProgressIndicator(),
                      Text('Se esta disminuyendo el contador')
                    ],
                  ),
                );
              } else if (data is IncrementingCounter) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      CircularProgressIndicator(),
                      Text('Se esta aumentando el contador')
                    ],
                  ),
                );
              }

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '${homeModel.getNumber}',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              intent.decrementNumber();
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              intent.incrementNumber();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
