import 'package:flutter/material.dart';
import 'package:resp_des/device/device.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _deviceTypeNotifier = DeviceTypeOrientationNotifier();

  @override
  void initState() {
    super.initState();
    _deviceTypeNotifier.init();
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
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(device),
            const SizedBox(
              height: 10,
            ),
            Text(deviceOritation),
          ],
        )));
  }
}
