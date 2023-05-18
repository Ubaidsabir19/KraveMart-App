import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../services/deal.dart';
import '../services/product.dart';

class GlobalData extends ChangeNotifier {
  Grocery? item;
  HotDeals? items;
  HotDeals? items1;
  HotDeals? items2;
  HotDeals? items3;
  HotDeals? items4;
  HotDeals? items5;
  HotDeals? items6;
  HotDeals? items7;
  HotDeals? items8;
  HotDeals? items9;
  HotDeals? items10;
  HotDeals? items11;
  HotDeals? items12;
  int price = 0;
  int counter = 0;
  int smallFee = 0;
  List? dealList;
  List? productList;

  HotDeals cataLog = HotDeals(deal: <Deal>[]);

  readJson() async {
    final String response = await rootBundle.loadString('assets/products.json');
    final data = await json.decode(response);
    item = Grocery.fromJson(data);
    notifyListeners();
  }

  readJson1() async {
    final String response = await rootBundle.loadString('assets/deal.json');
    final data = await json.decode(response);
    items = HotDeals.fromJson(data);
    notifyListeners();
  }

  readJson2() async {
    final String response =
        await rootBundle.loadString('assets/breakfast.json');
    final data = await json.decode(response);
    items1 = HotDeals.fromJson1(data);
    notifyListeners();
  }

  readJson3() async {
    final String response = await rootBundle.loadString('assets/fruits.json');
    final data = await json.decode(response);
    items2 = HotDeals.fromJson2(data);
    notifyListeners();
  }

  readJson4() async {
    final String response =
        await rootBundle.loadString('assets/vegetables.json');
    final data = await json.decode(response);
    items3 = HotDeals.fromJson3(data);
    notifyListeners();
  }

  readJson5() async {
    final String response = await rootBundle.loadString('assets/payday.json');
    final data = await json.decode(response);
    items4 = HotDeals.fromJson4(data);
    notifyListeners();
  }

  readJson6() async {
    final String response = await rootBundle.loadString('assets/biscuits.json');
    final data = await json.decode(response);
    items5 = HotDeals.fromJson5(data);
    notifyListeners();
  }

  readJson7() async {
    final String response = await rootBundle.loadString('assets/masaalay.json');
    final data = await json.decode(response);
    items6 = HotDeals.fromJson6(data);
    notifyListeners();
  }

  readJson8() async {
    final String response = await rootBundle.loadString('assets/laundry.json');
    final data = await json.decode(response);
    items7 = HotDeals.fromJson7(data);
    notifyListeners();
  }

  readJson9() async {
    final String response = await rootBundle.loadString('assets/Oil.json');
    final data = await json.decode(response);
    items8 = HotDeals.fromJson8(data);
    notifyListeners();
  }

  readJson10() async {
    final String response = await rootBundle.loadString('assets/mobile.json');
    final data = await json.decode(response);
    items9 = HotDeals.fromJson9(data);
    notifyListeners();
  }

  readJson11() async {
    final String response = await rootBundle.loadString('assets/milk.json');
    final data = await json.decode(response);
    items10 = HotDeals.fromJson10(data);
    notifyListeners();
  }

  readJson12() async {
    final String response =
        await rootBundle.loadString('assets/lifeStyle.json');
    final data = await json.decode(response);
    items11 = HotDeals.fromJson11(data);
    notifyListeners();
  }

  readJson13() async {
    final String response =
        await rootBundle.loadString('assets/chocolates.json');
    final data = await json.decode(response);
    items12 = HotDeals.fromJson12(data);
    notifyListeners();
  }

  int DealCounter(Deal deal) {
    return cataLog.DealCounter(deal);
  }

  int Price() {
    return cataLog.Price();
  }

  int Fee() {
    return cataLog.Fee();
  }

  int Tax() {
    return cataLog.Tax();
  }

  int allPrice() {
    return cataLog.allPrice();
  }

  List<Deal> getCart() {
    return cataLog.deal;
  }

  int totalItems() {
    return cataLog.totalItems();
  }

  delete(Deal deal) {
    cataLog.delete(deal);
    notifyListeners();
  }

  Increment(Deal deal) {
    cataLog.Increment(deal);
    notifyListeners();
  }

  Decrement(Deal deal) {
    cataLog.Decrement(deal);
    notifyListeners();
  }
}
