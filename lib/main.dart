import 'package:flutter/material.dart';
import 'core/constants/app_constants.dart';
import 'core/di/di.dart';

void main() {
  configureDependencies();

  runApp(
    const MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
        home: Placeholder(),
    ),
  );
}
