import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:intl/date_symbol_data_local.dart';
import 'package:resp_des/screen/main_screen.dart';
import 'package:resp_des/app/config.dart';
import 'package:resp_des/device/device.dart';

class ResponsiveDesign extends StatefulWidget {
  const ResponsiveDesign({
    super.key,
    required this.config,
  });

  final AppConfig config;

  @override
  State<ResponsiveDesign> createState() => _ResponsiveDesignState();
}

class _ResponsiveDesignState extends State<ResponsiveDesign> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  final _deviceTypeNotifier = DeviceTypeOrientationNotifier();

  NavigatorState? get navigatorState => _navigatorKey.currentState;

  late Future<Device> _appLoader;

  @override
  void initState() {
    super.initState();
    _deviceTypeNotifier.init();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations(
      _deviceTypeNotifier.isPhone //
          ? [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
          : DeviceOrientation.values,
    );
    Intl.defaultLocale = PlatformDispatcher.instance.locale.toLanguageTag();
    _appLoader = _loadApp();
  }

  Future<Device> _loadApp() async {
    await initializeDateFormatting();
    final device = await Device.init(widget.config, _deviceTypeNotifier);

    return device;
  }

  @override
  void dispose() {
    _deviceTypeNotifier.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Device>(
      future: _appLoader,
      builder: (BuildContext context, AsyncSnapshot<Device> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const CircularProgressIndicator();
        } else {
          return DeviceInheritedWidget(
              device: snapshot.requireData, child: const MainScreen());
        }
      },
    );
  }
}
