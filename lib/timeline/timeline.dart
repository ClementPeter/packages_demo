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

class TimeLine extends StatelessWidget {
  const TimeLine({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        MyTimeLineTile(isFirst: true, isLast: false, isPast: true),
        MyTimeLineTile(isFirst: true, isLast: false, isPast: true),
        MyTimeLineTile(isFirst: false, isLast: true, isPast: false),
      ],
    );
  }
}
