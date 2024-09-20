import 'package:book_store/object/book_object.dart';
import 'package:book_store/pages/book_review.dart';
import 'package:book_store/pages/cartpj.dart';
import 'package:book_store/pages/manage_book.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imgList = [
    'assets/images/malala.jpg',
    'assets/images/book1.jpg',
    "assets/images/book2.jpg",
    "assets/iamges/book3.jpg",
    "assets/images/book4.jpg",
    "assets/images/book5.jpg",
  ];
  int _currentPage = 0;

  List<Widget> generateImagesTiles() {
    return imgList
        .map(
          (element) => ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              element,
              fit: BoxFit.cover,
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ManageState>(builder: (context, ms, _) {
      return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          leading: Icon(Icons.menu),
          actions: [
            Icon(Icons.search),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (builder) => CardPage()));
              },
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 30,
                  ),
                  Positioned(
                    right: -10,
                    top: -10,
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                          color: Colors.deepOrange, shape: BoxShape.circle),
                      child: Center(
                        child: Text(
                          "${ms.counter}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(20),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  height: 230,
                  width: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/library.jpg"),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Divider(),
                GridView.builder(
                    itemCount: 6,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.5,
                      mainAxisSpacing: 10,
                    ),
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (builder) => BookReview()));
                        },
                        child: Card(
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Container(
                                  height: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "${books[index].imgUrl}"),
                                        fit: BoxFit.fitWidth),
                                  ),
                                ),
                              ),
                              Gap(5),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  children: [
                                    Text(
                                      "${books[index].bookName}",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${books[index].author}",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          bool added =
                                              ms.addToCart(books[index]);
                                          if (added) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(
                                                        "Product Has been added")));
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(
                                                        "Product is already added")));
                                          }
                                        },
                                        icon: Card(
                                          elevation: 2,
                                          child: Icon(
                                            Icons.shopping_cart_checkout,
                                            size: 30,
                                            color: Colors.red,
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      );
    });
  }
}
