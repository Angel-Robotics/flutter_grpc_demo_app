class JetsonDeviceInfo {
  String? jetsonBoard;
  String? jetsonBoardids;
  String? jetsonChipId;
  String? jetsonCodename;
  String? jetsonCuda;
  String? jetsonCudaArchBin;
  String? jetsonCudnn;
  String? jetsonJetpack;
  String? jetsonL4t;
  String? jetsonL4tRelease;
  String? jetsonL4tRevision;
  String? jetsonMachine;
  String? jetsonModule;
  String? jetsonOpencv;
  String? jetsonOpencvCuda;
  String? jetsonSerialNumber;
  String? jetsonSoc;
  String? jetsonTensorrt;
  String? jetsonType;
  String? jetsonVisionworks;
  String? jetsonVpi;
  String? jetsonVulkanInfo;

  JetsonDeviceInfo(
      {this.jetsonBoard,
        this.jetsonBoardids,
        this.jetsonChipId,
        this.jetsonCodename,
        this.jetsonCuda,
        this.jetsonCudaArchBin,
        this.jetsonCudnn,
        this.jetsonJetpack,
        this.jetsonL4t,
        this.jetsonL4tRelease,
        this.jetsonL4tRevision,
        this.jetsonMachine,
        this.jetsonModule,
        this.jetsonOpencv,
        this.jetsonOpencvCuda,
        this.jetsonSerialNumber,
        this.jetsonSoc,
        this.jetsonTensorrt,
        this.jetsonType,
        this.jetsonVisionworks,
        this.jetsonVpi,
        this.jetsonVulkanInfo});

  JetsonDeviceInfo.fromJson(Map<String, dynamic> json) {
    jetsonBoard = json['jetson_board'];
    jetsonBoardids = json['jetson_boardids'];
    jetsonChipId = json['jetson_chip_id'];
    jetsonCodename = json['jetson_codename'];
    jetsonCuda = json['jetson_cuda'];
    jetsonCudaArchBin = json['jetson_cuda_arch_bin'];
    jetsonCudnn = json['jetson_cudnn'];
    jetsonJetpack = json['jetson_jetpack'];
    jetsonL4t = json['jetson_l4t'];
    jetsonL4tRelease = json['jetson_l4t_release'];
    jetsonL4tRevision = json['jetson_l4t_revision'];
    jetsonMachine = json['jetson_machine'];
    jetsonModule = json['jetson_module'];
    jetsonOpencv = json['jetson_opencv'];
    jetsonOpencvCuda = json['jetson_opencv_cuda'];
    jetsonSerialNumber = json['jetson_serial_number'];
    jetsonSoc = json['jetson_soc'];
    jetsonTensorrt = json['jetson_tensorrt'];
    jetsonType = json['jetson_type'];
    jetsonVisionworks = json['jetson_visionworks'];
    jetsonVpi = json['jetson_vpi'];
    jetsonVulkanInfo = json['jetson_vulkan_info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jetson_board'] = this.jetsonBoard;
    data['jetson_boardids'] = this.jetsonBoardids;
    data['jetson_chip_id'] = this.jetsonChipId;
    data['jetson_codename'] = this.jetsonCodename;
    data['jetson_cuda'] = this.jetsonCuda;
    data['jetson_cuda_arch_bin'] = this.jetsonCudaArchBin;
    data['jetson_cudnn'] = this.jetsonCudnn;
    data['jetson_jetpack'] = this.jetsonJetpack;
    data['jetson_l4t'] = this.jetsonL4t;
    data['jetson_l4t_release'] = this.jetsonL4tRelease;
    data['jetson_l4t_revision'] = this.jetsonL4tRevision;
    data['jetson_machine'] = this.jetsonMachine;
    data['jetson_module'] = this.jetsonModule;
    data['jetson_opencv'] = this.jetsonOpencv;
    data['jetson_opencv_cuda'] = this.jetsonOpencvCuda;
    data['jetson_serial_number'] = this.jetsonSerialNumber;
    data['jetson_soc'] = this.jetsonSoc;
    data['jetson_tensorrt'] = this.jetsonTensorrt;
    data['jetson_type'] = this.jetsonType;
    data['jetson_visionworks'] = this.jetsonVisionworks;
    data['jetson_vpi'] = this.jetsonVpi;
    data['jetson_vulkan_info'] = this.jetsonVulkanInfo;
    return data;
  }
}
