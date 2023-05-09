class Controller {
  const activity = new Activity();

  function onStartStop() {
    activity.onStartStop();
  }

  function isRunning() {
    return activity.isRunning();
  }

  function getData() {
    return activity.getData();
  }
}
