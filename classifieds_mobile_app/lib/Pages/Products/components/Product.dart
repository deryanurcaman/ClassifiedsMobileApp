class Product {
  late String image, name, description, seller, type;
  late String price, id;

  Product(
      {required this.id,
      required this.image,
      required this.name,
      required this.price,
      required this.description,
      required this.seller,
      required this.type});

  // fromMap is the constructors name, not function name
// downloading data from Firestore Database
  Product.fromMap(dynamic obj) {
    // dynamic => different types of values
    id = obj.id; // key -> documents id
    description = obj['description']; // value -> document field
    image = obj['image'];
    name = obj['name'];
    price = obj['price'];
    seller = obj['seller'];
    type = obj['type']; // is_favorite is boolean
  }

// toMap is function's name
// saving data to Firestore Database
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      // id of object
      map['id'] = this.id;
      map['description'] = this.description;
      map['image'] = this.image;
      map['name'] = this.name;
      map['price'] = this.price;
      map['seller'] = this.seller;
      map['type'] = this.type;
    }
    return map;
  }
}

List<Product> products = [
  Product(
    id: "1",
    name: "AirPods Pro",
    price: "234",
    description: dummyText,
    image: "assets/images/airpods.jpg",
    seller: "Alex",
    type: '',
  ),
  Product(
    id: "2",
    name: "MacBook Pro 13'' ",
    price: "94",
    description: dummyText,
    image: "assets/images/macbook.jpg",
    seller: "Sam",
    type: '',
  ),
  Product(
    id: "3",
    name: "iPhone 13",
    price: "44",
    description: dummyText,
    image: "assets/images/iphone.jpg",
    seller: "Caroline",
    type: '',
  ),
  Product(
    id: "4",
    name: "Urbanears",
    price: "544",
    description: dummyText,
    image: "assets/images/kulaklik.png",
    seller: "Emma",
    type: '',
  ),
  Product(
    id: "5",
    name: "JBL Clip 3",
    price: "2",
    description: dummyText,
    image: "assets/images/jbl.jpg",
    seller: "Belle",
    type: '',
  ),
  Product(
    id: "6",
    name: "LG Monitor 27'' ",
    price: "24",
    description: dummyText,
    image: "assets/images/monitor.jpg",
    seller: "Timothee",
    type: '',
  ),
];

List<Product> favorite_products = [
  Product(
    id: "1",
    name: "AirPods Pro",
    price: "234",
    description: dummyText,
    image: "assets/images/airpods.jpg",
    seller: "Alex",
    type: '',
  ),
  Product(
    id: "2",
    name: "MacBook Pro 13'' ",
    price: "94",
    description: dummyText,
    image: "assets/images/macbook.jpg",
    seller: "Sam",
    type: '',
  ),
  Product(
    id: "3",
    name: "iPhone 13",
    price: "44",
    description: dummyText,
    image: "assets/images/iphone.jpg",
    seller: "Caroline",
    type: '',
  ),
];

List<Product> offers = [
  Product(
    id: "1",
    name: "AirPods Pro",
    price: "234",
    description: dummyText,
    image: "assets/images/airpods.jpg",
    seller: "Alex",
    type: '',
  ),
  Product(
    id: "2",
    name: "MacBook Pro 13'' ",
    price: "94",
    description: dummyText,
    image: "assets/images/macbook.jpg",
    seller: "Sam",
    type: '',
  )
];

List<Product> post_products = [
  Product(
    id: "1",
    name: "AirPods Pro",
    price: "234",
    description: dummyText,
    image: "assets/images/airpods.jpg",
    seller: "Alex",
    type: '',
  ),
  Product(
    id: "2",
    name: "MacBook Pro 13'' ",
    price: "94",
    description: dummyText,
    image: "assets/images/macbook.jpg",
    seller: "Sam",
    type: '',
  ),
  Product(
    id: "3",
    name: "iPhone 13",
    price: "44",
    description: dummyText,
    image: "assets/images/iphone.jpg",
    seller: "Caroline",
    type: '',
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
