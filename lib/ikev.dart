import 'package:flutter/material.dart';
import 'package:flutter_vpn/flutter_vpn.dart';
import 'package:ufas/ovpn.dart';

class Ikev extends StatefulWidget {
  Ikev({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Ikev> {
  final _addressController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  var state = FlutterVpnState.disconnected;
  var charonState = CharonErrorState.NO_ERROR;
  void _incrementCounter() {
    setState(() {});
  }

  @override
  void initState() {
    FlutterVpn.prepare();
    FlutterVpn.onStateChanged.listen((s) => setState(() => state = s));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: ListView(
          padding: const EdgeInsets.all(15.0),
          children: <Widget>[
            Text('Current State: $state'),
            Text('Current Charon State: $charonState'),
            TextFormField(
              controller: _addressController,
              decoration: InputDecoration(icon: Icon(Icons.map)),
            ),
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(icon: Icon(Icons.person_outline)),
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(icon: Icon(Icons.lock_outline)),
            ),
            RaisedButton(
              child: Text('Connect'),
              onPressed: () => FlutterVpn.simpleConnect(
                _addressController.text,
                _usernameController.text,
                _passwordController.text,
              ),
            ),
            RaisedButton(
              child: Text('Disconnect'),
              onPressed: () => FlutterVpn.disconnect(),
            ),
            RaisedButton(
                child: Text('Update State'),
                onPressed: () async {
                  var newState = await FlutterVpn.currentState;
                  setState(() => state = newState);
                }),
            RaisedButton(
                child: Text('Update Charon State'),
                onPressed: () async {
                  var newState = await FlutterVpn.charonErrorState;
                  setState(() => charonState = newState);
                }),
            RaisedButton(
                child: Text('OpenVPN'),
                onPressed: () async {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ovpn()));
                })
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
