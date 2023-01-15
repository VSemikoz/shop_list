import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:dio/dio.dart';

enum ExternalFailure {
  phoneNotValid,
  unknown,
}

abstract class FailureMessage {
  static const String phoneNotValid = 'Telephone in not valid';
}

extension DioErrorTypeExtension on DioErrorType {
  bool isFailureNetwork() {
    switch (this) {
      case DioErrorType.connectTimeout:
        return true;
      case DioErrorType.sendTimeout:
        return true;
      case DioErrorType.receiveTimeout:
        return true;
      case DioErrorType.response:
        return false;
      case DioErrorType.cancel:
        return false;
      case DioErrorType.other:
        return true;
    }
  }
}

ExternalFailure externalFailureHandling(DioError error) {
  try {
    if (error.response == null) return ExternalFailure.unknown;
    final status = error.response!.data['error']['message'];

    if (status == FailureMessage.phoneNotValid) {
      return ExternalFailure.phoneNotValid;
    }
    return ExternalFailure.unknown;
  } catch (e) {
    return ExternalFailure.unknown;
  }
}

abstract class UndefineMessages {
  static const String network = "Network";
  static const String undefined = "Undefined";
}

//TODO maybe should parse with error code to localize (need all back error codes)
String? parseErrorMessageToText(dynamic errorText) {
  final data = json.decode(errorText.toString());

  if (data is Map) {
    return data["message"];
  }
  if (data is List) {
    String buffer = "";
    data.forEachIndexed((i, element) {
      buffer += "${element["message"]}${i == data.length - 1 ? "" : "\n"}";
    });
    return buffer;
  }
  return null;
}
