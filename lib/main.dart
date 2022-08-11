// @dart=2.9
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:data_connected/amplifyconfiguration.dart';
import 'package:data_connected/client_data_show.dart';
import 'package:data_connected/staff_data_show.dart';
import 'package:data_connected/util.dart';
import 'package:flutter/material.dart';
import 'locationpage.dart';
import 'models/ModelProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _amplifyConfigured = false;

  void _configureAmplify() async {

    try {
      await Future.wait([
        Amplify.addPlugin(
            AmplifyDataStore(modelProvider: ModelProvider.instance)),
        Amplify.addPlugin(AmplifyAPI()),
        Amplify.addPlugin(AmplifyAuthCognito())
      ]);
      await Amplify.configure(amplifyconfig);
      setState(() {
        _amplifyConfigured = true;
      });
    } catch (e) {
      debug_print("error: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _MyAppState(),
    );
  }
}

class _MyAppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: Column(children: <Widget>[
          const SizedBox(height: 250),
          ElevatedButton(
            child: const Text('Arrived'),
            onPressed: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Locationpage()))
            },
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            child: const Text('Staff List'),
            onPressed: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StaffDataShow()))
            },
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            child: const Text('Client Account'),
            onPressed: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ClientDataShow()))
            },
          ),
        ]),
      ),
    ));
  }
}
