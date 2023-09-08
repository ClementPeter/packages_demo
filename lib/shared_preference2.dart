//Destiny Ed Tutorial Saving and Reading Counter value from shared preference

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference2 extends StatefulWidget {
  const SharedPreference2({super.key, required this.title});

  final String title;

  @override
  State<SharedPreference2> createState() => _SharedPreference2State();
}

class _SharedPreference2State extends State<SharedPreference2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readCounter();
  }

  int _counter = 0;
  String? name;

  //Read Saved counter Value from shared preference
  void readCounter() async {
    final preference = await SharedPreferences.getInstance();

    setState(() {
      _counter = preference.getInt("counterKey")!;
      name = preference.getString("myName");
    });
  }

  //Increment counter and save value to shared preference
  void _incrementCounter() async {
    final preference = await SharedPreferences
        .getInstance(); //Create Shared Preference Instance

    setState(() {
      _counter++;
      preference.setInt("counterKey", _counter);
      preference.setString("myName", "Peter is my name");
      readCounter();
    });
  }

  //Decrement counter and save value to shared preference
  void _decrementCounter() async {
    final preference = await SharedPreferences
        .getInstance(); //Create Shared Preference Instance

    setState(() {
      _counter--;
      preference.setInt("counterKey", _counter);
      readCounter();
    });
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
          children: <Widget>[
            Text(
              'The name assigned is : $name',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'You have pushed the button this many times:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            Text(
              'counter value : $_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
