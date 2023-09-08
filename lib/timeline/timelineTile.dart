import 'package:flutter/material.dart';
import 'package:packages_demo/timeline/timeline_event.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MyTimeLineTile extends StatelessWidget {
  const MyTimeLineTile({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isComplete,
    required this.child,
  });

  final bool isFirst;
  final bool isLast;
  final String child;

  final bool isComplete; //check is the timeline is passed

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        endChild: EventCard(child: child),
        beforeLineStyle: LineStyle(
          color: isComplete ? Colors.deepPurple : Colors.deepPurple.shade100,
        ),
        indicatorStyle: IndicatorStyle(
          width: 40,
          color: isComplete ? Colors.deepPurple : Colors.purple.shade100,
          iconStyle: IconStyle(
            iconData: Icons.check,
            color: isComplete ? Colors.white : Colors.deepPurple.shade100,
          ),
        ),
      ),
    );
  }
}
