import 'package:data_connected/control/client_control.dart';
import 'package:data_connected/models/ModelProvider.dart';
import 'package:data_connected/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants.dart';

class ClientAccount extends StatefulWidget {
  const ClientAccount({Key? key}) : super(key: key);

  @override
  State<ClientAccount> createState() => _ClientAccountState();
}

class _ClientAccountState extends State<ClientAccount> {
  final usernameText = TextEditingController();
  final firstnameText = TextEditingController();
  final lastnameText = TextEditingController();
  final passwordText = TextEditingController();
  final confirmText = TextEditingController();
  final mobileText = TextEditingController();
  final emailText = TextEditingController();
  final noticeText = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navBar(),
      body: BlocBuilder<ClientControl, ClientState>(builder: (context, state) {
        if (state is ListClient) {
          return selfAccount(state.acount);
        } else {
          return const CircularProgressIndicator();
        }
      }),
    );
  }

  selfAccount(List<Client> c) {
    var client = c[0];
    usernameText.text = client.username;
    firstnameText.text = client.firstname.toString();
    lastnameText.text = client.lastname.toString();
    passwordText.text = confirmText.text = client.passowrd.toString();
    mobileText.text = client.mobile.toString();
    emailText.text = client.email.toString();
    noticeText.text = client.notice.toString();

    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 50, 0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            accountValue(context, "username"),
            accountValue(context, "firstname"),
            accountValue(context, "lastname"),
            accountValue(context, "password"),
            accountValue(context, "confirm"),
            accountValue(context, "mobile"),
            accountValue(context, "email"),
            accountValue(context, "notice"),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 50),
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: yellowColor,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          padding: const EdgeInsets.all(15),
                        ),
                        onPressed: () async {},
                        child: const Text("EDIT",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  accountValue(BuildContext context, String s) {
    var control;
    var limit = 10;
    var inputType = TextInputType.text;

    if (s == "username") {
      control = usernameText;
    } else if (s == "firstname") {
      control = firstnameText;
    } else if (s == "lastname") {
      control = lastnameText;
    } else if (s == "password") {
      control = passwordText;
    } else if (s == "confirm") {
      control = confirmText;
    } else if (s == "mobile") {
      control = mobileText;
      inputType = TextInputType.number;
    } else if (s == "email") {
      limit = 30;
      control = emailText;
      inputType = TextInputType.emailAddress;
    } else if (s == "notice") {
      control = noticeText;
      limit = 50;
    }

    return Padding(
      padding: const EdgeInsets.only(top: 20),
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
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  height: 50,
                  padding: const EdgeInsets.only(left: 20),
                  child: TextField(
                    keyboardType: inputType,
                    maxLength: limit,
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

  navBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: yellowColor,
      title: const Text('Client Account',
          style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
