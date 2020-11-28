import 'package:any_tab/any_tab.dart';
import 'package:example/const/const.dart';
import 'package:example/model/index.dart';
import 'package:flutter/material.dart';
import '../widgets/index.dart';

class SizeAnyTabPage extends StatefulWidget {
  static const String rName = 'SizeClipperTab';

  @override
  _SizeAnyTabPageState createState() => _SizeAnyTabPageState();
}

class _SizeAnyTabPageState extends State<SizeAnyTabPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        AnyTab(
          anyTabDelegate: SizeAnyTabDelegate(
            tabs: [
              for (AnyTabModel model in pages)
                AnyTabItem(
                  model: model,
                ),
            ],
          ),
        ),
      ],
    ));
  }
}
