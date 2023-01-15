import 'package:shop_list/src/common/utils/color.dart';
import 'package:shop_list/src/data/models/list.dart';

import '../../domain/models/list.dart';

extension ListDataExtenion on ListData {
  ListEntry toEntry() {
    return ListEntry(id: id, name: name, color: HexColor.fromHex(color));
  }
}

extension ListEntryExtenion on ListEntry {
  ListData toData() {
    return ListData(id: id, name: name, color: color.toHex());
  }
}
