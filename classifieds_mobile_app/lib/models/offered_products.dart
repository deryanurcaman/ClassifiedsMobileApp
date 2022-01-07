class OfferedProduct {
  late String user_id, product_id;
  late String? id;

  OfferedProduct({
    this.id,
    required this.user_id,
    required this.product_id,
  });

  // fromMap is the constructors name, not function name
// downloading data from Firestore Database
  OfferedProduct.fromMap(dynamic obj) {
    // dynamic => different types of values
    id = obj.id; // key -> documents id
    user_id = obj['user_id']; // value -> document field
    product_id = obj['product_id'];
  }

// toMap is function's name
// saving data to Firestore Database
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map['user_id'] = this.user_id;
    map['product_id'] = this.product_id;

    return map;
  }
}
