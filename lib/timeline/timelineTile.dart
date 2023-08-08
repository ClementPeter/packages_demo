import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MyTimeLineTile extends StatelessWidget {
  const MyTimeLineTile(
      {super.key,
      required this.isFirst,
      required this.isLast,
      required this.isPast});

  final bool isFirst;
  final bool isLast;

  final bool isPast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        //endChild: const Text('home'),
        //beforeLineStyle: ,
        beforeLineStyle: LineStyle(color: Colors.red),
        indicatorStyle: IndicatorStyle(
          color: Colors.deepPurple,
          indicator: Icon(Icons.check),
        ),
      ),
    );
  }
}
