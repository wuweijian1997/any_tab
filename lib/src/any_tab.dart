import 'package:any_tab/any_tab.dart';
import 'package:flutter/material.dart';

class AnyTab extends StatefulWidget {
  final AnyTabController anyTabController;
  final AnyTabDelegate anyTabDelegate;

  AnyTab({
    Key key,
    this.anyTabController,
    this.anyTabDelegate,
  }) : super(key: key);

  @override
  _AnyTabState createState() => _AnyTabState();
}

class _AnyTabState extends State<AnyTab>
    with SingleTickerProviderStateMixin {
  AnyTabDelegate get anyTabDelegate => widget.anyTabDelegate;

  AnyTabController _anyTabController;

  AnyTabController get anyTabController => widget.anyTabController;

  @override
  void initState() {
    super.initState();
    _anyTabController = anyTabController ??
        AnyTabController(length: anyTabDelegate.length, vsync: this);
    _anyTabController.addListener(() {
      setState(() {});
    });
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
      ),
    );
  }

  @override
  void dispose() {
    _anyTabController?.dispose();
    super.dispose();
  }
}
