using Toybox.Sensor;
using Toybox.SensorLogging;
using Toybox.ActivityRecording;
using Toybox.Activity;
using Toybox.Math;
using Toybox.Lang;

class Activity {
  var activity;
  var data;
  var isRecording = false;
  // var dataTimer;

  // function initalize() {
  //   dataTimer = new Timer.Timer();
  // }

  function accelCallback(sensorData as Sensor.SensorData) as Void {
    var roll = sensorData.accelerometerData.roll; //.toDouble();
    var x = sensorData.accelerometerData.x; //.toDouble();
    var y = sensorData.accelerometerData.y; //.toDouble();
    // var y = sensorData.accelerometerData.y[0].toDouble();
    // System.println("x: " + xAccel + ", y: " + yAccel);

    // var roll = Math.atan2(y, x) * 57.29;
    // data = sensorData.accelerometerData.roll;
    // data = Sensor.Info.speed;
    System.println("x: " + x.toString() + ", y: " + y.toString());
    System.println("roll: " + roll.toString());
    data = 180 - roll[0].abs();
  }

  // function timerCallback() {
  //   var sensorInfo = Sensor.getInfo();
  //   if (sensorInfo has :accel && sensorInfo.accel != null) {
  //     var accel = sensorInfo.accel;
  //     var xAccel = accel[0];
  //     var yAccel = accel[1];
  //     var roll = Math.atan2(yAccel, xAccel) * 57.29;
  //     // data = sensorData.accelerometerData.roll;
  //     // data = Sensor.Info.speed;
  //     data = roll;
  //     System.println("x: " + xAccel + ", y: " + yAccel);
  //   }
  // }

  function getData() {
    return data;
  }

  function startActivity() {
    // var mLogger = SensorLogging.SensorLogger.initialize({
    //   :accelerometer => {
    //     :enabled => true,
    //   },
    // });

    // activity = ActivityRecording.createSession({
    //   :name => "PitchCounter",
    //   :sport => Activity.SPORT_GENERIC,
    //   // :sensorLogger => mLogger,
    // });

    // activity = ActivityRecording.createSession({
    //   :name => "Race", // set session name
    //   :sport => Activity.SPORT_GENERIC, // set sport type
    //   :subSport => Activity.SUB_SPORT_GENERIC, // set sub sport type
    // });

    // initialize accelerometer

    // dataTimer.start(method(:timerCallback), 500, true);
    var options = {
      :period => 1, // 1 second sample time
      :accelerometer => {
        :includeRoll => true,
        :enabled => true, // Enable the accelerometer
        :sampleRate => 1, // 25 samples
      },
    };
    // Using the callback setup in Toybox.SensorHistory.SensorData
    Sensor.registerSensorDataListener(method(:accelCallback), options);
    isRecording = true;
    // activity.start();
  }

  function stopActivity() {
    // dataTimer.stop();
    // activity.stop();
    isRecording = false;
    Sensor.unregisterSensorDataListener();
  }

  function isRunning() {
    return isRecording;
    // return activity ? activity.isRecording() : false;
  }

  function onStartStop() {
    if (isRecording) {
      stopActivity();
    } else {
      startActivity();
    }
  }
}
