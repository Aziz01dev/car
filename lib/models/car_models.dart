class CarModels {
  final int id;
  final String image;
  final String name;
  final int price;
  final int speed;
  final int year;

  const CarModels({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.speed,
    required this.year,
  });

  factory CarModels.fromJson(Map<String, dynamic> json) {
    return CarModels(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      price: json['price'],
      speed: json['speed'],
      year: json['year'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'price': price,
      'speed': speed,
      'year': year,
    };
  }
}
