import 'package:any_tab/any_tab.dart';
import 'package:flutter/material.dart';

class SizeAnyTabDelegate extends AnyTabDelegate {
  SizeAnyTabDelegate({List<Widget> tabs}) : super(tabs: tabs);

  @override
  Widget build(
    BuildContext context,
    int activeIndex,
    int nextPageIndex,
    Animation animation,
    Offset startingOffset,
  ) {
    return Stack(
      children: [
        tabs[activeIndex],
        SlideTransition(
          position: animation.drive(Tween<Offset>(
            begin: Offset(1, 1),
            end: Offset.zero,
          )),
          child: SizeTransition(
            sizeFactor: animation,
            child: tabs[nextPageIndex],
          ),
        )
      ],
    );
  }
}
