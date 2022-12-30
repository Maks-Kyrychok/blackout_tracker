import 'package:blackout_tracker/entities/device_information_entity.dart';

class DeviceInformationModel extends DeviceInformationEntity {
  DeviceInformationModel({
    required currentData,
    required currentTime,
    required batteryLevel,
    required isCharging,
    required isConnectedToWifi,
    required isConnected,
  }) : super(
          currentData: currentData,
          currentTime: currentTime,
          batteryLevel: batteryLevel,
          isCharging: isCharging,
          isConnectedToWifi: isConnectedToWifi,
          isConnected: isConnected,
        );

  factory DeviceInformationModel.fromJson(Map<String, dynamic> json) {
    return DeviceInformationModel(
      currentData: json['currentData'],
      currentTime: json['currentTime'],
      batteryLevel: json['batteryLevel'],
      isCharging: json['isCharging'],
      isConnectedToWifi: json['isConnectedToWifi'],
      isConnected: json['isConnected'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currentData': currentData,
      'currentTime': currentTime,
      'batteryLevel': batteryLevel,
      'isCharging': isCharging,
      'isConnectedToWifi': isConnectedToWifi,
      'isConnected': isConnected,
    };
  }
}
