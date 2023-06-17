class itemproduk {
  final String itemjudul;
  final String itemisi;

  itemproduk({required this.itemjudul, required this.itemisi});

  Map<String, dynamic> toJson() {
    return {"judulproduk": itemjudul, "isiitem": itemisi};
  }

  factory itemproduk.fromJson(Map<String, dynamic> json) {
    return itemproduk(
      itemjudul: json["judulproduk"],
      itemisi: json["isiproduk"],
    );
  }
}
