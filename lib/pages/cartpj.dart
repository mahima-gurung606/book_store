import 'package:book_store/pages/manage_book.dart';
import 'package:book_store/pages/payment.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
          centerTitle: true,
        ),
        body: Consumer<ManageState>(
          builder: (context, ms, _) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: ms.cartProducts.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "${ms.cartProducts[index].imgUrl}"),
                                          fit: BoxFit.contain)),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${ms.cartProducts[index].bookName}",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Gap(10),
                                          Text(
                                            "${ms.cartProducts[index].author}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal),
                                          ),
                                          Gap(10),
                                          Text(
                                            "\$${ms.cartProducts[index].price}",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Gap(30),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              ms.decreaseQuantity(
                                                  ms.cartProducts[index]);
                                            },
                                            icon: Icon(
                                              Icons.remove,
                                              size: 30,
                                              color: Colors.red,
                                            ),
                                          ),
                                          Gap(10),
                                          Text(
                                            "${ms.cartProducts[index].quantity}",
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Gap(10),
                                          IconButton(
                                            onPressed: () {
                                              ms.increaseQuantity(
                                                  ms.cartProducts[index]);
                                            },
                                            icon: Icon(
                                              Icons.add,
                                              size: 30,
                                              color: Colors.green,
                                            ),
                                          ),
                                          Gap(10),
                                          IconButton(
                                            onPressed: () {
                                              ms.deleteProduct(
                                                  ms.cartProducts[index]);
                                            },
                                            icon: Icon(
                                              Icons.delete_forever,
                                              size: 30,
                                              color: Colors.green,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadiusDirectional.only(
                        topEnd: Radius.circular(30),
                        topStart: Radius.circular(30)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Price: \S${ms.calculate()}",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (builder) => DeliveryInfo()));
                          },
                          child: Card(
                            margin: EdgeInsets.all(10),
                            elevation: 4,
                            child: Container(
                              height: 30,
                              width: 60,
                              color: Colors.blueGrey,
                              child: Text(
                                "check",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }
}
