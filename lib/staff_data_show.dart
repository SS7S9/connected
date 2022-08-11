import 'package:data_connected/client_account.dart';
import 'package:data_connected/control/controled.dart';
import 'package:data_connected/staff_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StaffDataShow extends StatefulWidget {
  const StaffDataShow({Key? key}) : super(key: key);

  @override
  State<StaffDataShow> createState() => _StaffDataShowState();
}

class _StaffDataShowState extends State<StaffDataShow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocProvider(
          create: (context) => (Controled())
            ..getStaffs()
            ..observeStaff(),
          child: StaffView(),
        ),
      ),
    );
  }
}
