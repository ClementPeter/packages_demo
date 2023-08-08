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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            // TimeLine()
            // TimelineTile(
            //   isFirst: true,
            // ),
            // TimelineTile(),
            // TimelineTile(),
            MyTimeLineTile(
                isFirst: true,
                isLast: false,
                isComplete: true,
                child: 'ORDER PLACED'),
            MyTimeLineTile(
                isFirst: false,
                isLast: false,
                isComplete: true,
                child: 'ORDER RECEIVED'),
            MyTimeLineTile(
                isFirst: false,
                isLast: true,
                isComplete: false,
                child: 'ORDER RECEIVED'),
          ],
        ),
      ),
    );
  }
}
