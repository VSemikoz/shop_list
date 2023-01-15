import 'package:shop_list/src/common/logger.dart';
import 'package:permission_handler/permission_handler.dart';



enum GetLocationPermResult {
  success,
  successWithSettings,
  failure,
  timerExpired,
}

const int _locationGrantedTimerSeconds = 15;

class GetLocationPermissionHandler {
  Future<GetLocationPermResult> call({bool noSettings = false}) async {
    try {
      final state = await Permission.location.status;
      final isEnabled = await Permission.location.serviceStatus.isEnabled;
      if (!isEnabled) return _serviceRequestPermAwaiting(noSettings);
      switch (state) {
        case PermissionStatus.denied:
          final s = await Permission.location.request();
          return s.isGranted ? GetLocationPermResult.success : await _serviceRequestPermAwaiting(noSettings);
        case PermissionStatus.granted:
          return GetLocationPermResult.success;
        case PermissionStatus.restricted:
          return _serviceRequestPermAwaiting(noSettings);
        case PermissionStatus.limited:
          return GetLocationPermResult.success;
        case PermissionStatus.permanentlyDenied:
          return _serviceRequestPermAwaiting(noSettings);
      }
    } catch (e) {
      Log().writer.log('Get location perm failure with: ${e.toString()}');
      return _serviceRequestPermAwaiting(noSettings);
    }
  }
}

Future<GetLocationPermResult> _serviceRequestPermAwaiting(bool noSettings) async {
  try {
    if(noSettings) return GetLocationPermResult.failure;

    var timer = 0;
    openAppSettings();
    while (timer < _locationGrantedTimerSeconds) {
      timer++;
      await Future.delayed(Duration(seconds: 1));
      final perm = await Permission.location.status;
      final isEnabled = await Permission.location.serviceStatus.isEnabled;
      if (perm.isGranted && isEnabled) return GetLocationPermResult.successWithSettings;
    }
    return GetLocationPermResult.timerExpired;
  } catch (e) {
    Log().writer.log('_serviceRequestAwaiting failure with: ${e.toString()}');
    return GetLocationPermResult.failure;
  }
}
