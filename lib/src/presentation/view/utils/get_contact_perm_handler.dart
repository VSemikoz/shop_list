import 'package:shop_list/src/common/logger.dart';
import 'package:permission_handler/permission_handler.dart';



enum GetContactsPermResult { success, failure, successWithSettings, timerExpired }

const int _contactsGrantedTimerSeconds = 15;

class GetContactsPermissionHandler {
  Future<GetContactsPermResult> call() async {
    try {
      final state = await Permission.contacts.status;
      switch (state) {
        case PermissionStatus.denied:
          final s = await Permission.contacts.request();
          return s.isGranted ? GetContactsPermResult.success : await _serviceRequestPermAwaiting();
        case PermissionStatus.granted:
          return GetContactsPermResult.success;
        case PermissionStatus.restricted:
          return _serviceRequestPermAwaiting();
        case PermissionStatus.limited:
          return GetContactsPermResult.success;
        case PermissionStatus.permanentlyDenied:
          return _serviceRequestPermAwaiting();
      }
    } catch (e) {
      Log().writer.log('Get contacts perm failure with: ${e.toString()}');
      return _serviceRequestPermAwaiting();
    }
  }
}

Future<GetContactsPermResult> _serviceRequestPermAwaiting() async {
  try {
    var timer = 0;
    openAppSettings();
    while (timer < _contactsGrantedTimerSeconds) {
      timer++;
      await Future.delayed(Duration(seconds: 1));
      final perm = await Permission.contacts.status;
      if (perm.isGranted) return GetContactsPermResult.successWithSettings;
    }
    return GetContactsPermResult.timerExpired;
  } catch (e) {
    Log().writer.log('_serviceRequestAwaiting failure with: ${e.toString()}');
    return GetContactsPermResult.failure;
  }
}
