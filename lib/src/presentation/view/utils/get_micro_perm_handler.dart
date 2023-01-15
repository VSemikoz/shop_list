import 'package:shop_list/src/common/logger.dart';
import 'package:permission_handler/permission_handler.dart';



enum GetMicrophonePermResult {
  success,
  successWithSettings,
  failure,
  timerExpired,
}

const int _microphoneGrantedTimerSeconds = 15;

class GetMicrophonePermissionHandler {
  Future<GetMicrophonePermResult> call() async {
    try {
      final state = await Permission.microphone.status;
      switch (state) {
        case PermissionStatus.denied:
          final s = await Permission.microphone.request();
          return s.isGranted ? GetMicrophonePermResult.success : await _serviceRequestPermAwaiting();
        case PermissionStatus.granted:
          return GetMicrophonePermResult.success;
        case PermissionStatus.restricted:
          return _serviceRequestPermAwaiting();
        case PermissionStatus.limited:
          return GetMicrophonePermResult.success;
        case PermissionStatus.permanentlyDenied:
          return _serviceRequestPermAwaiting();
      }
    } catch (e) {
      Log().writer.log('Get microphone perm failure with: ${e.toString()}');
      return _serviceRequestPermAwaiting();
    }
  }
}

Future<GetMicrophonePermResult> _serviceRequestPermAwaiting() async {
  try {
    var timer = 0;
    openAppSettings();
    while (timer < _microphoneGrantedTimerSeconds) {
      timer++;
      await Future.delayed(Duration(seconds: 1));
      final perm = await Permission.microphone.status;
      if (perm.isGranted) return GetMicrophonePermResult.successWithSettings;
    }
    return GetMicrophonePermResult.timerExpired;
  } catch (e) {
    Log().writer.log('_serviceRequestAwaiting failure with: ${e.toString()}');
    return GetMicrophonePermResult.failure;
  }
}
