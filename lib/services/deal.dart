class HotDeals {
  List<Deal> deal = <Deal>[];
  HotDeals({required this.deal});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    final deal = this.deal;
    if (deal != null) {
      data['Deal'] = deal.map((v) => v.toJson()).toList();
    }
    return data;
  }

  HotDeals.fromJson(Map<String, dynamic> json) {
    if (json['Deal'] != null) {
      deal = <Deal>[];
      json['Deal'].forEach((v) {
        deal.add(Deal.fromJson(v));
      });
    }
  }

  HotDeals.fromJson1(Map<String, dynamic> json) {
    if (json['Deal1'] != null) {
      deal = <Deal>[];
      json['Deal1'].forEach((v) {
        deal.add(Deal.fromJson(v));
      });
    }
  }

  HotDeals.fromJson2(Map<String, dynamic> json) {
    if (json['Deal2'] != null) {
      deal = <Deal>[];
      json['Deal2'].forEach((v) {
        deal.add(Deal.fromJson(v));
      });
    }
  }

  HotDeals.fromJson3(Map<String, dynamic> json) {
    if (json['Deal3'] != null) {
      deal = <Deal>[];
      json['Deal3'].forEach((v) {
        deal.add(Deal.fromJson(v));
      });
    }
  }

  HotDeals.fromJson4(Map<String, dynamic> json) {
    if (json['Deal4'] != null) {
      deal = <Deal>[];
      json['Deal4'].forEach((v) {
        deal.add(Deal.fromJson(v));
      });
    }
  }

  HotDeals.fromJson5(Map<String, dynamic> json) {
    if (json['Deal5'] != null) {
      deal = <Deal>[];
      json['Deal5'].forEach((v) {
        deal.add(Deal.fromJson(v));
      });
    }
  }
  HotDeals.fromJson6(Map<String, dynamic> json) {
    if (json['Deal6'] != null) {
      deal = <Deal>[];
      json['Deal6'].forEach((v) {
        deal.add(Deal.fromJson(v));
      });
    }
  }

  HotDeals.fromJson7(Map<String, dynamic> json) {
    if (json['Deal7'] != null) {
      deal = <Deal>[];
      json['Deal7'].forEach((v) {
        deal.add(Deal.fromJson(v));
      });
    }
  }

  HotDeals.fromJson8(Map<String, dynamic> json) {
    if (json['Deal8'] != null) {
      deal = <Deal>[];
      json['Deal8'].forEach((v) {
        deal.add(Deal.fromJson(v));
      });
    }
  }

  HotDeals.fromJson9(Map<String, dynamic> json) {
    if (json['Deal9'] != null) {
      deal = <Deal>[];
      json['Deal9'].forEach((v) {
        deal.add(Deal.fromJson(v));
      });
    }
  }

  HotDeals.fromJson10(Map<String, dynamic> json) {
    if (json['Deal10'] != null) {
      deal = <Deal>[];
      json['Deal10'].forEach((v) {
        deal.add(Deal.fromJson(v));
      });
    }
  }
  HotDeals.fromJson11(Map<String, dynamic> json) {
    if (json['Deal11'] != null) {
      deal = <Deal>[];
      json['Deal11'].forEach((v) {
        deal.add(Deal.fromJson(v));
      });
    }
  }
  HotDeals.fromJson12(Map<String, dynamic> json) {
    if (json['Deal12'] != null) {
      deal = <Deal>[];
      json['Deal12'].forEach((v) {
        deal.add(Deal.fromJson(v));
      });
    }
  }

  int Price() {
    int price = 0;
    for (int i = 0; i < deal.length; i++) {
      price += (deal[i].price![0].range ?? 1) * (deal[i].counter);
    }
    return price;
  }

  int Fee() {
    int Fee = 0;
    for (int i = 0; i < deal.length; i++) {
      Fee += (deal[i].price![0].fee ?? 1) * (deal[i].counter);
    }
    return Fee;
  }

  int Tax() {
    int Tax = 0;
    for (int i = 0; i < deal.length; i++) {
      Tax += (deal[i].price![0].tax ?? 1) * (deal[i].counter);
    }
    return Tax;
  }

  int allPrice() {
    int price = 0;
    int total = 0;
    int smallFee = 20;
    for (int i = 0; i < deal.length; i++) {
      price += (deal[i].price![0].range ?? 1) * (deal[i].counter);
      total = price + Fee() + Tax() + smallFee;
    }
    return total;
  }

  int totalItems() {
    int counter = 0;
    for (int i = 0; i < deal.length; i++) {
      counter += (deal[i].counter);
    }
    return counter;
  }

  delete(Deal dl) {
    if (deal.contains(dl)) {
      deal.remove(dl);
    }
  }

  int DealCounter(Deal dl) {
    for (int i = 0; i < deal.length; i++) {
      if (dl.name == deal[i].name && dl.price == deal[i].price) {
        return deal[i].counter;
      }
    }
    return 0;
  }

  void AddToCart(Deal dl) {
    for (int i = 0; i < deal.length; i++) {
      if (dl.name == deal[i].name && dl.price == deal[i].price) {
        return;
      }
    }

    if (!deal.contains(dl)) deal.add(dl);
  }

  void RemoveFromCart(int index) {
    deal.removeAt(index);
  }

  Increment(Deal dl) {
    AddToCart(dl);
    for (int i = 0; i < deal.length; i++) {
      if (dl.name == deal[i].name && dl.price == deal[i].price) {
        deal[i].counter++;
      }
    }
  }

  Decrement(Deal dl) {
    for (int i = 0; i < deal.length; i++) {
      if (dl.name == deal[i].name && dl.price == deal[i].price) {
        deal[i].counter--;
        if (deal[i].counter <= 0) {
          RemoveFromCart(i);
        }
      }
    }
  }
}

class Deal {
  int tax = 0;
  int fee = 0;
  int smallFee = 20;
  int counter = 0;
  String? name;
  List<Price>? price;

  Deal({this.name, this.price});

  Deal.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['price'] != null) {
      price = <Price>[];
      json['price'].forEach((v) {
        price!.add(Price.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
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
  int? fee;
  Price({this.range, this.fee, this.tax});

  Price.fromJson(Map<String, dynamic> json) {
    range = json['range'];
    tax = json['tax'];
    fee = json['fee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['range'] = range;
    data['tax'] = tax;
    data['fee'] = fee;
    return data;
  }
}
