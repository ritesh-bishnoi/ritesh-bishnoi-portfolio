import 'package:flutter/material.dart';

import 'breakpoints.dart';
import 'screen_config.dart';

class Responsive {
  static ScreenConfig of(
    BuildContext context,
  ) {
    final width =
        MediaQuery.of(context).size.width;

    if (width < Breakpoints.mobile) {
      return const ScreenConfig(
        type: ScreenType.mobile,
        gridColumns: 1,
        pagePadding: 16,
        titleFontSize: 24,
      );
    }

    if (width < Breakpoints.tablet) {
      return const ScreenConfig(
        type: ScreenType.tablet,
        gridColumns: 2,
        pagePadding: 24,
        titleFontSize: 32,
      );
    }

    return const ScreenConfig(
      type: ScreenType.desktop,
      gridColumns: 3,
      pagePadding: 40,
      titleFontSize: 40,
    );
  }
}