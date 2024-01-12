import 'package:flutter/material.dart';
import 'package:packages_demo/timeline/timelineTile.dart';

class TimeLine extends StatelessWidget {
  const TimeLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: const [
            MyTimeLineTile(
              isFirst: true,
              isLast: false,
              isComplete: true,
              child: 'ORDER PLACED',
            ),
            MyTimeLineTile(
              isFirst: false,
              isLast: false,
              isComplete: false,
              child: 'ORDER RECEIVED',
            ),
            MyTimeLineTile(
              isFirst: false,
              isLast: true,
              isComplete: false,
              child: 'ORDER RECEIVED',
            ),
          ],
        ),
      ),
    );
  }
}
