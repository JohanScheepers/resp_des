import 'package:flutter/material.dart';
import 'package:resp_des/device/device.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final device = deviceType.isTablet ? "Tablet" : "Phone";
    final deviceOritation = deviceType.isLandscape ? "Landscape" : "Portrait";
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
