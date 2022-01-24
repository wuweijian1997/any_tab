import 'package:any_tab/any_tab.dart';
import 'package:flutter/material.dart';

class SizeAnyTabDelegate extends AnyTabDelegate {
  SizeAnyTabDelegate({required List<Widget> tabs}) : super(tabs: tabs);

  @override
  Widget build(
    BuildContext context,
    int activeIndex,
    int nextPageIndex,
    Animation animation,
    Offset startingOffset,
    bool isNextPage,
  ) {
    return Stack(
      children: [
        tabs[activeIndex],
        SlideTransition(
          position: animation.drive(Tween<Offset>(
            begin: Offset(isNextPage == true ? 1 : -1, 0),
            end: Offset.zero,
          )),
          child: tabs[nextPageIndex],
        )
      ],
    );
  }
}
