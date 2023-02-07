import 'dart:convert';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shop_list/src/common/logger.dart';

import '../models/export_data.dart';

abstract class ImportExportDataRepositoryBase {
  Future<ExportData?> importDataFromPath(String path);

  Future<void> exportDataFromPath(String path, ExportData data);
}

@Injectable(as: ImportExportDataRepositoryBase)
class ImportExportDataRepository implements ImportExportDataRepositoryBase {
  @override
  Future<ExportData?> importDataFromPath(String path) async {
    try {
      final localPath = await _localPath;
      if (localPath == null) {
        throw Exception("Cant find folder");
      }
      final file = await _getFile("$localPath/$path");
      final isExist = await file.exists();

      if (!isExist) {
        throw Exception("Cant find path $localPath/$path");
      }

      final contents = await file.readAsString();
      final data = json.decode(contents);
      final exported = ExportData.fromMap(data);
      return exported;
    } catch (e, st) {
      Log().writer.log(e, st.toString());
      return null;
    }
  }

  @override
  Future<void> exportDataFromPath(String path, ExportData data) async {
    try {
      final localPath = await _localPath;
      if (localPath == null) {
        throw Exception("Cant find folder");
      }
      final file = await _getFile("$localPath/$path");
      final isExist = await file.exists();

      if (!isExist) {
        throw Exception("Cant find path $localPath/$path");
      }

      final Map<String, dynamic> content = data.toMap();
      await file.writeAsString(jsonEncode(content));
    } catch (e, st) {
      Log().writer.log(e, st.toString());
      return null;
    }
  }

  Future<String?> get _localPath async {
    final directory = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();

    return directory?.path;
  }

  Future<File> _getFile(String path) async {
    final file = File(path);
    return file;
  }
}
