// import 'package:flutter/material.dart';
// import 'package:mad_project/Global.dart';
// import 'login.dart';
// import 'package:email_validator/email_validator.dart';
// import '../customWidgets/MyCustomButton.dart';

// class RegisterPage extends StatefulWidget {
//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   final _formKey = GlobalKey<FormState>();
//   String _username, _email, _password, _phoneNumber;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Register'),
//       ),
//       body: Form(
//         key: _formKey,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: <Widget>[
//               TextFormField(
//                 keyboardType: TextInputType.text,
//                 decoration: InputDecoration(
//                   hintText: 'Enter your username',
//                 ),
//                 validator: (value) {
//                   return null;
//                 },
//                 onChanged: (value) => _username = value,
//               ),
//               TextFormField(
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: InputDecoration(
//                   hintText: 'Enter your email',
//                 ),
//                 validator: (value) {
//                   return EmailValidator.validate(value)
//                       ? null
//                       : 'Invalid email';
//                 },
//                 onChanged: (value) => _email = value,
//               ),
//               TextFormField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   hintText: 'Enter your password',
//                 ),
//                 validator: (value) {
//                   if (value.length < 6) {
//                     return 'Password must be at least 6 characters long';
//                   }
//                   return null;
//                 },
//                 onChanged: (value) => _password = value,
//               ),
//               TextFormField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   hintText: 'Confirm your password',
//                 ),
//                 validator: (value) {
//                   if (value != _password) {
//                     return 'Passwords do not match';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 keyboardType: TextInputType.phone,
//                 decoration: InputDecoration(
//                   hintText: 'Enter your phone number',
//                 ),
//                 validator: (value) {
//                   if (value.length != 10) {
//                     return 'Please enter a valid 10-digit phone number';
//                   }
//                   return null;
//                 },
//                 onChanged: (value) => _phoneNumber = value,
//               ),
//               MyCustomButton(
//                   text: 'Register',
//                   color: Colors.red,
//                   onPressed: () {
//                     if (_formKey.currentState.validate()) {
//                       _formKey.currentState.save();
//                       GlobalVars.myProfile = Profile(
//                         _username,
//                         _password,
//                         _email,
//                         _phoneNumber,
//                       );
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => LoginPage(),
//                         ),
//                       );
//                     }
//                   }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:mad_project/Global.dart';
import 'login.dart';
import 'package:email_validator/email_validator.dart';
import '../customWidgets/MyCustomButton.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String _username, _email, _password, _phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.red[200], Colors.orange[200]],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        padding: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Enter your username',
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    return null;
                  },
                  onChanged: (value) => _username = value,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    return EmailValidator.validate(value)
                        ? null
                        : 'Invalid email';
                  },
                  onChanged: (value) => _email = value,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  validator: (value) {
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                  onChanged: (value) => _password = value,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Confirm your password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  validator: (value) {
                    if (value != _password) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Enter your phone number',
                    prefixIcon: Icon(Icons.phone),
                  ),
                  validator: (value) {
                    if (value.length != 10) {
                      return 'Please enter a valid 10-digit phone number';
                    }
                    return null;
                  },
                  onChanged: (value) => _phoneNumber = value,
                ),
                MyCustomButton(
                    text: 'Register',
                    color: Colors.red,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        GlobalVars.myProfile = Profile(
                          _username,
                          _password,
                          _email,
                          _phoneNumber,
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
