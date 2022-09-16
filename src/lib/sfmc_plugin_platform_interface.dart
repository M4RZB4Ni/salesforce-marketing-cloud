import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:flutter/services.dart';

import 'sfmc_plugin_method_channel.dart';

abstract class SfmcPluginPlatform extends PlatformInterface {
  SfmcPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static SfmcPluginPlatform _instance = MethodChannelSfmcPlugin();

  static SfmcPluginPlatform get instance => _instance;

  static set instance(SfmcPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// To Initialize the SDK for iOS only
  Future<bool?> initialize(
      {String? appId,
      String? accessToken,
      String? mid,
      String? sfmcURL,
      String? senderId,
      bool? delayRegistration}) {
    return _instance.initialize(
        appId: appId,
        accessToken: accessToken,
        mid: mid,
        sfmcURL: sfmcURL,
        senderId: senderId,
        delayRegistration: delayRegistration);
  }

  setHandler(Future<dynamic> Function(MethodCall call)? handler) =>
      _instance.setHandler(handler);

  /// To Set Contact Key
  Future<bool?> setContactKey(String? contactKey) =>
      _instance.setContactKey(contactKey);

  /// To Get Contact Key
  Future<String?> getContactKey() => _instance.getContactKey();

  /// To Add Tags
  Future<bool?> addTag(String? tag) => _instance.addTag(tag);

  /// To Remove Tags
  Future<bool?> removeTag(String? tag) => _instance.removeTag(tag);

  /// To Get Tags
  Future<List<String>> getTags() => _instance.getTags();

  /// To Enable/Disable Push Notification
  Future<bool?> setPushEnabled(bool? enabled) =>
      _instance.setPushEnabled(enabled);
}
