import 'package:flutter/material.dart';
import 'package:flutter_grpc_demo_app/src/provider/mode_setting_provider.dart';
import 'package:flutter_grpc_demo_app/src/ui/component/mode_setting_option_widget.dart';
import 'package:flutter_grpc_demo_app/src/ui/component/mode_setting_torque_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ModeSettingWidget extends ConsumerWidget {
  const ModeSettingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            labelColor: Colors.black,
            tabs: [
              Tab(
                text: "보조력",
              ),
              Tab(
                text: "일반",
              ),
            ],
          ),
          const SizedBox(height: 15,),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ModeSettingTorqueWidget(),
                ModeSettingOptionWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
