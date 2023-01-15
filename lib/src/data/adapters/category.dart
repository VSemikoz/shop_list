import 'package:shop_list/src/data/models/category.dart';

import '../../domain/models/category.dart';

extension CategoryDataExtenion on CategoryData {
  CategoryEntry toEntry() {
    return CategoryEntry(id: id, name: name);
  }
}

extension CategoryEntryExtenion on CategoryEntry {
  CategoryData toData() {
    return CategoryData(id: id, name: name);
  }
}
