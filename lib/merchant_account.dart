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

class MerchantAccount extends StatefulWidget {
  final List<Merchant> merchant;
  final String id;
  final String username;
  final String company;
  final String password;
  final String address;
  final String post;
  final String email;
  final String aBNnumber;
  final String aBNstate;
  final String permision;
  final String createTime;

  const MerchantAccount({
    Key? key,
    required this.username,
    required this.merchant,
    required this.password,
    required this.id,
    required this.company,
    required this.address,
    required this.post,
    required this.email,
    required this.aBNnumber,
    required this.aBNstate,
    required this.permision,
    required this.createTime,
  }) : super(key: key);

  @override
  State<MerchantAccount> createState() => _MerchantAccountState();
}

class _MerchantAccountState extends State<MerchantAccount> {
  final usernameText = TextEditingController();
  final compnayText = TextEditingController();
  final passwordText = TextEditingController();
  final confirmText = TextEditingController();
  final addressText = TextEditingController();
  final postText = TextEditingController();
  final emailText = TextEditingController();
  final abnNumberText = TextEditingController();
  final abnStateText = TextEditingController();
  final permissionText = TextEditingController();
  final createTimeText = TextEditingController();

  @override
  void initState() {
    super.initState();
    usernameText.text = widget.username;
    compnayText.text = widget.company.toString();
    passwordText.text = confirmText.text = widget.password;
    addressText.text = widget.address.toString();
    postText.text = widget.post.toString();
    emailText.text = widget.email;
    abnNumberText.text = widget.aBNnumber.toString();
    abnStateText.text = widget.aBNstate.toString();
    permissionText.text = widget.permision.toString();
    createTimeText.text = widget.createTime.toString();
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
              accountValue(context, "username"),
              accountValue(context, "company"),
              accountValue(context, "password"),
              accountValue(context, "confirm"),
              accountValue(context, "address"),
              accountValue(context, "post"),
              accountValue(context, "email"),
              accountValue(context, "abnNumber"),
              accountValue(context, "abnState"),
              accountValue(context, "permission"),
              accountValue(context, "createTime"),
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
      ),
    );
  }

  accountValue(BuildContext context, String s) {
    var control;
    var limit = 10;
    var inputType = TextInputType.text;
    var readed = false;

    if (s == "username") {
      control = usernameText;
    } else if (s == "company") {
      limit = 50;
      control = compnayText;
    } else if (s == "password") {
      control = passwordText;
    } else if (s == "confirm") {
      control = confirmText;
    } else if (s == "address") {
      control = addressText;
    } else if (s == "post") {
      control = postText;
      inputType = TextInputType.number;
    } else if (s == "email") {
      limit = 30;
      control = emailText;
    } else if (s == "abnNumber") {
      control = abnNumberText;
      limit = 6;
      inputType = TextInputType.number;
    } else if (s == "abnState") {
      control = abnStateText;
    } else if (s == "permission") {
      readed = true;
      control = permissionText;
    } else if (s == "createTime") {
      readed = true;
      control = createTimeText;
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
                  height: 60,
                  padding: const EdgeInsets.only(left: 20),
                  child: readed == false ? TextField(
                    keyboardType: inputType,
                    maxLength: limit,
                    controller: control,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),                  //onChanged: (text) => {updateStaff()},
                  ) : TextField(
                    readOnly: true,
                    controller: control,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),  
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
      backgroundColor: greyColor,
      title: const Text('Merhcant Account',
          style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
