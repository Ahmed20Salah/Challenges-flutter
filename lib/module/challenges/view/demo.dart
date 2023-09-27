


import 'package:flutter/material.dart';
import 'dart:async';

import 'package:pedometer/pedometer.dart';

String formatDate(DateTime d) {
  return d.toString().substring(0, 19);
}


class WalkingScreen extends StatefulWidget {
  const WalkingScreen({super.key});

  @override
  _WalkingScreenState createState() => _WalkingScreenState();
}

class _WalkingScreenState extends State<WalkingScreen> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '?';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps.toString();
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pedometer Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Steps Taken',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                _steps,
                style: TextStyle(fontSize: 60),
              ),
              Divider(
                height: 100,
                thickness: 0,
                color: Colors.white,
              ),
              Text(
                'Pedestrian Status',
                style: TextStyle(fontSize: 30),
              ),
              Icon(
                _status == 'walking'
                    ? Icons.directions_walk
                    : _status == 'stopped'
                    ? Icons.accessibility_new
                    : Icons.error,
                size: 100,
              ),
              Center(
                child: Text(
                  _status,
                  style: _status == 'walking' || _status == 'stopped'
                      ? TextStyle(fontSize: 30)
                      : TextStyle(fontSize: 20, color: Colors.red),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
// import 'dart:async';
// import 'dart:io';
//
// import 'package:activity_recognition_flutter/activity_recognition_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
//
//
//
// class ActivityRecognitionApp extends StatefulWidget {
//   @override
//   _ActivityRecognitionAppState createState() => _ActivityRecognitionAppState();
// }
//
// class _ActivityRecognitionAppState extends State<ActivityRecognitionApp> {
//   StreamSubscription<ActivityEvent>? activityStreamSubscription;
//   List<ActivityEvent> _events = [];
//   ActivityRecognition activityRecognition = ActivityRecognition();
//
//   @override
//   void initState() {
//     super.initState();
//     _init();
//     _events.add(ActivityEvent.unknown());
//   }
//
//   @override
//   void dispose() {
//     activityStreamSubscription?.cancel();
//     super.dispose();
//   }
//
//   void _init() async {
//     // Android requires explicitly asking permission
//     if (Platform.isAndroid) {
//       if (await Permission.activityRecognition.request().isGranted) {
//         _startTracking();
//       }
//     }
//
//     // iOS does not
//     else {
//       _startTracking();
//     }
//   }
//
//   void _startTracking() {
//     activityStreamSubscription = activityRecognition
//         .activityStream(runForegroundService: true)
//         .listen(onData, onError: onError);
//   }
//
//   void onData(ActivityEvent activityEvent) {
//     print(activityEvent);
//     setState(() {
//       _events.add(activityEvent);
//     });
//   }
//
//   void onError(Object error) {
//     print('ERROR - $error');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//         appBar: AppBar(
//           title: const Text('Activity Recognition'),
//         ),
//         body: Center(
//           child: ListView.builder(
//               itemCount: _events.length,
//               reverse: true,
//               itemBuilder: (_, int idx) {
//                 final activity = _events[idx];
//                 return ListTile(
//                   leading: _activityIcon(activity.type),
//                   title: Text(
//                       '${activity.type.toString().split('.').last} (${activity.confidence}%)'),
//                   trailing: Text(activity.timeStamp
//                       .toString()
//                       .split(' ')
//                       .last
//                       .split('.')
//                       .first),
//                 );
//               }),
//         ),
//       );
//   }
//
//   Icon _activityIcon(ActivityType type) {
//     switch (type) {
//       case ActivityType.WALKING:
//         return Icon(Icons.directions_walk);
//       case ActivityType.IN_VEHICLE:
//         return Icon(Icons.car_rental);
//       case ActivityType.ON_BICYCLE:
//         return Icon(Icons.pedal_bike);
//       case ActivityType.ON_FOOT:
//         return Icon(Icons.directions_walk);
//       case ActivityType.RUNNING:
//         return Icon(Icons.run_circle);
//       case ActivityType.STILL:
//         return Icon(Icons.cancel_outlined);
//       case ActivityType.TILTING:
//         return Icon(Icons.redo);
//       default:
//         return Icon(Icons.device_unknown);
//     }
//   }
// }