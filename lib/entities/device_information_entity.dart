import 'package:equatable/equatable.dart';

class DeviceInformationEntity extends Equatable {
  final String currentData;
  final String currentTime;
  final int batteryLevel;
  final bool isCharging;
  final bool isConnectedToWifi;
  final bool isConnected;

 const DeviceInformationEntity({
    required this.currentData,
    required this.currentTime,
    required this.batteryLevel,
    required this.isCharging,
    required this.isConnectedToWifi,
    required this.isConnected,
  });
  @override
  List<Object?> get props => [
        currentData,
        currentTime,
        batteryLevel,
        isCharging,
        isConnectedToWifi,
        isConnected,
      ];
}
