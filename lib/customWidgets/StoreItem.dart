import 'package:flutter/material.dart';
import 'package:mad_project/Global.dart';

class StoreItem extends StatefulWidget {
  final String name;
  final double price;
  final String image;

  StoreItem({
    @required this.name,
    @required this.price,
    @required this.image,
  });

  @override
  _StoreItem createState() => _StoreItem();
}

// Returns a card with the item's image, name, price, and quantity and dynamically updates the quantity when the user adds or removes an item from the cart
class _StoreItem extends State<StoreItem> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < GlobalVars.items.length; i++) {
      if (GlobalVars.items[i].name == widget.name) {
        quantity = GlobalVars.items[i].quantity;
      }
    }
    return Card(
      margin: EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(widget.image,
                height: 128, width: 128, fit: BoxFit.cover),
            SizedBox(height: 4),
            Text(widget.name + ' - \$' + widget.price.toString(),
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 4),
            quantity == 0
                ? RaisedButton(
                    child: Text('Add to cart'),
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                      for (int i = 0; i < GlobalVars.items.length; i++) {
                        if (GlobalVars.items[i].name == widget.name) {
                          GlobalVars.items[i].quantity++;
                          return;
                        }
                      }
                    },
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RaisedButton(
                        child: Text('-'),
                        onPressed: () {
                          setState(() {
                            quantity--;
                          });
                          for (int i = 0; i < GlobalVars.items.length; i++) {
                            if (GlobalVars.items[i].name == widget.name) {
                              GlobalVars.items[i].quantity -=
                                  (GlobalVars.items[i].quantity == 0 ? 0 : 1);
                              return;
                            }
                          }
                        },
                      ),
                      SizedBox(width: 8),
                      Text(
                          quantity.toString() +
                              '\n\$' +
                              (quantity * widget.price).toString(),
                          textAlign: TextAlign.center),
                      SizedBox(width: 8),
                      RaisedButton(
                        child: Text('+'),
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                          for (int i = 0; i < GlobalVars.items.length; i++) {
                            if (GlobalVars.items[i].name == widget.name) {
                              GlobalVars.items[i].quantity++;
                              return;
                            }
                          }
                        },
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
