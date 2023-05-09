import Toybox.Graphics;
import Toybox.WatchUi;

class mainView extends WatchUi.View {
  var controller;
  var rollLabel;
  var activityStateLabel;
  var timer;

  function initialize() {
    View.initialize();
    controller = Application.getApp().controller;
    timer = new Timer.Timer();
  }

  // Load your resources here
  function onLayout(dc as Dc) as Void {
    setLayout(Rez.Layouts.MainLayout(dc));

    rollLabel = View.findDrawableById("Roll");
    activityStateLabel = View.findDrawableById("Activity");
  }

  // Update the view
  function onUpdate(dc as Dc) as Void {
    // Call the parent onUpdate function to redraw the layout
    View.onUpdate(dc);
    if (controller.isRunning()) {
      var data = controller.getData();
      rollLabel.setText(data ? data.toString() : "-");
      activityStateLabel.setText("Recording");
    } else {
      activityStateLabel.setText("Not recording");
    }
  }

  function onShow() {
    if (timer) {
      timer.start(method(:onTimer), 500, true);
    }
  }

  function onHide() {
    if (timer) {
      timer.stop();
    }
  }

  function onTimer() {
    WatchUi.requestUpdate();
  }
}
