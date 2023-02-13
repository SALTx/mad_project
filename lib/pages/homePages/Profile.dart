import 'package:flutter/material.dart';
import 'package:mad_project/Global.dart';
import 'package:mad_project/main.dart';

class Profile extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<Profile> {
  bool _isEditingEmail = false;
  bool _isEditingPhoneNumber = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  @override
  void initState() {
    _emailController.text = GlobalVars.myProfile.email;
    _phoneNumberController.text = GlobalVars.myProfile.phoneNumber;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username: ${GlobalVars.myProfile.username}',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                setState(() {
                  _isEditingEmail = true;
                });
              },
              child: _isEditingEmail
                  ? TextField(
                      controller: _emailController,
                      onSubmitted: (value) {
                        setState(() {
                          _isEditingEmail = false;
                          GlobalVars.myProfile.email = value;
                        });
                      },
                    )
                  : Text('Email: ${GlobalVars.myProfile.email}'),
            ),
            SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                setState(() {
                  _isEditingPhoneNumber = true;
                });
              },
              child: _isEditingPhoneNumber
                  ? TextField(
                      controller: _phoneNumberController,
                      onSubmitted: (value) {
                        setState(() {
                          _isEditingPhoneNumber = false;
                          GlobalVars.myProfile.phoneNumber = value;
                        });
                      },
                    )
                  : Text('Phone Number: ${GlobalVars.myProfile.phoneNumber}'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Cart (${getItemCount().toInt()} items)',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: GlobalVars.items
                    .where((item) => item.quantity >= 1)
                    .toList()
                    .length,
                itemBuilder: (context, index) {
                  var item = GlobalVars.items
                      .where((item) => item.quantity >= 1)
                      .toList()[index];
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text(
                        'Price: \$${item.price}  Quantity: ${item.quantity} Total: \$${item.price * item.quantity}'),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_circle),
                      onPressed: () {
                        setState(() {
                          item.quantity--;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            Center(
              child: SizedBox(
                height: 50.0,
                width: 150.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  color: Colors.red,
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => StartPage()));
                  },
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// potential improvements
//Refactor the duplicated code: The code for the email and phone number sections is almost identical. You can extract the common code into a separate function and call the function twice with different arguments to simplify the code and reduce duplicated code.
//Use ListTile for the cart items: Instead of using a ListView and manually creating the ListTile widgets, you can use a ListView with a ListTile for each item in the cart.
