# any_tab

Flutter any tab.

## Getting Started
### Install
```
dependencies:
  any_tab: ^0.0.1
```
### Use
> See example for details
```
AnyTabController anyTabController;

@override
void initState() {
  super.initState();
  anyTabController = AnyTabController(vsync: this, length: 3);
}

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
```
![circular.gif](https://github.com/wuweijian1997/any_tab/blob/main/example/circular.gif)
![fragments.gif](https://github.com/wuweijian1997/any_tab/blob/main/example/fragments.gif)
![size.gif](https://github.com/wuweijian1997/any_tab/blob/main/example/size.gif)