//sucess Staff age
import 'package:data_connected/control/controled.dart';
import 'package:data_connected/merchant_account.dart';
import 'package:data_connected/models/Merchant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants.dart';
import 'staff_details.dart';
import 'util.dart';

class StaffView extends StatefulWidget {
  const StaffView({Key? key}) : super(key: key);

  @override
  State<StaffView> createState() => _StaffViewState();
}

class _StaffViewState extends State<StaffView> {
  var totalStaff = 0;
  var permission = "0";
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<Controled, StaffState>(builder: (context, state) {
          if (state is ListStaffs) {
            totalStaff = state.staff.length;
            return state.staff.isEmpty
                ? emptyStaffView()
                : staffListView(state.staff);
          } else if (state is ListFailure) {
            return exceptionView(state.exception);
          } else {
            return const CircularProgressIndicator();
          }
        }),
      ),
    );
  }

  showNew(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.9,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
                    child: Text(
                      "ADD NEW STAFF",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.grey[600]),
                    ),
                  ),
                  inputValues(context, "username", setState),
                  inputValues(context, "password", setState),
                  inputValues(context, "confirm", setState),
                  inputValues(context, "permission", setState),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "0: Hight permissions are used to adding/editing/deleting data. \n 1: Low permissions are used to adding/editing/invite of client.",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  saveStaff(),
                ],
              ),
            );
          },
        );
      },
    );
  }

  textStyles(String s) {
    return Text(s.toUpperCase(),
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.normal,
        ));
  }

  Widget exceptionView(Exception exception) {
    return Center(child: Text(exception.toString()));
  }

  Widget emptyStaffView() {
    return const Center(
      child: Text('No any staff yet'),
    );
  }

  Widget staffListView(List<Merchant> m) {
    var item = m[0];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
          child: Row(
            children: [
              const Text(
                "Merchant Dashboard",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              Spacer(),
              const Text(
                "1",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              const Icon(
                Icons.notifications,
                color: Colors.yellow,
              ),
              ClipOval(
                child: Material(
                  color: greyColor, // Button color
                  child: InkWell(
                    splashColor: Colors.red, // Splash color
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                            value: BlocProvider.of<Controled>(context),
                            child: MerchantAccount(
                              merchant: m,
                              id: item.id,
                              username: item.username.toString(),
                              company: item.companyname.toString(),
                              password: item.password.toString(),
                              address: item.address.toString(),
                              post: item.postalAddress.toString(),
                              email: item.email.toString(),
                              aBNnumber: item.ABNnumber.toString(),
                              aBNstate: item.ABNstatus.toString(),
                              permision: item.permission.toString(),
                              createTime: item.startTime.toString(),
                            ),
                          ),
                        ),
                      );
                    },
                    child: const SizedBox(
                        width: 56, height: 56, child: Icon(Icons.menu)),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30), color: greyColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Totoal Staffs",
                      style: TextStyle(color: yellowColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "$totalStaff",
                      style: const TextStyle(
                        color: yellowColor,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                width: MediaQuery.of(context).size.width * 0.60,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: bluishGreyColor),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(15, 8, 10, 8),
                  child: Text(
                    "Note: Hight permissions are used to adding/editing/deleting data. Low permissions are used to adding/editing/invite of client.",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Staff List",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                ElevatedButton(
                  onPressed: () {
                    showNew(context);
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(orangeColor),
                      textStyle: MaterialStateProperty.all(
                          const TextStyle(fontSize: 16))),
                  child: const Text('+  Add New Staff'),
                ),
              ],
            )),
        Padding(
          padding: const EdgeInsets.all(0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: greyColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textStyles("No."),
                textStyles("Username"),
                textStyles("Start time"),
                textStyles("Permission"),
                textStyles("Management"),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 350,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: m.length,
              itemBuilder: (context, index) {
                final item = m[index];
                const edit = "EDIT/DELET";
                var per = "";
                if (item.permission == "0") {
                  per = "HIGHT";
                } else {
                  per = " LOW ";
                }
                var user = item.username!.characters.take(5);
                return Card(
                  child: ListTile(
                    title: Text(
                      "${index + 1}          $user        ${item.startTime}    $per    $edit ",
                      softWrap: false,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                            value: BlocProvider.of<Controled>(context),
                            child: StaffDetail(
                              merchant: m,
                              id: item.id,
                              permission: item.permission.toString(),
                              username: item.username.toString(),
                              password: item.password.toString(),
                              indext: index,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
        ),
      ],
    );
  }

  checkText() {
    String t1, t2, t3;
    t1 = usernameTextController.text;
    t2 = passwordTextController.text;
    t3 = confirmTextController.text;

    if (t1.isEmpty || t2.isEmpty || t3.isEmpty) {
      showAlert(context, "empty");
    } else {
      if (t2 == t3) {
        showAlert(context, "added");
        BlocProvider.of<Controled>(context).createStaff(
            usernameTextController.text,
            passwordTextController.text,
            permission);
        usernameTextController.text =
            passwordTextController.text = confirmTextController.text = '';
        Navigator.of(context).pop();
      } else {
        showAlert(context, "uncorrect");
      }
    }
  }

  ElevatedButton saveStaff() {
    return ElevatedButton(
      onPressed: checkText,
      style: ElevatedButton.styleFrom(
        primary: yellowColor,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        padding: const EdgeInsets.fromLTRB(150, 12, 150, 12),
      ),
      child: Text("save".toUpperCase(),
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
          )),
    );
  }

  inputValues(BuildContext context, String s, StateSetter setState) {
    var control;
    var inputType;
    debug_print("string: $s");
    if (s == "username") {
      inputType = TextInputType.text;
      control = usernameTextController;
    } else if (s == "password") {
      inputType = TextInputType.number;
      control = passwordTextController;
    } else if (s == "confirm") {
      inputType = TextInputType.number;
      control = confirmTextController;
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 10, 40, 0),
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
                  ? drop(setState)
                  : Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        height: 50,
                        padding: const EdgeInsets.only(left: 20),
                        child: TextField(
                          keyboardType: inputType,
                          maxLength: 10,
                          controller: control,
                          textAlign: TextAlign.start,  
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            counterText: '',
                            hintText: 'Enter Here',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
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

  drop(StateSetter setState) {
    return DropdownButton<String>(
      onChanged: (String? newValue) {
        setState(() {
          permission = newValue.toString();
        });
        //debug_print("*pp* $permission");
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
    if (s == "empty") {
      str = "Text Field is empty, please fill all data.";
    } else if (s == "uncorrect") {
      str = "Confirmed password is not same with passord.";
    } else if (s == "added") {
      str = "A new staff member has sucessfully added.";
    }

    return AlertDialog(
      title: const Text("Note:"),
      content: Text(str),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
