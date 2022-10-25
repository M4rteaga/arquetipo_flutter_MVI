import 'package:flutter/material.dart';
import 'package:mvi_architecture/intent/counter_intent.dart';
import 'package:mvi_architecture/model/counter_model.dart';
import 'package:mvi_architecture/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyInheretedWidge(
        homeModel: CounterModel(),
        homeIntent: HomeIntent(homeModel: CounterModel()),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomePage(
            homeModel: CounterModel(),
          ),
        ));
  }
}

class MyInheretedWidge extends InheritedWidget {
  const MyInheretedWidge(
      {Key? key,
      required Widget child,
      required this.homeModel,
      required this.homeIntent})
      : super(key: key, child: child);

  final CounterModel homeModel;
  final HomeIntent homeIntent;

  static MyInheretedWidge of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<MyInheretedWidge>()!;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
