


import 'package:flutter_grpc_demo_app/src/model/encoder_raw.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final encoderRawProvider = StateProvider<EncoderRaw>((ref) => EncoderRaw(layout: MsgDimensionBlock([]),));