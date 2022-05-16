


import 'package:flutter_grpc_demo_app/src/model/encoder_raw.dart';
import 'package:flutter_grpc_demo_app/src/model/joint_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final encoderRawProvider = StateProvider<EncoderRaw>((ref) => EncoderRaw(layout: MsgDimensionBlock([]),));
final encoderRawDataProvider = StateProvider<String>((ref) => "");
final jointStateRawProvider = StateProvider<JointState>((ref) => JointState());