

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_grpc_demo_app/src/model/jetson_device_info.dart';
import 'package:flutter_grpc_demo_app/src/provider/device_info/jetson_device_info_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeviceInfoPage extends ConsumerWidget {
  const DeviceInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("AM, CM, MD 모듈별 시리얼 및 정보"),
        const Text("모듈별 소프트웨어 버전정보"),
        Row(
          children: [
            Expanded(child: Consumer(builder: (context, ref, _) {
              final amDeviceInfo = ref.watch(jetsonDeviceInfoProvider);
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        Map<String, dynamic> json = {"key": "summary"};
                        try {
                          // Map<String, dynamic> _result =
                          // await jetsonDeviceInfoService?.call(json);
                          // print(_result['value']);
                          // try {
                          //   var deviceInfo =
                          //   JetsonDeviceInfo.fromJson(jsonDecode(_result['value']));
                          //   ref.read(jetsonDeviceInfoProvider.notifier).state = deviceInfo;
                          //   print(deviceInfo.jetsonSerialNumber);
                          // } catch (e, s) {
                          //   print(e.toString());
                          // }
                        } catch (e, s) {
                          print(e.toString());
                        }
                      },
                      child: const Text("AM 정보확인"),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text("jetson_serial_number: ${amDeviceInfo?.jetsonSerialNumber ?? ""}"),
                    Text("jetson_board: ${amDeviceInfo?.jetsonBoard ?? ""}"),
                    Text("jetson_codename: ${amDeviceInfo?.jetsonCodename ?? ""}"),
                    Text("jetson_cuda: ${amDeviceInfo?.jetsonCuda ?? ""}"),
                    Text("jetson_cudnn: ${amDeviceInfo?.jetsonCudnn ?? ""}"),
                    Text("jetson_l4t: ${amDeviceInfo?.jetsonL4t ?? ""}"),
                    Text("jetson_l4t_release: ${amDeviceInfo?.jetsonL4tRelease ?? ""}"),
                    Text("jetson_l4t_revision: ${amDeviceInfo?.jetsonL4tRevision ?? ""}"),
                    Text("jetson_machine: ${amDeviceInfo?.jetsonMachine ?? ""}"),
                    Text("jetson_opencv: ${amDeviceInfo?.jetsonOpencv ?? ""}"),
                    Text("jetson_soc: ${amDeviceInfo?.jetsonSoc ?? ""}"),
                    Text("jetson_tensorrt: ${amDeviceInfo?.jetsonTensorrt ?? ""}"),
                    Text("jetson_type: ${amDeviceInfo?.jetsonType ?? ""}"),
                    Text("jetson_vpi: ${amDeviceInfo?.jetsonVpi ?? ""}"),
                    Text("jetson_vulkan_info: ${amDeviceInfo?.jetsonVulkanInfo ?? ""}"),
                  ],
                ),
              );
            })),
            Expanded(child: Container()),
            Expanded(child: Container()),
          ],
        )
      ],
    );
  }
}
