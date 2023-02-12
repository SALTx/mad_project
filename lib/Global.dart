class Profile {
  String username;
  String password;
  String email;
  String phoneNumber;
  List<Item> cart = [];

  Profile(this.username, this.password, this.email, this.phoneNumber);

  bool validateUser(String username, String password) {
    return this.username == username && this.password == password;
  }

  void updateCart(Item item, int quantity) {
    // if the quantity is 0 make sure the item isnt in the cart
    if (quantity == 0) {
      for (Item cartItem in cart) {
        if (cartItem.name == item.name) {
          cart.remove(cartItem);
          return;
        }
      }
    } else {
      // if the item is already in the cart, update the quantity
      for (Item cartItem in cart) {
        if (cartItem.name == item.name) {
          cartItem.price = item.price * quantity;
          return;
        }
      }
      // if the item is not in the cart, add it
      cart.add(item);
    }
  }

  double getTotal() {
    double total = 0;
    for (Item item in cart) {
      total += item.price;
    }
    return total;
  }
}

class Settings {}

class GlobalVars {
  static Profile myProfile = Profile(
    "admin",
    "password",
    "admin@gmail.com",
    "6590000000",
  );

// future implementation
  static List<Profile> profiles = [
    Profile(
      "admin",
      "password",
      "admin@gmail.com",
      "6590000000",
    ),
    Profile(
      "john",
      "password",
      "john@gmail.com",
      "6590000000",
    ),
  ];

  static bool notificationsEnabled = true;

  static List<Item> items = [
    Item("Bread", 'assets/bread.png', 1.5),
    Item("Cheese", 'assets/cheese.png', 2.5),
    Item("Milk", 'assets/milk.png', 5),
    Item("Eggs", 'assets/eggs.png', 10),
    Item("Yogurt", 'assets/yogurt.png', 3.6),
    Item("Chicken", 'assets/chicken.png', 750),
  ];
}

class Item {
  String name;
  String image;
  double price;
  int quantity = 0;

  Item(this.name, this.image, this.price);
}

double getTotal() {
  double total = 0;
  for (Item item in GlobalVars.items) {
    total += item.price * item.quantity;
  }
  return total;
}

double getItemCount() {
  double count = 0;
  for (Item item in GlobalVars.items) {
    count += item.quantity;
  }
  print(count);
  return count;
}
