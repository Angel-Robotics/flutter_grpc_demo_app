import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roslibdart/roslibdart.dart';

final rosLibProvider = Provider((ref) => RosLibController(ref));
final rosConnectionState = StateProvider((ref) => false);

class TestRequestItem {
  String? title;
  int? rqCode;
  String? data;
  AsyncCallback? voidCallback;

  TestRequestItem({
    this.title,
    this.rqCode,
    this.data,
    this.voidCallback,
  });
}

enum TestRQCode {
  deviceInfoSummary(1000),
  deviceInfoMac(1001),
  deviceInfoRos(1002),
  deviceInfoIp(1003);

  final int code;

  const TestRQCode(this.code);
}

class RosLibController {
  Ros? _ros;
  Service? mobileBridgeRequest;
  Ref? ref;

  RosLibController(this.ref);

  connectRos() async {
    _ros = Ros(url: 'ws://192.168.15.240:9090');
    mobileBridgeRequest = Service(name: 'mobile_bridge_request', ros: _ros!, type: "mobile_app_interfaces/MobileBird");
    print("Connect: ROS");

    if ((ref?.read(rosConnectionState)) == false) {
      _ros?.connect();
      ref?.read(rosConnectionState.notifier).state = true;
    }

    generateDeviceInfoTestItems();
  }

  void destroyConnection() async {
    await _ros?.close();
    ref?.read(rosConnectionState.notifier).state = false;
  }

  List<TestRequestItem> generateDeviceInfoTestItems() {
    return [
      TestRequestItem(
        title: "젯슨 시스템 정보 요청",
        rqCode: TestRQCode.deviceInfoSummary.code,
        data: "device_info_summary",
      ),
      TestRequestItem(title: "MAC Address 정보 요청", rqCode: TestRQCode.deviceInfoMac.code, data: "device_info_mac"),
      TestRequestItem(title: "ROS 정보 요청", rqCode: TestRQCode.deviceInfoRos.code, data: "device_info_ros"),
      TestRequestItem(title: "IP 관련 정보 요청", rqCode: TestRQCode.deviceInfoIp.code, data: "device_info_ros")
    ];
  }
}
