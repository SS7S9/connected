import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:data_connected/control/controled.dart';
import 'package:data_connected/models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'constants.dart';
import 'util.dart';

class AddStaff extends StatefulWidget {
  const AddStaff({Key? key}) : super(key: key);

  @override
  State<AddStaff> createState() => _AddStaffState();
}

class _AddStaffState extends State<AddStaff> {
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmTextController = TextEditingController();
  final permissionTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navBar(),
      floatingActionButton: addNewer(),
      body: Center(
        child: BlocProvider(
          create: (_) => Controled(),
          child: Builder(builder: (context) {
            return ElevatedButton(
            onPressed: () {
              BlocProvider.of<Controled>(context)
                  .createStaff(
                    usernameTextController.text,
                    passwordTextController.text,
                    permissionTextController.text);
              usernameTextController.text = '';
              Navigator.of(context).pop();
            },
            child: Text('Save'));
          }),
        ),
      ),
    );
  }

  Widget addNewStaff() {
    return Column(
      children: [
        TextField(
          controller: usernameTextController,
          decoration: const InputDecoration(hintText: 'Enter new username'),
        ),
        ElevatedButton(
            onPressed: () {
              BlocProvider.of<Controled>(context)
                  .createStaff(
                    usernameTextController.text,
                    passwordTextController.text,
                    permissionTextController.text);
              usernameTextController.text = '';
              Navigator.of(context).pop();
            },
            child: Text('Save'))
      ],
    );
  }

  Widget addNewer() {
    return FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => addNewStaff());
        });
  }

  Widget emptyListView() {
    return const Center(
      child: Text('No data'),
    );
  }

  //   return Scaffold(
  //     appBar: navBar(),
  //     body: Padding(
  //       padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
  //       child: SingleChildScrollView(
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             inputValues(context, "username"),
  //             inputValues(context, "password"),
  //             inputValues(context, "confirm"),
  //             inputValues(context, "permission"),
  //             const Padding(
  //               padding: EdgeInsets.fromLTRB(60, 10, 0, 0),
  //               child: Text(
  //                 "1: Hight permissions are used to adding/editing/deleting data. \n 0: Low permissions are used to adding/editing/invite of client.",
  //                 style: TextStyle(
  //                   fontSize: 12,
  //                   color: Colors.grey,
  //                 ),
  //               ),
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.only(top: 15.0),
  //               child: SizedBox(
  //                 width: double.infinity,
  //                 child: ElevatedButton(
  //                   style: ElevatedButton.styleFrom(
  //                     primary: yellowColor,
  //                     elevation: 5,
  //                     shape: RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.circular(25.0),
  //                     ),
  //                     padding: const EdgeInsets.all(15),
  //                   ),
  //                   onPressed: addNewer,
  //                   child: const Text("SAVE",
  //                       style: TextStyle(
  //                         fontSize: 14,
  //                         color: Colors.white,
  //                       ))),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // inputValues(BuildContext context, String s) {
  //   var control;
  //   debug_print("string: $s");
  //   if (s == "username") {
  //     control = usernameTextController;
  //   } else if (s == "password") {
  //     control = passwordTextController;
  //   } else if (s == "permission") {
  //     control = permissionTextController;
  //   }
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 30),
  //     child: Align(
  //       alignment: Alignment.centerRight,
  //       child: SizedBox(
  //         width: MediaQuery.of(context).size.width,
  //         child: Row(
  //           children: [
  //             textStyles(s),
  //             const SizedBox(
  //               width: 10,
  //             ),
  //             Expanded(
  //               child: Container(
  //                 decoration: BoxDecoration(
  //                   color: Colors.grey[200],
  //                   borderRadius: BorderRadius.circular(25),
  //                 ),
  //                 height: 50,
  //                 padding: const EdgeInsets.only(left: 20),
  //                 child: TextField(
  //                   controller: control,
  //                   textAlign: TextAlign.start,
  //                   decoration: const InputDecoration(
  //                     hintText: 'Enter new information',
  //                     border: InputBorder.none,
  //                     hintStyle: TextStyle(
  //                       color: Colors.grey,
  //                       fontSize: 13,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  navBar() {
    return AppBar(
      backgroundColor: Colors.white30,
      title: const Text('Add A New Staff'),
    );
  }

  // textStyles(String s) {
  //   return Text(
  //     s.toUpperCase(),
  //     style: const TextStyle(
  //       fontSize: 12,
  //     ),
  //   );
  // }

  // addNewer() async {
  //   String note;
  //   final username = usernameTextController.text;
  //   final password = passwordTextController.text;
  //   final permission = permissionTextController.text;
  //   final current = DateFormat("yyyy-MM-dd").format(DateTime.now()).toString();

  //   final added = Merchant(
  //     username: username,
  //     password: password,
  //     permission: permission,
  //     startTime: current,
  //   );

  //   final request = ModelMutations.create(added);
  //   final response = await Amplify.API.mutate(request: request).response;

  //   final addnew = response.data;
  //   if (addnew == null) {
  //     note = 'errors: ${response.errors}';
  //   } else {
  //     note = '${addnew.username} has sucessfully added!';
  //     usernameTextController.clear();
  //     passwordTextController.clear();
  //     confirmTextController.clear();
  //     permissionTextController.clear();
  //   }
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         content: Text(note),
  //       );
  //     },
  //   );
  // }
}
