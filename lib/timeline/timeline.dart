// import 'package:flutter/material.dart';
// import 'package:timeline_tile/timeline_tile.dart';

// class MyTimeLineTile extends StatelessWidget {
//   const TimeLine({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [TimelineTile(),TimelineTile(),TimelineTile(),TimelineTile(),],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:packages_demo/timeline/timelineTile.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimeLine extends StatelessWidget {
  const TimeLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // TimeLine()
          TimelineTile(
            isFirst: true,
          ),
          TimelineTile(),
          TimelineTile(),
          MyTimeLineTile(isFirst: false, isLast: false, isPast: true),
          MyTimeLineTile(isFirst: false, isLast: false, isPast: true),
          MyTimeLineTile(isFirst: false, isLast: true, isPast: false),
        ],
      ),
    );
  }
}
