class Product {
  final int id;
  final String name;
  final String brand;
  final String quantity;
  final int price;
  final String img;
  final int stock;
  int inCar;

  Product(this.id, this.name, this.brand, this.quantity, this.price, this.img,
      this.stock, this.inCar);

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        json['id'] as int,
        json['name'] as String,
        json['brand'] as String,
        json['quantity'] as String,
        json['price'] as int,
        json['img'] as String,
        json['stock'] as int,
        json['inCar'] as int);
  }
}
