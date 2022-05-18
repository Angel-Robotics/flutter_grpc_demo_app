class TegrastatsMsg {
  double? usedRamMb;
  double? totalRamMb;
  double? numberOfFreeRamBlocks;
  double? sizeOfFreeRamBlocksMb;
  double? usedSwapMb;
  double? totalSwapMb;
  double? cachedSwapMb;
  double? cpuFrequencyMhz;
  String? cpu0Load;
  String? cpu1Load;
  String? cpu2Load;
  String? cpu3Load;
  String? cpu4Load;
  String? cpu5Load;
  double? apeFrequencyMhz;
  double? usedGr3d;
  double? gr3dFrequencyMhz;
  double? usedEmc;
  double? auxTemperatureC;
  double? cpuTemperatureC;
  double? thermalTemperatureC;
  double? aoTemperatureC;
  double? gpuTemperatureC;
  double? iwlwifiTemperatureC;
  double? pmicTemperatureC;
  double? currentInPowerConsumptionMw;
  double? averageInPowerConsumptionMw;
  double? currentCpuGpuCvPowerConsumptionMw;
  double? averageCpuGpuCvPowerConsumptionMw;
  double? currentSocPowerConsumptionMw;
  double? averageSocPowerConsumptionMw;

  TegrastatsMsg(
      {this.usedRamMb,
      this.totalRamMb,
      this.numberOfFreeRamBlocks,
      this.sizeOfFreeRamBlocksMb,
      this.usedSwapMb,
      this.totalSwapMb,
      this.cachedSwapMb,
      this.cpuFrequencyMhz,
      this.cpu0Load,
      this.cpu1Load,
      this.cpu2Load,
      this.cpu3Load,
      this.cpu4Load,
      this.cpu5Load,
      this.apeFrequencyMhz,
      this.usedGr3d,
      this.gr3dFrequencyMhz,
      this.usedEmc,
      this.auxTemperatureC,
      this.cpuTemperatureC,
      this.thermalTemperatureC,
      this.aoTemperatureC,
      this.gpuTemperatureC,
      this.iwlwifiTemperatureC,
      this.pmicTemperatureC,
      this.currentInPowerConsumptionMw,
      this.averageInPowerConsumptionMw,
      this.currentCpuGpuCvPowerConsumptionMw,
      this.averageCpuGpuCvPowerConsumptionMw,
      this.currentSocPowerConsumptionMw,
      this.averageSocPowerConsumptionMw});

  TegrastatsMsg.fromJson(Map<String, dynamic> json) {
    usedRamMb = json['used_ram_(mb)'];
    totalRamMb = json['total_ram_(mb)'];
    numberOfFreeRamBlocks = json['number_of_free_ram_blocks'];
    sizeOfFreeRamBlocksMb = json['size_of_free_ram_blocks_(mb)'];
    usedSwapMb = json['used_swap_(mb)'];
    totalSwapMb = json['total_swap_(mb)'];
    cachedSwapMb = json['cached_swap_(mb)'];
    cpuFrequencyMhz = json['cpu_frequency_(mhz)'];
    cpu0Load = json['cpu_0_load_(%)'];
    cpu1Load = json['cpu_1_load_(%)'];
    cpu2Load = json['cpu_2_load_(%)'];
    cpu3Load = json['cpu_3_load_(%)'];
    cpu4Load = json['cpu_4_load_(%)'];
    cpu5Load = json['cpu_5_load_(%)'];
    apeFrequencyMhz = json['ape_frequency_(mhz)'];
    usedGr3d = json['used_gr3d_(%)'];
    gr3dFrequencyMhz = json['gr3d_frequency_(mhz)'];
    usedEmc = json['used_emc_(%)'];
    auxTemperatureC = json['aux_temperature_(c)'];
    cpuTemperatureC = json['cpu_temperature_(c)'];
    thermalTemperatureC = json['thermal_temperature_(c)'];
    aoTemperatureC = json['ao_temperature_(c)'];
    gpuTemperatureC = json['gpu_temperature_(c)'];
    iwlwifiTemperatureC = json['iwlwifi_temperature_(c)'];
    pmicTemperatureC = json['pmic_temperature_(c)'];
    currentInPowerConsumptionMw = json['current_in_power_consumption_(mw)'];
    averageInPowerConsumptionMw = json['average_in_power_consumption_(mw)'];
    currentCpuGpuCvPowerConsumptionMw = json['current_cpu_gpu_cv_power_consumption_(mw)'];
    averageCpuGpuCvPowerConsumptionMw = json['average_cpu_gpu_cv_power_consumption_(mw)'];
    currentSocPowerConsumptionMw = json['current_soc_power_consumption_(mw)'];
    averageSocPowerConsumptionMw = json['average_soc_power_consumption_(mw)'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['used_ram_(mb)'] = usedRamMb;
    data['total_ram_(mb)'] = totalRamMb;
    data['number_of_free_ram_blocks'] = numberOfFreeRamBlocks;
    data['size_of_free_ram_blocks_(mb)'] = sizeOfFreeRamBlocksMb;
    data['used_swap_(mb)'] = usedSwapMb;
    data['total_swap_(mb)'] = totalSwapMb;
    data['cached_swap_(mb)'] = cachedSwapMb;
    data['cpu_frequency_(mhz)'] = cpuFrequencyMhz;
    data['cpu_0_load_(%)'] = cpu0Load;
    data['cpu_1_load_(%)'] = cpu1Load;
    data['cpu_2_load_(%)'] = cpu2Load;
    data['cpu_3_load_(%)'] = cpu3Load;
    data['cpu_4_load_(%)'] = cpu4Load;
    data['cpu_5_load_(%)'] = cpu5Load;
    data['ape_frequency_(mhz)'] = apeFrequencyMhz;
    data['used_gr3d_(%)'] = usedGr3d;
    data['gr3d_frequency_(mhz)'] = gr3dFrequencyMhz;
    data['used_emc_(%)'] = usedEmc;
    data['aux_temperature_(c)'] = auxTemperatureC;
    data['cpu_temperature_(c)'] = cpuTemperatureC;
    data['thermal_temperature_(c)'] = thermalTemperatureC;
    data['ao_temperature_(c)'] = aoTemperatureC;
    data['gpu_temperature_(c)'] = gpuTemperatureC;
    data['iwlwifi_temperature_(c)'] = iwlwifiTemperatureC;
    data['pmic_temperature_(c)'] = pmicTemperatureC;
    data['current_in_power_consumption_(mw)'] = currentInPowerConsumptionMw;
    data['average_in_power_consumption_(mw)'] = averageInPowerConsumptionMw;
    data['current_cpu_gpu_cv_power_consumption_(mw)'] = currentCpuGpuCvPowerConsumptionMw;
    data['average_cpu_gpu_cv_power_consumption_(mw)'] = averageCpuGpuCvPowerConsumptionMw;
    data['current_soc_power_consumption_(mw)'] = currentSocPowerConsumptionMw;
    data['average_soc_power_consumption_(mw)'] = averageSocPowerConsumptionMw;
    return data;
  }
}
