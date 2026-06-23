enum ScreenType {
  mobile,
  tablet,
  desktop,
}

class ScreenConfig {
  final ScreenType type;

  final int gridColumns;
  final double pagePadding;
  final double titleFontSize;

  const ScreenConfig({
    required this.type,
    required this.gridColumns,
    required this.pagePadding,
    required this.titleFontSize,
  });

  bool get isMobile =>
      type == ScreenType.mobile;

  bool get isTablet =>
      type == ScreenType.tablet;

  bool get isDesktop =>
      type == ScreenType.desktop;
}