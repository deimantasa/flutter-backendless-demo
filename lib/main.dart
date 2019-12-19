import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  IDataStore<Map> usersStore = Backendless.data.of('Users');
  String _status = "Watch this";

  @override
  void initState() {
    Backendless.initApp("5DC17E29-5D25-4836-82EA-86161F022E58", "5EC9AADE-0682-48D8-8DF3-43B2949C39FF",
        "382F2144-A9C0-490F-8C42-436BE22A3F57");
    EventHandler<Map> rtHandlers = usersStore.rt();

    rtHandlers.addCreateListener((_) {
      setState(() {
        _status = "Created";
      });
    });

    rtHandlers.addUpdateListener((_) {
      setState(() {
        _status = "Updated";
      });
    });

    rtHandlers.addDeleteListener((_) {
      setState(() {
        _status = "Deleted";
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(title: Text("Demo")),
          body: Center(
            child: Text(_status),
          ),
        ));
  }
}
