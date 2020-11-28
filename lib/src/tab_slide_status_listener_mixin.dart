import 'package:any_tab/any_tab.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef TabSlideStatusListener = void Function(SlideStatus status);

mixin TabSlideStatusListenerMixin {
  final ObserverList<TabSlideStatusListener> _statusListeners = ObserverList<TabSlideStatusListener>();

  /*void didRegisterListener();

  void didUnregisterListener();*/

  void addStatusListener(TabSlideStatusListener listener) {
    // didRegisterListener();
    _statusListeners.add(listener);
  }

  void removeStatusListener(TabSlideStatusListener listener) {
    final bool removed = _statusListeners.remove(listener);
    if (removed) {
      // didUnregisterListener();
    }
  }

  void notifyStatusListeners(SlideStatus status) {
    final List<TabSlideStatusListener> localListeners = List<TabSlideStatusListener>.from(_statusListeners);
    for (final TabSlideStatusListener listener in localListeners) {
      try {
        if (_statusListeners.contains(listener))
          listener(status);
      } catch (exception, stack) {
        InformationCollector collector;
        FlutterError.reportError(FlutterErrorDetails(
            exception: exception,
            stack: stack,
            library: 'animation library',
            context: ErrorDescription('while notifying status listeners for $runtimeType'),
            informationCollector: collector
        ));
      }
    }
  }
}
