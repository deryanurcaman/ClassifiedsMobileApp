class Product {
  final String image, name, description, seller;
  final int price, id;

  Product({
    this.id,
    this.image,
    this.name,
    this.price,
    this.description,
    this.seller
  });
}

List<Product> products = [
  Product(
    id: 1,
    name: "AirPods Pro",
    price: 234,
    description: dummyText,
    image: "assets/images/airpods.jpg",
    seller: "Alex",
  ),
  Product(
    id: 2,
    name: "MacBook Pro 13'' ",
    price: 94,
    description: dummyText,
    image: "assets/images/macbook.jpg",
    seller: "Sam",
  ),
  Product(
    id: 3,
    name: "iPhone 13",
    price: 44,
    description: dummyText,
    image: "assets/images/iphone.jpg",
    seller: "Caroline",
  ),
  Product(
    id: 4,
    name: "Urbanears",
    price: 544,
    description: dummyText,
    image: "assets/images/kulaklik.png",
    seller: "Emma",
  ),
  Product(
    id: 5,
    name: "JBL Clip 3",
    price: 2,
    description: dummyText,
    image: "assets/images/jbl.jpg",
    seller: "Belle",
  ),
  Product(
    id: 6,
    name: "LG Monitor 27'' ",
    price: 24,
    description: dummyText,
    image: "assets/images/monitor.jpg",
    seller: "Timothee",
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";