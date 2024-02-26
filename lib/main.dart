import 'package:flutter/material.dart';
import 'package:resp_des/app/app.dart';
import 'package:resp_des/app/config.dart';

//import 'package:responsive_design/app/config.dart';

void main() {
  runApp(const ResponsiveDesign(
    config: AppConfig(env: AppEnv.prod, baseApiUrl: 'https://example.com/api/'),
  ));
}
