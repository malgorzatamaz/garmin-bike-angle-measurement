import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Sensor;

class App extends Application.AppBase {
  var model;
  var controller;

  function initialize() {
    AppBase.initialize();
    // model = new $.NamasteModel();
    controller = new Controller();
  }

  // onStart() is called on application start up
  function onStart(state as Dictionary?) as Void {}

  // onStop() is called when your application is exiting
  function onStop(state as Dictionary?) as Void {}

  // Return the initial view of your application here
  function getInitialView() as Array<Views or InputDelegates>? {
    return (
      [new mainView(), new MainInputDelegate()] as
      Array<Views or InputDelegates>
    );
  }
}

function getApp() as App {
  return Application.getApp() as App;
}
