import 'package:flutter/material.dart';
import 'package:mad_project/Global.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  // bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShopStore - Settings',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                leading: Icon(Icons.notifications),
                title: Text('Notifications'),
                trailing: Switch(
                  value: GlobalVars.notificationsEnabled,
                  onChanged: (value) {
                    setState(() {
                      GlobalVars.notificationsEnabled = value;
                    });
                  },
                ),
              ),
              RaisedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('About ShopStore'),
                        content: Column(
                          children: [
                            Text(
                                'ShopStore is a mobile application that allows users to buy and sell products.'),
                            SizedBox(height: 16.0),
                            Text('Developed by:'),
                            SizedBox(height: 16.0),
                            Text('Saahil'),
                          ],
                        ),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Ok'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('About'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
