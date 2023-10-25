class Product {
  String id;
  String name;
  String brand;
  String quantity;
  double price;
  String img;
  int stock;
  int inCar;

  Product(
      {required this.id,
      required this.name,
      required this.brand,
      required this.quantity,
      required this.price,
      required this.img,
      required this.stock,
      required this.inCar});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: '',
      name: '',
      brand: '',
      quantity: '',
      price: 0,
      img: '',
      stock: 0,
      inCar: 0,
    );
  }
}
