import 'package:book_store/model/listt.dart';
import 'package:book_store/object/bool_list_data.dart';
import 'package:book_store/pages/animation.dart';
import 'package:book_store/pages/manage_book.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class PaymentInfo extends StatefulWidget {
  const PaymentInfo({super.key});

  @override
  State<PaymentInfo> createState() => _PaymentInfoState();
}

class _PaymentInfoState extends State<PaymentInfo> {
  PaymentModel _selectedMethod = allMethods[0];
  final TextEditingController _cardNumber = TextEditingController();
  final TextEditingController _amount = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Payment Information",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Consumer<ManageState>(
          builder: (context, ms, _) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Gap(30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Customer Name: ${ms.deliveryDetails[0].userName}",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "Customer e_mail: ${ms.deliveryDetails[0].email}",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "Customer PhoneNo: ${ms.deliveryDetails[0].phone}",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "Location: ${ms.deliveryDetails[0].address}",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "No of items: ${ms.cartProducts.length}",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "Total Price: \$${ms.calculate()}",
                          style: TextStyle(fontSize: 18),
                        ),
                        Gap(10),
                        Text(
                          "Choose payment method",
                          style: TextStyle(fontSize: 20),
                        ),
                        Gap(10),
                        DropdownButton<PaymentModel>(
                          value: _selectedMethod,
                          onChanged: (PaymentModel? newValue) {
                            setState(() {
                              _selectedMethod = newValue!;
                            });
                          },
                          items: allMethods.map<DropdownMenuItem<PaymentModel>>(
                              (PaymentModel method) {
                            return DropdownMenuItem<PaymentModel>(
                              value: method,
                              child: Row(
                                children: [
                                  Gap(10),
                                  Text("${method.paymentMethod}"),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                        Gap(10),
                        _selectedMethod == allMethods[0]
                            ? Gap(10)
                            : Column(
                                children: [
                                  TextField(
                                    controller: _cardNumber,
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      hintText: 'Card number',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  Gap(10),
                                  TextField(
                                    controller: _amount,
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      hintText: 'Amount',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  Gap(10),
                                  TextField(
                                    controller: _password,
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      hintText: 'Password',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ],
                              ),
                        Gap(270),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MaterialButton(
                              height: 50,
                              color: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (builder) => AnimationPage()));
                              },
                              child: Text(
                                "Buy Now",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
