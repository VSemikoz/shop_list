import 'package:shop_list/src/data/models/error.dart';
import 'package:shop_list/src/data/utils/failure.dart';

import '../../ui/widgets/message/primary.dart';

handleTypedError(ErrorTypedMessage error) {
  final message = error.message;
  if (message != null) {
    if (message == UndefineMessages.undefined) {
      MessageUtils.undefined();
      return;
    }
    if (message == UndefineMessages.network) {
      MessageUtils.networkError();
      return;
    }
    MessageUtils.show(message: message);
    return;
  }
  MessageUtils.undefined();
  return;
}
