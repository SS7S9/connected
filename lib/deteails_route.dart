import 'package:data_connected/control/controled.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsRoute extends StatefulWidget {
  const DetailsRoute({Key? key}) : super(key: key);

  @override
  State<DetailsRoute> createState() => _DetailsRouteState();
}

class _DetailsRouteState extends State<DetailsRoute> {
  var u = "a";
  var p = "a";
  var per = "1";
  @override
  Widget build(BuildContext context) {
    var statusBloc = BlocProvider.of<Controled>(context)
      ..createStaff(u,p, per);

    return Scaffold();
  }
}
