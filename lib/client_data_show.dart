import 'package:data_connected/client_account.dart';
import 'package:data_connected/control/client_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientDataShow extends StatefulWidget {
  const ClientDataShow({Key? key}) : super(key: key);

  @override
  State<ClientDataShow> createState() => _ClientDataShowState();
}

class _ClientDataShowState extends State<ClientDataShow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocProvider(
          create: (context) => (ClientControl())..getStaffs(),
          child: ClientAccount(),
        ),
      ),
    );
  }
}
