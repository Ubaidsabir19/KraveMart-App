class Grocery {
  List<Product>? product;

  Grocery({this.product});

  Grocery.fromJson(Map<String, dynamic> json) {
    if (json['Product'] != null) {
      product = <Product>[];
      json['Product'].forEach((v) {
        product!.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    final product = this.product;
    if (product != null) {
      data['Product'] = product.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  String? name;
  List<Price>? price;

  Product({this.name, this.price});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['price'] != null) {
      price = <Price>[];
      json['price'].forEach((v) {
        price!.add(new Price.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    final price = this.price;
    if (price != null) {
      data['price'] = price.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Price {
  int? range;
  int? tax;

  Price({this.range, this.tax});

  Price.fromJson(Map<String, dynamic> json) {
    range = json['range'];
    tax = json['tax'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['range'] = this.range;
    data['tax'] = this.tax;
    return data;
  }
}
