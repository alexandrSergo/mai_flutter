import 'dart:ui';
import 'package:flutter/material.dart';

final FlutterView view = WidgetsBinding.instance.platformDispatcher.views.first;

// Dimensions in logical pixels (dp)
final Size size = view.physicalSize / view.devicePixelRatio;
final double width = size.width;
final double height = size.height;