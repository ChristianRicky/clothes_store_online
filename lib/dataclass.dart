class itemproduk {
  final String name;
  final String price;

  itemproduk({required this.name, required this.price});

  Map<String, dynamic> toJson() {
    return {"name": name, "price": price};
  }

  factory itemproduk.fromJson(Map<String, dynamic> json) {
    return itemproduk(
      name: json["name"],
      price: json["price"],
    );
  }
}
