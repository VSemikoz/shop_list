import 'package:flutter/material.dart';
import 'package:shop_list/src/common/providers/theme/theme.dart';
import 'package:overlay_support/overlay_support.dart';

enum MessageType {
  networkError,
  cancel,
}

const EdgeInsets _horizontalPadding =
    const EdgeInsets.symmetric(horizontal: 16.0);

class MessageUtils {
  static OverlaySupportEntry? _entry;

  static OverlaySupportEntry _showNotification({
    required Widget widget,
    bool dismissPrev = true,
  }) {
    if (dismissPrev) _entry?.dismiss();

    _entry = showSimpleNotification(
      widget,
      contentPadding: const EdgeInsets.only(top: 16, left: 8, right: 8),
      background: Colors.transparent,
      duration: Duration(seconds: 5),
      slideDismissDirection: DismissDirection.horizontal,
    );
    return _entry!;
  }

  static show({required String message, MessageType? type}) =>
      _showNotification(widget: _Message(message: message, type: type));

  static networkError() => _showNotification(widget: _NetworkMessage());

  static undefined() => _showNotification(widget: _UndefinedMessage());
}

class _Message extends StatelessWidget {
  final String message;
  final MessageType? type;

  const _Message({
    Key? key,
    required this.message,
    this.type,
  }) : super(key: key);

  _getTypeIcon(BuildContext context) {
    switch (type!) {
      case MessageType.networkError:
        return Icon(
          Icons.wifi_off_sharp,
          color: context.colorTheme.error.main,
        );
      case MessageType.cancel:
        return Icon(
          Icons.cancel_outlined,
          color: context.colorTheme.error.main,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: context.colorTheme.background.primary,
      ),
      child: Padding(
        padding: _horizontalPadding,
        child: Row(
          children: [
            if (type != null) _getTypeIcon(context),
            if (type != null) const SizedBox(width: 16),
            Expanded(
              child: Text(
                message,
                style: context.textStyle.bodyLarge.copyWith(
                  color: context.colorTheme.textDark.primary,
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class _NetworkMessage extends StatelessWidget {
  const _NetworkMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _Message(
      message: 'Network Error',//TODO
      type: MessageType.cancel,
    );
  }
}

class _UndefinedMessage extends StatelessWidget {
  const _UndefinedMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _Message(
      message: 'Undefined Error',//TODO
      type: MessageType.cancel,
    );
  }
}
