class ProductModel {
  String id;
  String name;
  String brand;
  String quantity;
  double price;
  String img;
  int stock;
  int inCar;

  ProductModel(
      {required this.id,
      required this.name,
      required this.brand,
      required this.quantity,
      required this.price,
      required this.img,
      required this.stock,
      required this.inCar});

  @override
  String toString() {
    return 'Product{id: $id, name: $name,brand: $brand,quantity: $quantity,price: $price, img:$img,stock:$stock,inCar:$inCar}';
  }

  // Factory constructor
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      brand: json['brand'] ?? '',
      quantity: json['quantity'] ?? '',
      price: double.parse(json['price'].toString()),
      img: json['img'] ?? '',
      stock: json['stock'] ?? 0,
      inCar: json['inCar'] ?? 0,
    );
  }
}
