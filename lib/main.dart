import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:resp_des/device/device.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Responsive Device'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _deviceTypeNotifier = DeviceTypeOrientationNotifier();

  @override
  void initState() {
    super.initState();
    _deviceTypeNotifier.init();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    //Setting phone to be only portraitUp and portraitDown
    SystemChrome.setPreferredOrientations(
      _deviceTypeNotifier.isPhone //
          ? [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
          : DeviceOrientation.values,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _deviceTypeNotifier.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final device = _deviceTypeNotifier.isTablet ? "Tablet" : "Phone";
    final deviceOritation =
        _deviceTypeNotifier.isLandscape ? "Landscape" : "Portrait";

    debugPrint('Orientation changed to: $device');
    debugPrint('Orientation changed to: $deviceOritation');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Orientation changed to: $device',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text('Orientation changed to: $deviceOritation',
                style: const TextStyle(fontSize: 20.0))
          ],
        ),
      ),
    );
  }
}
