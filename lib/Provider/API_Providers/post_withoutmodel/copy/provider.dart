import 'package:apidata/Provider/API_Providers/post_withoutmodel/copy/service.dart';
import 'package:flutter/material.dart';

class Myproviderdemo extends ChangeNotifier {
  final MyTryPost _mpost = MyTryPost();
  List<dynamic> mposts = [];

  Future<void> myprovider() async {
    try {
      mposts = await _mpost.postfetch();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
