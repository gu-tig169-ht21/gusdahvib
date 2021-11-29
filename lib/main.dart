import 'package:flutter/material.dart';
import 'package:my_first_app/state.dart';
import 'package:provider/provider.dart';
import 'main_view.dart';
import 'state.dart';
void main() {
  var state = MyState();
  state.getLista();
  runApp(
    ChangeNotifierProvider(create: (context) => state,
    child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),     
    );
  }
}