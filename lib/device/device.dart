import 'package:flutter/material.dart';
import 'package:resp_des/device/device_type.dart';

export 'package:resp_des/device/device_type.dart' hide DeviceOrientation;

extension DeviceContext on BuildContext {
  Device get device => DeviceInheritedWidget.of(this, listen: false);

  DeviceTypeOrientationNotifier get deviceType => device.deviceType;
}

extension DevicestateState<T extends StatefulWidget> on State<T> {
  DeviceTypeOrientationNotifier get deviceType => context.deviceType;
}

class Device {
  Device._(
    this.deviceType,
  );

  final DeviceTypeOrientationNotifier deviceType;

  static Future<Device> init(DeviceTypeOrientationNotifier deviceType) async {
    return Device._(deviceType);
  }
}

@immutable
class DeviceInheritedWidget extends InheritedWidget {
  const DeviceInheritedWidget({
    super.key,
    required this.device,
    required super.child,
  });

  final Device device;

  static Device of(BuildContext context, {bool listen = true}) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<DeviceInheritedWidget>()!
          .device;
    } else {
      return context
          .getInheritedWidgetOfExactType<DeviceInheritedWidget>()!
          .device;
    }
  }

  @override
  bool updateShouldNotify(DeviceInheritedWidget oldWidget) {
    return device != oldWidget.device;
  }
}
