//tested sucess update data

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'control/controled.dart';
import 'models/Merchant.dart';
import 'util.dart';

class Updated extends StatefulWidget {
  final List<Merchant> merchant;
  final String id;
  final String username;
  final int index;
  final mer;

  const Updated(
      {Key? key,
      required this.merchant,
      required this.id,
      required this.username,
      required this.mer,
      required this.index})
      : super(key: key);

  @override
  State<Updated> createState() => _UpdatedState();
}

class _UpdatedState extends State<Updated> {
  final usernameTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    debug_print("details : ${widget.id.toString()}");
    debug_print("details : ${widget.username.toString()}");
    debug_print("details***** : ${widget.merchant.toString()}");

    usernameTextController.text = widget.username.toString();
  }

  @override
  Widget build(BuildContext context) {
    var statusBloc = BlocProvider.of<Controled>(context);

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: usernameTextController,
              onChanged: (text) => {updateStaff()},
            ),
            ElevatedButton(
                onPressed: () {
                  // statusBloc.updateNow(
                  //     widget.merchant[widget.index], usernameTextController.text);
                },
                child: const Text("Update")),
          ],
        ),
      ),
    );
  }

  updateStaff() {}
}
