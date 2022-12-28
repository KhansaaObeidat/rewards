import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

enum SelectedDevice { phone, tablet, browser }

class ResponsiveTextSize {
  double textSize(double? size) {
    double theSize;
    if (size == null) {
      theSize = 14;
    } else {
      theSize = size;
    }
    if (Responsive.selectedDevice() == SelectedDevice.tablet) {
      return theSize + 5;
    }

    if (Responsive.isSmall()) {
      return theSize - 3;
    } else {
      return theSize;
    }
  }
}

class Responsive extends StatelessWidget {
  final Widget? small;
  final Widget? large;
  static double devicePixelRatio = ui.window.devicePixelRatio;
  static final ui.Size size = ui.window.physicalSize;
  static double get width => size.width;
  static double get height => size.height;

  const Responsive({
    Key? key,
    this.small,
    this.large,
  }) : super(key: key);

  // static bool isSmall(BuildContext context) => MediaQuery.of(context).size.height <= 600;
  static bool isSmall() {
    return MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .size
            .height <=
        700;
  }

  static SelectedDevice selectedDevice() {
    if (kIsWeb) {
      return SelectedDevice.browser;
    }
    if (devicePixelRatio < 2 && (width >= 1000 || height >= 1000)) {
      return SelectedDevice.tablet;
    } else if (devicePixelRatio == 2 && (width >= 1920 || height >= 1920)) {
      return SelectedDevice.tablet;
    } else {
      return SelectedDevice.phone;
    }
  }

  @override
  Widget build(BuildContext context) {
    //final Size _size = MediaQuery.of(context).size;
    if (selectedDevice() == SelectedDevice.phone) {
      return small!;
    } else {
      return large!;
    }
  }
}