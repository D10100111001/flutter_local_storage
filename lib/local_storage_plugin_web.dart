import 'dart:html';
import 'package:flutter/services.dart';
import 'package:flutter_local_storage/storage_provider.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

class LocalStoragePlugin implements StorageProvider {
  static void registerWith(Registrar registrar) {
    final MethodChannel channel = MethodChannel(
        'plugins.sasid.io/local_storage',
        const StandardMethodCodec(),
        registrar.messenger);
    final LocalStoragePlugin instance = LocalStoragePlugin();
    channel.setMethodCallHandler(instance.handleMethodCall);
  }

  Future<dynamic> handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'getVal':
        final String key = call.arguments['key'];
        return getVal(key);
      case 'setVal':
        final String key = call.arguments['key'];
        final String value = call.arguments['value'];
        return setVal(key, value);
      default:
        throw PlatformException(
            code: 'Unimplemented',
            details: "The local_storage plugin for web doesn't implement "
                "the method '${call.method}'");
    }
  }

  @override
  Future<String> getVal(String key) async {
    return window.localStorage[key];
  }

  @override
  Future setVal(String key, String value) async {
    if (window.localStorage.containsKey(key)) window.localStorage.remove(key);
    window.localStorage.putIfAbsent(key, () => value);
  }
}
