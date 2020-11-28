import 'package:any_tab/any_tab.dart';
import 'package:example/const/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fragments/flutter_fragments.dart';
import '../model/index.dart';
import '../widgets/index.dart';

class FragmentsAnyTabPage extends StatefulWidget {
  static const String rName = 'FragmentsClipperTab';

  @override
  _FragmentsAnyTabPageState createState() =>
      _FragmentsAnyTabPageState();
}

class _FragmentsAnyTabPageState extends State<FragmentsAnyTabPage>
    with SingleTickerProviderStateMixin {
  AnyTabController anyTabController;
  ScreenshotController screenShotController = ScreenshotController();

  @override
  void initState() {
    super.initState();
    anyTabController = AnyTabController(vsync: this, length: 3);
    anyTabController.addStatusListener((status) {
      if (status == SlideStatus.dragStart) {
        screenShotController.generateImage(null);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnyTab(
        anyTabController: anyTabController,
        anyTabDelegate: FragmentsAnyTabDelegate(
          screenshotController: screenShotController,
          tabs: [
            for (AnyTabModel model in pages)
              AnyTabItem(
                model: model,
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    screenShotController.dispose();
    super.dispose();
  }
}
