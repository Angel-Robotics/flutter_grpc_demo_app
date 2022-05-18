

import 'package:flutter/material.dart';
import 'package:flutter_grpc_demo_app/src/provider/device_info/device_temperature_provider.dart';
import 'package:flutter_grpc_demo_app/src/provider/device_info/tegrastats_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeviceTegrastatsWidget extends ConsumerWidget {
  const DeviceTegrastatsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final tegrastats = ref.watch(tegrastatsProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("usedRam(Mb): ${tegrastats.usedRamMb}"),
                  Text("totalRam(Mb): ${tegrastats.totalRamMb}"),
                  Text("cpuFrequency(Mhz): ${tegrastats.cpuFrequencyMhz}"),
                  Text("cpu_0_Load(%): ${tegrastats.cpu0Load}"),
                  Text("cpu_1_Load(%): ${tegrastats.cpu1Load}"),
                  Text("cpu_2_Load(%): ${tegrastats.cpu2Load}"),
                  Text("cpu_3_Load(%): ${tegrastats.cpu3Load}"),
                  Text("cpu_4_Load(%): ${tegrastats.cpu4Load}"),
                  Text("cpu_5_Load(%): ${tegrastats.cpu5Load}")
                ],
              ),
              const SizedBox(width: 8,),
              VerticalDivider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("aux_temperature: ${tegrastats.auxTemperatureC}"),
                  Text("cpu_temperature: ${tegrastats.cpuTemperatureC}"),
                  Text("thermal_temperature: ${tegrastats.thermalTemperatureC}"),
                  Text("ao_temperature: ${tegrastats.aoTemperatureC}"),
                  Text("gpu_temperature: ${tegrastats.gpuTemperatureC}"),
                  Text("iwlwifi_temperature: ${tegrastats.iwlwifiTemperatureC}"),
                  Text("pmic_temperature: ${tegrastats.pmicTemperatureC}"),
                ],
              ),
            ],
          ),
        ),
        const Divider(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("current_in_power_consumption(mA): ${tegrastats.currentInPowerConsumptionMw}"),
            Text("average_in_power_consumption(mA): ${tegrastats.averageInPowerConsumptionMw}"),
            Text("current_cpu_gpu_cv_power_consumption(mA): ${tegrastats.currentCpuGpuCvPowerConsumptionMw}"),
            Text("average_cpu_gpu_cv_power_consumption(mA): ${tegrastats.averageCpuGpuCvPowerConsumptionMw}"),
            Text("current_soc_power_consumption(mA): ${tegrastats.currentSocPowerConsumptionMw}"),
            Text("average_soc_power_consumption(mA): ${tegrastats.averageSocPowerConsumptionMw}"),
          ],
        ),
      ],
    );
  }
}
