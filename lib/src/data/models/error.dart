import '../utils/failure.dart';

class ErrorTypedMessage<T> {
  final T type;
  final String? message;

//<editor-fold desc="Data Methods">

  const ErrorTypedMessage({
    required this.type,
    this.message,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ErrorTypedMessage &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          message == other.message);

  @override
  int get hashCode => type.hashCode ^ message.hashCode;

  @override
  String toString() {
    return 'ErrorTypedMessage{' + ' type: $type,' + ' message: $message,' + '}';
  }

  ErrorTypedMessage copyWith({
    T? type,
    String? message,
  }) {
    return ErrorTypedMessage(
      type: type ?? this.type,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': this.type,
      'message': this.message,
    };
  }

  factory ErrorTypedMessage.fromMap(Map<String, dynamic> map) {
    return ErrorTypedMessage(
      type: map['type'] as T,
      message: map['message'] as String,
    );
  }

//</editor-fold>
}

class NetworkErrorTypedMessage<T> extends ErrorTypedMessage<T> {
  final T type;
  final String? message;

  NetworkErrorTypedMessage({
    required this.type,
    this.message = UndefineMessages.network,
  }) : super(message: message, type: type);
}

class UndefinedErrorTypedMessage<T> extends ErrorTypedMessage<T> {
  final T type;
  final String? message;

  UndefinedErrorTypedMessage({
    required this.type,
    this.message = UndefineMessages.undefined,
  }) : super(message: message, type: type);
}
