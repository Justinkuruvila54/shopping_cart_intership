import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_cart_intership/repositary/api/model/product_list_model.dart';

class GetProductListApicontroller with ChangeNotifier {
  static List productList = [];

  static List productKeys = [];
  // // HIVE step 4
  var myBox = Hive.box("products");
  //function to add data
  void addData({
    required String title,
    required String img,
    required String description,
    required String price,
    required String rating,
  }) {
    myBox.add({
      "title": title,
      "img": img,
      "description": description,
      "price": price,
      "rating": rating,
    });
    notifyListeners();
  }

  // function to delete data

  void deleteData(int index) {
    myBox.deleteAt(index);
    productKeys = myBox.keys.toList();
    notifyListeners();
  }

  void totalprice() {}

  List<Sampleresmodel>? responselist = [];

  Future<List<Sampleresmodel>?> fetchdata() async {
    var url = Uri.parse("https://fakestoreapi.com/products");
    var response = await http.get(url);

    if (response.statusCode == 200 && response.statusCode < 300) {
      var decodedata = jsonDecode(response.body);
      log("****************************$decodedata");

      responselist = decodedata
          .map<Sampleresmodel>((e) => Sampleresmodel.fromJson(e))
          .toList();
      return responselist;
    }
    notifyListeners();
    return null;
  }
}
