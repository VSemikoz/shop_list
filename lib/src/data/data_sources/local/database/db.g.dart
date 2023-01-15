// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $CategoryItemsTable extends CategoryItems
    with TableInfo<$CategoryItemsTable, CategoryItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? 'category_items';
  @override
  String get actualTableName => 'category_items';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $CategoryItemsTable createAlias(String alias) {
    return $CategoryItemsTable(attachedDatabase, alias);
  }
}

class CategoryItem extends DataClass implements Insertable<CategoryItem> {
  final int id;
  final String name;
  const CategoryItem({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  CategoryItemsCompanion toCompanion(bool nullToAbsent) {
    return CategoryItemsCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory CategoryItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryItem(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  CategoryItem copyWith({int? id, String? name}) => CategoryItem(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('CategoryItem(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryItem && other.id == this.id && other.name == this.name);
}

class CategoryItemsCompanion extends UpdateCompanion<CategoryItem> {
  final Value<int> id;
  final Value<String> name;
  const CategoryItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  CategoryItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<CategoryItem> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  CategoryItemsCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return CategoryItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $ListItemsTable extends ListItems
    with TableInfo<$ListItemsTable, ListItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ListItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
      'color', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, color];
  @override
  String get aliasedName => _alias ?? 'list_items';
  @override
  String get actualTableName => 'list_items';
  @override
  VerificationContext validateIntegrity(Insertable<ListItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ListItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ListItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color'])!,
    );
  }

  @override
  $ListItemsTable createAlias(String alias) {
    return $ListItemsTable(attachedDatabase, alias);
  }
}

class ListItem extends DataClass implements Insertable<ListItem> {
  final int id;
  final String name;
  final String color;
  const ListItem({required this.id, required this.name, required this.color});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['color'] = Variable<String>(color);
    return map;
  }

  ListItemsCompanion toCompanion(bool nullToAbsent) {
    return ListItemsCompanion(
      id: Value(id),
      name: Value(name),
      color: Value(color),
    );
  }

  factory ListItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ListItem(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<String>(json['color']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<String>(color),
    };
  }

  ListItem copyWith({int? id, String? name, String? color}) => ListItem(
        id: id ?? this.id,
        name: name ?? this.name,
        color: color ?? this.color,
      );
  @override
  String toString() {
    return (StringBuffer('ListItem(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, color);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ListItem &&
          other.id == this.id &&
          other.name == this.name &&
          other.color == this.color);
}

class ListItemsCompanion extends UpdateCompanion<ListItem> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> color;
  const ListItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
  });
  ListItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String color,
  })  : name = Value(name),
        color = Value(color);
  static Insertable<ListItem> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? color,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (color != null) 'color': color,
    });
  }

  ListItemsCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? color}) {
    return ListItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ListItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }
}

class $ProductItemsTable extends ProductItems
    with TableInfo<$ProductItemsTable, ProductItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _listIdMeta = const VerificationMeta('listId');
  @override
  late final GeneratedColumn<int> listId = GeneratedColumn<int>(
      'list_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<int> price = GeneratedColumn<int>(
      'price', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _priceDescriptionMeta =
      const VerificationMeta('priceDescription');
  @override
  late final GeneratedColumn<String> priceDescription = GeneratedColumn<String>(
      'price_description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isFavoriteMeta =
      const VerificationMeta('isFavorite');
  @override
  late final GeneratedColumn<bool> isFavorite =
      GeneratedColumn<bool>('is_favorite', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_favorite" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _countMeta = const VerificationMeta('count');
  @override
  late final GeneratedColumn<int> count = GeneratedColumn<int>(
      'count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _countDescriptionMeta =
      const VerificationMeta('countDescription');
  @override
  late final GeneratedColumn<String> countDescription = GeneratedColumn<String>(
      'count_description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        listId,
        categoryId,
        name,
        description,
        price,
        priceDescription,
        isFavorite,
        status,
        count,
        countDescription
      ];
  @override
  String get aliasedName => _alias ?? 'product_items';
  @override
  String get actualTableName => 'product_items';
  @override
  VerificationContext validateIntegrity(Insertable<ProductItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('list_id')) {
      context.handle(_listIdMeta,
          listId.isAcceptableOrUnknown(data['list_id']!, _listIdMeta));
    } else if (isInserting) {
      context.missing(_listIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('price_description')) {
      context.handle(
          _priceDescriptionMeta,
          priceDescription.isAcceptableOrUnknown(
              data['price_description']!, _priceDescriptionMeta));
    } else if (isInserting) {
      context.missing(_priceDescriptionMeta);
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
          _isFavoriteMeta,
          isFavorite.isAcceptableOrUnknown(
              data['is_favorite']!, _isFavoriteMeta));
    } else if (isInserting) {
      context.missing(_isFavoriteMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('count')) {
      context.handle(
          _countMeta, count.isAcceptableOrUnknown(data['count']!, _countMeta));
    } else if (isInserting) {
      context.missing(_countMeta);
    }
    if (data.containsKey('count_description')) {
      context.handle(
          _countDescriptionMeta,
          countDescription.isAcceptableOrUnknown(
              data['count_description']!, _countDescriptionMeta));
    } else if (isInserting) {
      context.missing(_countDescriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      listId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}list_id'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}price'])!,
      priceDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}price_description'])!,
      isFavorite: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_favorite'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      count: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}count'])!,
      countDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}count_description'])!,
    );
  }

  @override
  $ProductItemsTable createAlias(String alias) {
    return $ProductItemsTable(attachedDatabase, alias);
  }
}

