import 'package:flutter/material.dart';
import 'package:sharepoint_auth/model/config.dart';
import 'package:sharepoint_auth/sharepoint_auth.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sharepoint Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Sharepoint Token Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  static final SharepointConfig config = new SharepointConfig(
      "Sharepoint Client Id",
      "Sharepoint Client Secret",
      "Sharepoint Resource",
      "Sharepoint Site",
      "Your Tenant Id",);

  final Sharepointauth sharepointauth = Sharepointauth(config);

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text(
                "Acess Token",
                style: Theme.of(context).textTheme.headline,
              ),
            ),
            ListTile(
              leading: Icon(Icons.launch),
              title: Text('Login/Get Access Token'),
              onTap: () {
                login();
              },
            ),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text('Logout/Remove Token'),
              onTap: () {
                logout();
              },
            ),
          ],
        ),
      ),
    );
  }

  void showError(dynamic ex) {
    showMessage(ex.toString());
  }

  void showMessage(String text) {
    var alert = new AlertDialog(content: new Text(text), actions: <Widget>[
      new FlatButton(
          child: const Text("Ok"),
          onPressed: () {
            Navigator.pop(context);
          })
    ]);
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  void login() async {
    try {
      await sharepointauth.login();
      String accessToken = await sharepointauth.getAccessToken();
      showMessage("Sharepoint access token: $accessToken");
    } catch (e) {
      showError(e);
    }
  }

  void logout() async {
    await sharepointauth.logout();
    showMessage("Logged out. Token Removed.");
  }
}