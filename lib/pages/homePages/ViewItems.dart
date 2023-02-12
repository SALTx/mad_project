import 'package:flutter/material.dart';
import '../../customWidgets/StoreItem.dart';
import 'package:mad_project/Global.dart';

class ViewItems extends StatefulWidget {
  @override
  _ViewItemsState createState() => _ViewItemsState();
}

class _ViewItemsState extends State<ViewItems> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShopStore - View Items',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Center(
          child: GridView.count(
            crossAxisCount: 1,
            children: [
              for (Item item in GlobalVars.items)
                StoreItem(
                  name: item.name,
                  price: item.price,
                  image: item.image,
                ),
              Visibility(
                visible: getItemCount() > 0,
                child: Container(
                  width: 200,
                  height: 50,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: RaisedButton(
                      child: Text('Checkout'),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Total'),
                              content: Column(
                                children: [
                                  SizedBox(height: 16.0),
                                  Text('Items:'),
                                  SizedBox(height: 16.0),
                                  for (Item item in GlobalVars.items)
                                    if (item.quantity > 0)
                                      Text(
                                          '${item.name} x${item.quantity} - \$${item.price * item.quantity}'),
                                  SizedBox(height: 16.0),
                                  Text('Total: \$${getTotal()}'),
                                ],
                              ),
                              actions: [
                                FlatButton(
                                  child: Text('Close'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
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
}
