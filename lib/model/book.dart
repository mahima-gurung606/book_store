class Book {
  String bookName;
  String imgUrl;
  String author;
  double price;
  int quantity;

  // Constructor
  Book({
    required this.bookName,
    required this.imgUrl,
    required this.author,
    required this.price,
    this.quantity = 0, // Default value of 0 for quantity
  });
}
