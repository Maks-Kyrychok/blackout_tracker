import 'dart:convert';

import 'package:blackout_tracker/models/device_information.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class DeviceInformationLocalDataSource {
  /// Gets the cached [List<DeviceInformation>] which was gotten the last time
  /// the user had an internet conection
  ///
  /// Throws [CacheException] if on cached data is present.

  Future<List<DeviceInformationModel>> getLastDeviceInformationCache();
  Future deviceInformationToCache(
      List<DeviceInformationModel> deviceInformation);
}

const CACHED_DEVICE_INFORMATION_LIST = 'CACHED_DEVICE_INFORMATION_LIST';

class DeviceInformationLocalDataSourceImpl
    implements DeviceInformationLocalDataSource {
  final SharedPreferences sharedPreferences;

  DeviceInformationLocalDataSourceImpl(this.sharedPreferences);
  @override
  Future deviceInformationToCache(
      List<DeviceInformationModel> deviceInformation) {
    final List<String> jsonDeviceInformationList = deviceInformation
        .map((deviceInformation) => jsonEncode(deviceInformation.toJson()))
        .toList();
    sharedPreferences.setStringList(
        CACHED_DEVICE_INFORMATION_LIST, jsonDeviceInformationList);

    return Future.value(jsonDeviceInformationList);
  }

  @override
  Future<List<DeviceInformationModel>> getLastDeviceInformationCache() {
    final jsonDeviceInformationList =
        sharedPreferences.getStringList(CACHED_DEVICE_INFORMATION_LIST);
    if (jsonDeviceInformationList != null) {
      return Future.value(jsonDeviceInformationList
          .map((information) =>
              DeviceInformationModel.fromJson(jsonDecode(information)))
          .toList());
    } else {
      throw 'Cache exception';
    }
  }
}
