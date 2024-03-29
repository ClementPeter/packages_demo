import 'package:flutter/material.dart';
import 'package:packages_demo/image_picker_single.dart';
import 'package:packages_demo/image_picker_multiple.dart';
import 'package:packages_demo/shared_preference1.dart';
import 'package:packages_demo/shared_preference2.dart';
import 'package:packages_demo/smooth_scrolling.dart';
import 'package:packages_demo/timeline/timeline.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScrollingIndicatorPage(),
                  ),
                );
              },
              child: const Text("Smooth Scrolling List"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TimeLine(),
                  ),
                );
              },
              child: const Text("Timeline"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SharedPreference1(
                      title: 'Shared pref1',
                    ),
                  ),
                );
              },
              //Shared pref. has multiple demo
              child: const Text("Shared preference 1"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SharedPreference2(
                      title: 'Shared pref 2',
                    ),
                  ),
                );
              },
              //Shared pref. has multiple demo
              child: const Text("Shared preference 2"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ImagePickerSingle(
                      title: 'Image Picker Gallery and Camera',
                    ),
                  ),
                );
              },
              //Image Picker has multiple demo
              child: const Text("Image picker"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ImagePickerMultiple(
                      title: 'Image Picker Multiple - Gallery',
                    ),
                  ),
                );
              },
              //Image Picker has multiple demo
              child: const Text("Multiple Image picker"),
            ),
          ],
        ),
      ),
    );
  }
}
