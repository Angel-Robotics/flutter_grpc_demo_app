

import 'package:flutter_grpc_demo_app/src/model/tegrastats_msg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tegrastatsProvider = StateProvider<TegrastatsMsg>((ref) => TegrastatsMsg());