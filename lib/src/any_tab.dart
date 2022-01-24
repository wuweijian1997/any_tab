import 'package:any_tab/any_tab.dart';
import 'package:flutter/material.dart';

class AnyTab extends StatefulWidget {
  final AnyTabController? anyTabController;
  final AnyTabDelegate anyTabDelegate;

  AnyTab({
    Key? key,
    this.anyTabController,
    required this.anyTabDelegate,
  }) : super(key: key);

  @override
  _AnyTabState createState() => _AnyTabState();
}

class _AnyTabState extends State<AnyTab>
    with SingleTickerProviderStateMixin {
  AnyTabDelegate get anyTabDelegate => widget.anyTabDelegate;

  late AnyTabController _anyTabController;

  @override
  void initState() {
    _anyTabController = widget.anyTabController ??
        AnyTabController(length: anyTabDelegate.length, vsync: this);
    _anyTabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnyTabDrag(
      anyTabController: _anyTabController,
      child: anyTabDelegate.build(
        context,
        _anyTabController.index,
        _anyTabController.nextPageIndex,
        _anyTabController.animation,
        _anyTabController.dragStartOffset,
        _anyTabController.isNextPage,
      ),
    );
  }

  @override
  void dispose() {
    _anyTabController.dispose();
    super.dispose();
  }
}
