import 'package:book_store/list/list_model.dart';
import 'package:book_store/model/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ManageState with ChangeNotifier {
  int _counter = 0;
  set counter(int value) {
    _counter = value;
    notifyListeners();
  }

  int get counter => _counter;
  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  List<Book> _cartProducts = [];
  bool addToCart(Book books) {
    if (!_cartProducts.contains(books)) {
      _cartProducts.add(books);
      _counter++;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  List<Book> get cartProducts => _cartProducts;
  void increaseQuantity(Book books) {
    books.quantity++;
    notifyListeners();
  }

  void decreaseQuantity(Book books) {
    if (books.quantity > 0) {
      books.quantity--;
      notifyListeners();
    }
  }

  void deleteProduct(Book books) {
    _cartProducts.remove(books);
    _counter--;
    notifyListeners();
  }

  double calculate() {
    double total = 0;
    for (var product in _cartProducts) {
      total = total + product.price * product.quantity;
    }
    return total;
  }

  List<DeliveryModel> _deliveryDetails = [];
  List<DeliveryModel> get deliveryDetails => _deliveryDetails;
  void addDeliveryDetails(
      String name, String email, String phone, String address, double price) {
    _deliveryDetails.add(
      DeliveryModel(
        userName: "fhh",
        email: "email",
        phone: "phone",
        address: "address",
        totalPrice: 89,
      ),
    );
  }
}
