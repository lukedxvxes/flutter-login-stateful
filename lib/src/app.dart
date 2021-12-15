import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _counter = 1;

  Future _increment() async {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Login form - stateful'),
        ),
        body: const LoginScreen(),
      ),
    );
  }
}
