import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// DEMO SHARED PREFERENCE - PERSONAL

class SharedPreference1 extends StatefulWidget {
  const SharedPreference1({super.key, required this.title});

  final String title;

  @override
  State<SharedPreference1> createState() => _SharedPreference1State();
}

class _SharedPreference1State extends State<SharedPreference1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readCounter();
  }

  int _counter = 0;
  int _oldValue = 0;

  //Read Saved counter Value from shared preference
  void readCounter() async {
    final preference = await SharedPreferences.getInstance();

    setState(() {
      _oldValue = preference.getInt("counterKey") ?? 0;
      //  _counter = preference.getInt("counterKey")!;
    });
  }

  //Increment counter and save value to shared preference
  void _incrementCounter() async {
    final preference = await SharedPreferences
        .getInstance(); //Create Shared Preference Instance

    setState(() {
      _counter++;
      preference.setInt("counterKey", _counter);
    });
    //readCounter();
  }

  //Decrement counter and save value to shared preference
  void _decrementCounter() async {
    final preference = await SharedPreferences
        .getInstance(); //Create Shared Preference Instance

    setState(() {
      _counter--;
      preference.setInt("counterKey", _counter);
    });
  }

  //Remove counter and save value to shared preference
  void _removeCounter() async {
    final preference = await SharedPreferences
        .getInstance(); //Create Shared Preference Instance

    setState(() {
      preference.remove("counterKey");
      preference.clear();
    });

    readCounter(); //Read value to update since the value has been cleared
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              const SizedBox(height: 20),
              Text(
                'Current counter value : $_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'Old value stored in Shared Preference : $_oldValue',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
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
          FloatingActionButton(
            onPressed: _removeCounter,
            tooltip: 'delete',
            child: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