class ProductItem extends DataClass implements Insertable<ProductItem> {
  final int id;
  final int listId;
  final int categoryId;
  final String name;
  final String description;
  final int price;
  final String priceDescription;
  final bool isFavorite;
  final String status;
  final int count;
  final String countDescription;
  const ProductItem(
      {required this.id,
      required this.listId,
      required this.categoryId,
      required this.name,
      required this.description,
      required this.price,
      required this.priceDescription,
      required this.isFavorite,
      required this.status,
      required this.count,
      required this.countDescription});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['list_id'] = Variable<int>(listId);
    map['category_id'] = Variable<int>(categoryId);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['price'] = Variable<int>(price);
    map['price_description'] = Variable<String>(priceDescription);
    map['is_favorite'] = Variable<bool>(isFavorite);
    map['status'] = Variable<String>(status);
    map['count'] = Variable<int>(count);
    map['count_description'] = Variable<String>(countDescription);
    return map;
  }

  ProductItemsCompanion toCompanion(bool nullToAbsent) {
    return ProductItemsCompanion(
      id: Value(id),
      listId: Value(listId),
      categoryId: Value(categoryId),
      name: Value(name),
      description: Value(description),
      price: Value(price),
      priceDescription: Value(priceDescription),
      isFavorite: Value(isFavorite),
      status: Value(status),
      count: Value(count),
      countDescription: Value(countDescription),
    );
  }

  factory ProductItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductItem(
      id: serializer.fromJson<int>(json['id']),
      listId: serializer.fromJson<int>(json['listId']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      price: serializer.fromJson<int>(json['price']),
      priceDescription: serializer.fromJson<String>(json['priceDescription']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
      status: serializer.fromJson<String>(json['status']),
      count: serializer.fromJson<int>(json['count']),
      countDescription: serializer.fromJson<String>(json['countDescription']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'listId': serializer.toJson<int>(listId),
      'categoryId': serializer.toJson<int>(categoryId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'price': serializer.toJson<int>(price),
      'priceDescription': serializer.toJson<String>(priceDescription),
      'isFavorite': serializer.toJson<bool>(isFavorite),
      'status': serializer.toJson<String>(status),
      'count': serializer.toJson<int>(count),
      'countDescription': serializer.toJson<String>(countDescription),
    };
  }

  ProductItem copyWith(
          {int? id,
          int? listId,
          int? categoryId,
          String? name,
          String? description,
          int? price,
          String? priceDescription,
          bool? isFavorite,
          String? status,
          int? count,
          String? countDescription}) =>
      ProductItem(
        id: id ?? this.id,
        listId: listId ?? this.listId,
        categoryId: categoryId ?? this.categoryId,
        name: name ?? this.name,
        description: description ?? this.description,
        price: price ?? this.price,
        priceDescription: priceDescription ?? this.priceDescription,
        isFavorite: isFavorite ?? this.isFavorite,
        status: status ?? this.status,
        count: count ?? this.count,
        countDescription: countDescription ?? this.countDescription,
      );
  @override
  String toString() {
    return (StringBuffer('ProductItem(')
          ..write('id: $id, ')
          ..write('listId: $listId, ')
          ..write('categoryId: $categoryId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('price: $price, ')
          ..write('priceDescription: $priceDescription, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('status: $status, ')
          ..write('count: $count, ')
          ..write('countDescription: $countDescription')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, listId, categoryId, name, description,
      price, priceDescription, isFavorite, status, count, countDescription);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductItem &&
          other.id == this.id &&
          other.listId == this.listId &&
          other.categoryId == this.categoryId &&
          other.name == this.name &&
          other.description == this.description &&
          other.price == this.price &&
          other.priceDescription == this.priceDescription &&
          other.isFavorite == this.isFavorite &&
          other.status == this.status &&
          other.count == this.count &&
          other.countDescription == this.countDescription);
}

class ProductItemsCompanion extends UpdateCompanion<ProductItem> {
  final Value<int> id;
  final Value<int> listId;
  final Value<int> categoryId;
  final Value<String> name;
  final Value<String> description;
  final Value<int> price;
  final Value<String> priceDescription;
  final Value<bool> isFavorite;
  final Value<String> status;
  final Value<int> count;
  final Value<String> countDescription;
  const ProductItemsCompanion({
    this.id = const Value.absent(),
    this.listId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.price = const Value.absent(),
    this.priceDescription = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.status = const Value.absent(),
    this.count = const Value.absent(),
    this.countDescription = const Value.absent(),
  });
  ProductItemsCompanion.insert({
    this.id = const Value.absent(),
    required int listId,
    required int categoryId,
    required String name,
    required String description,
    required int price,
    required String priceDescription,
    required bool isFavorite,
    required String status,
    required int count,
    required String countDescription,
  })  : listId = Value(listId),
        categoryId = Value(categoryId),
        name = Value(name),
        description = Value(description),
        price = Value(price),
        priceDescription = Value(priceDescription),
        isFavorite = Value(isFavorite),
        status = Value(status),
        count = Value(count),
        countDescription = Value(countDescription);
  static Insertable<ProductItem> custom({
    Expression<int>? id,
    Expression<int>? listId,
    Expression<int>? categoryId,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? price,
    Expression<String>? priceDescription,
    Expression<bool>? isFavorite,
    Expression<String>? status,
    Expression<int>? count,
    Expression<String>? countDescription,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (listId != null) 'list_id': listId,
      if (categoryId != null) 'category_id': categoryId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (price != null) 'price': price,
      if (priceDescription != null) 'price_description': priceDescription,
      if (isFavorite != null) 'is_favorite': isFavorite,
      if (status != null) 'status': status,
      if (count != null) 'count': count,
      if (countDescription != null) 'count_description': countDescription,
    });
  }

  ProductItemsCompanion copyWith(
      {Value<int>? id,
      Value<int>? listId,
      Value<int>? categoryId,
      Value<String>? name,
      Value<String>? description,
      Value<int>? price,
      Value<String>? priceDescription,
      Value<bool>? isFavorite,
      Value<String>? status,
      Value<int>? count,
      Value<String>? countDescription}) {
    return ProductItemsCompanion(
      id: id ?? this.id,
      listId: listId ?? this.listId,
      categoryId: categoryId ?? this.categoryId,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      priceDescription: priceDescription ?? this.priceDescription,
      isFavorite: isFavorite ?? this.isFavorite,
      status: status ?? this.status,
      count: count ?? this.count,
      countDescription: countDescription ?? this.countDescription,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (listId.present) {
      map['list_id'] = Variable<int>(listId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (price.present) {
      map['price'] = Variable<int>(price.value);
    }
    if (priceDescription.present) {
      map['price_description'] = Variable<String>(priceDescription.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (count.present) {
      map['count'] = Variable<int>(count.value);
    }
    if (countDescription.present) {
      map['count_description'] = Variable<String>(countDescription.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductItemsCompanion(')
          ..write('id: $id, ')
          ..write('listId: $listId, ')
          ..write('categoryId: $categoryId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('price: $price, ')
          ..write('priceDescription: $priceDescription, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('status: $status, ')
          ..write('count: $count, ')
          ..write('countDescription: $countDescription')
          ..write(')'))
        .toString();
  }
}

abstract class _$ShopListDataBase extends GeneratedDatabase {
  _$ShopListDataBase(QueryExecutor e) : super(e);
  late final $CategoryItemsTable categoryItems = $CategoryItemsTable(this);
  late final $ListItemsTable listItems = $ListItemsTable(this);
  late final $ProductItemsTable productItems = $ProductItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [categoryItems, listItems, productItems];
}
