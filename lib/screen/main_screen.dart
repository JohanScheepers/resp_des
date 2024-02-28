import 'package:flutter/widgets.dart';
import 'package:resp_des/device/device_type.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool? _horizontalNavigationStyle;
  //final _deviceTypeNotifier = DeviceTypeOrientationNotifier();

  @override
  Widget build(BuildContext context) {
    debugPrint('MainScreeen');
    return DeviceTypeBuilder(builder: (BuildContext context,
        DeviceTypeOrientationState state, Widget? child) {
      _horizontalNavigationStyle = (state.isTablet && state.isLandscape);
      // final device = _deviceTypeNotifier.isTablet ? "Tablet" : "Phone";
      // final deviceOritation =
      //     _deviceTypeNotifier.isLandscape ? "Landscape" : "Portrait";

      // debugPrint(
      //     'debugPrint main_screen.dart => Orientation changed to: $device');
      // debugPrint(
      //     'debugPrint main_screen.dart => Orientation changed to: $deviceOritation');

      if (_horizontalNavigationStyle!) {
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tablet Landscape',
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text('Tablet Portrait', style: TextStyle(fontSize: 20.0))
            ],
          ),
        );
      } else {
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Orientation changed to: ',
                style: TextStyle(fontSize: 20.0),
              )
            ],
          ),
        );
      }
    });
  }
}
