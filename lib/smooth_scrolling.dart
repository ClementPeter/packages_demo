import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

//A DOT INDICATOR PACKAGE
class ScrollingIndicatorPage extends StatelessWidget {
  ScrollingIndicatorPage({super.key});

  final controller = PageController(keepPage: true);

  final pages = List.generate(
    6,
    (index) => Container(
      height: 200,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Center(
        child: Text(
          "Page $index",
          style: TextStyle(color: Colors.indigo, fontSize: 22),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              SizedBox(
                height: 240,
                child: PageView.builder(
                  controller: controller,
                  itemCount: pages.length,
                  itemBuilder: (context, index) {
                    return pages[index];
                  },
                ),
              ),
              const SizedBox(height: 10),
              //key feature
              SmoothPageIndicator(
                controller: controller,
                count: pages.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
