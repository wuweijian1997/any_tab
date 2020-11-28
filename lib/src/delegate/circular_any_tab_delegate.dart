import 'package:any_tab/any_tab.dart';
import 'package:any_tab/src/clipper/index.dart';
import 'package:flutter/material.dart';

class CircularAnyTabDelegate extends AnyTabDelegate {
  CircularAnyTabDelegate({@required List<Widget> tabs})
      : assert(tabs != null && tabs.length > 0),
        super(tabs: tabs);

  @override
  Widget build(BuildContext context, int activeIndex, int nextPageIndex,
      Animation animation, Offset startingOffset) {
    assert(activeIndex >= 0 && activeIndex < tabs.length);
    assert(nextPageIndex >= 0 && nextPageIndex < tabs.length);
    return Stack(
      children: [
        tabs[activeIndex],
        ClipOval(
          clipper: CircularClipper(
            percentage: animation.value,
            offset: startingOffset,
          ),
          child: tabs[nextPageIndex],
        )
      ],
    );
  }
}
