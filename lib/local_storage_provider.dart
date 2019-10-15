import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_local_storage/storage_provider.dart';

const MethodChannel _channel = MethodChannel('plugins.sasid.io/local_storage');

class LocalStorageProvider implements StorageProvider {
  @override
  Future<String> getVal(String key) async {
    if (key == null) {
      return null;
    }
    return await _channel.invokeMethod<String>(
      'getVal',
      <String, Object>{'key': key},
    );
  }

  @override
  Future setVal(String key, String value) async {
    if (key == null) {
      return null;
    }
    await _channel.invokeMethod<void>(
      'setVal',
      <String, Object>{'key': key, 'value': value},
    );
  }
}
