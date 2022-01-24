import 'package:any_tab/any_tab.dart';
import 'package:example/const/const.dart';
import 'package:flutter/material.dart';
import '../model/index.dart';
import '../widgets/index.dart';

class CircularAnyTabPage extends StatefulWidget {

  @override
  _CircularAnyTabPageState createState() => _CircularAnyTabPageState();
}

class _CircularAnyTabPageState extends State<CircularAnyTabPage>
    with SingleTickerProviderStateMixin {
  late AnyTabController anyTabController;

  @override
  void initState() {
    anyTabController = AnyTabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        AnyTab(
          anyTabController: anyTabController,
          anyTabDelegate: CircularAnyTabDelegate(
            tabs: [
              for (AnyTabModel model in pages)
                AnyTabItem(
                  model: model,
                ),
            ],
          ),
        ),
        Positioned(
          right: 30,
          bottom: 50,
          child: Column(
            children: [
              GestureDetector(
                child: Icon(Icons.navigate_next),
                onTap: () {
                  anyTabController.toNextPage();
                },
              ),
              GestureDetector(
                child: Icon(Icons.navigate_before),
                onTap: () {
                  anyTabController.toPreviousPage();
                },
              ),
            ],
          ),
        )
      ],
    ));
  }
}
