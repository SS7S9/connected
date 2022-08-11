// sucess edit and delete
import 'package:data_connected/models/Merchant.dart';
import 'package:data_connected/staff_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:data_connected/util.dart';

import 'constants.dart';
import 'control/controled.dart';
import 'staff_data_show.dart';

class StaffDetail extends StatefulWidget {
  final List<Merchant> merchant;
  final String id;
  final String permission;
  final String username;
  final String password;
  final int indext;

  const StaffDetail(
      {Key? key,
      required this.permission,
      required this.username,
      required this.merchant,
      required this.indext,
      required this.password,
      required this.id})
      : super(key: key);

  @override
  State<StaffDetail> createState() => _StaffDetailState();
}

class _StaffDetailState extends State<StaffDetail> {
  var permission = "";
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    debug_print("details : ${widget.username.toString()}");
    debug_print("details***** : ${widget.merchant[widget.indext].toString()}");

    usernameTextController.text = widget.username.toString();
    passwordTextController.text =
        confirmTextController.text = widget.password.toString();
    permission = widget.permission.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 50, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              inputValues(context, "username"),
              inputValues(context, "password"),
              inputValues(context, "confirm"),
              inputValues(context, "permission"),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Note: '0' is hight permissions wich used to adding/editing/deleting data. '1' is low permissions which used to adding/editing/invite of client.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: btn_edde(context, "delete"),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: btn_edde(context, "edit"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton btn_edde(BuildContext context, String s) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: s == "delete" ? greenColor : yellowColor,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        padding: const EdgeInsets.all(15),
      ),
      onPressed: () async {
        s == "delete"
            ? BlocProvider.of<Controled>(context)
                .deleteNow(widget.merchant[widget.indext], widget.id)
            : BlocProvider.of<Controled>(context).updateNow(
                widget.merchant[widget.indext],
                usernameTextController.text,
                passwordTextController.text,
                permission);

        showAlert(context, s);
      },
      child: Text(s.toUpperCase(),
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
          )),
    );
  }

  navBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white10,
      title: const Text(' Edit A Staff Page',
          style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  showAlert(BuildContext context, String s) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return alertWindow(context, s);
        });
  }

  AlertDialog alertWindow(BuildContext context, String s) {
    var str = "";
    if (s == "delete") {
      str = "The staff has sucessfully deleted.";
    } else if (s == "edit") {
      str = "A new staff member has sucessfully edited.";
    }

    return AlertDialog(
      title: const Text("Note:"),
      content: Text(str),
      actions: <Widget>[
        TextButton(
          onPressed: () => {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const StaffDataShow()))
          },
          child: const Text('OK'),
        ),
      ],
    );
  }

  inputValues(BuildContext context, String s) {
    var control;
    if (s == "username") {
      control = usernameTextController;
    } else if (s == "password") {
      control = passwordTextController;
    } else if (s == "confirm") {
      control = confirmTextController;
    }

    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              textStyles(s),
              const SizedBox(
                width: 10,
              ),
              s == "permission"
                  ? drop()
                  : Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        height: 50,
                        padding: const EdgeInsets.only(left: 20),
                        child: TextField(
                          controller: control,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),  
                          //onChanged: (text) => {updateStaff()},
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  textStyles(String s) {
    return Text(
      s.toUpperCase(),
      style: const TextStyle(
        fontSize: 16,
      ),
    );
  }

  drop() {
    return DropdownButton<String>(
      onChanged: (String? newValue) {
        setState(() {
          permission = newValue.toString();
        });
        debug_print("*pp* $permission");
      },
      value: permission,
      icon: const Icon(Icons.arrow_downward),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      enableFeedback: true,
      items: <String>['1', '0'].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: const TextStyle(fontSize: 16.0),
          ),
        );
      }).toList(),
    );
  }
}
