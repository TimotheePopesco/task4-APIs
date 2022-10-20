class beersstouts {
  String? price;
  String? name;
  Rating? rating;
  String? image;
  int? id;

  beersstouts({this.price, this.name, this.rating, this.image, this.id});

  beersstouts.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    name = json['name'];
    rating =
        json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
    image = json['image'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['name'] = this.name;
    if (this.rating != null) {
      data['rating'] = this.rating!.toJson();
    }
    data['image'] = this.image;
    data['id'] = this.id;
    return data;
  }
}

class Rating {
  double? average;
  int? reviews;

  Rating({this.average, this.reviews});

  Rating.fromJson(Map<String, dynamic> json) {
    average = json['average'];
    reviews = json['reviews'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['average'] = this.average;
    data['reviews'] = this.reviews;
    return data;
  }
}