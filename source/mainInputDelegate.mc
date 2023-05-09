using Toybox.System;
using Toybox.WatchUi;

class MainInputDelegate extends WatchUi.InputDelegate {
  var controller;

  function initialize() {
    BehaviorDelegate.initialize();
    controller = Application.getApp().controller;
    InputDelegate.initialize();
  }

  function onKey(keyEvent) {
    if (keyEvent.getKey() == KEY_START || keyEvent.getKey() == KEY_ENTER) {
      controller.onStartStop();
    }
    return true;
  }
}
