import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

/// A utility class for various device-related operations, such as handling system UI settings, 
/// screen dimensions, orientation, device capabilities, and internet connectivity.
class DeviceUtilities {

  /// Hides the software keyboard by removing focus from the current input field.
  /// 
  /// [context] The BuildContext used to access the current focus node.
  static void hideKeyBoard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  /// Sets the color of the status bar.
  /// 
  /// [color] The color to set for the status bar.
  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color),
    );
  }

  /// Checks if the device is currently in landscape orientation.
  /// 
  /// [context] The BuildContext used to access the current view insets.
  /// Returns true if the device is in landscape orientation, false otherwise.
  static bool isLandscopeOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom == 0;
  }

  /// Checks if the device is currently in portrait orientation.
  /// 
  /// [context] The BuildContext used to access the current view insets.
  /// Returns true if the device is in portrait orientation, false otherwise.
  static bool isPortraitOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom != 0;
  }

  /// Enables or disables fullscreen mode.
  /// 
  /// [enable] If true, sets immersive fullscreen mode, else sets the edge-to-edge mode.
  static void setFullScreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(
      enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge,
    );
  }

  /// Retrieves the screen height.
  /// 
  /// Returns the height of the screen in logical pixels.
  static double getScreenHeight() {
    return MediaQuery.sizeOf(Get.context!).height;
  }

  /// Retrieves the screen width.
  /// 
  /// Returns the width of the screen in logical pixels.
  static double getScreenWidth() {
    return MediaQuery.sizeOf(Get.context!).width;
  }

  /// Retrieves the device's pixel ratio.
  /// 
  /// Returns the pixel density ratio of the screen (e.g., 1.0, 2.0, 3.0).
  static double getPixelRatio() {
    return MediaQuery.of(Get.context!).devicePixelRatio;
  }

  /// Retrieves the height of the status bar.
  /// 
  /// Returns the height of the system status bar in logical pixels.
  static double getStatusBarHeight() {
    return MediaQuery.of(Get.context!).padding.top;
  }

  /// Retrieves the height of the bottom navigation bar.
  /// 
  /// Returns the height of the bottom navigation bar in logical pixels.
  static double getBottomNavBarHeight() {
    return kBottomNavigationBarHeight;
  }

  /// Retrieves the height of the app bar.
  /// 
  /// Returns the height of the app bar in logical pixels.
  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  /// Retrieves the height of the software keyboard.
  /// 
  /// Returns the height of the keyboard in logical pixels.
  static double getKeyboardHeight() {
    final viewInsets = View.of(Get.context!).viewInsets;
    return viewInsets.bottom;
  }

  /// Checks if the keyboard is currently visible.
  /// 
  /// Returns true if the keyboard is visible, false otherwise.
  static Future<bool> isKeyBoardVisible() async {
    final viewInsets = View.of(Get.context!).viewInsets;
    return viewInsets.bottom > 0;
  }

  /// Checks if the app is running on a physical device.
  /// 
  /// Returns true if the app is running on a physical Android or iOS device, 
  /// false if running in an emulator or simulator.
  static Future<bool> isPhysicalDevice() async {
    return defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS;
  }

  /// Triggers the device to vibrate for the specified duration.
  /// 
  /// [duration] The duration for which the device should vibrate.
  static void vibrate(Duration duration) {
    HapticFeedback.vibrate();
    Future.delayed(duration, () => HapticFeedback.vibrate());
  }

  /// Sets the preferred screen orientations for the application.
  /// 
  /// [orientations] A list of DeviceOrientation values to set as the preferred orientations.
  static Future<void> setPreferredOrientations(
    List<DeviceOrientation> orientations,
  ) async {
    await SystemChrome.setPreferredOrientations(orientations);
  }

  /// Hides the status bar by disabling the system UI overlays.
  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  /// Shows the status bar by enabling the system UI overlays.
  static void showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }

  /// Checks if the device has an active internet connection.
  /// 
  /// Returns true if an internet connection is available, false otherwise.
  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  /// Checks if the platform is iOS.
  /// 
  /// Returns true if the platform is iOS, false otherwise.
  static bool isIOS() {
    return Platform.isIOS;
  }

  /// Checks if the platform is Android.
  /// 
  /// Returns true if the platform is Android, false otherwise.
  static bool isAndroid() {
    return Platform.isAndroid;
  }

  /// Launches a URL using the default browser.
  /// 
  /// [url] The URL to be launched.
  /// Throws an error if the URL cannot be launched.
  static void launchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
