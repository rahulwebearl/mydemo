import 'package:flutter/foundation.dart';

import 'servicefile.dart';

class DataProvider with ChangeNotifier {
  final APIService _apiService = APIService();
  List<dynamic> _data = [];

  List<dynamic> get data => _data;

  Future<void> fetchData() async {
    try {
      _data = await _apiService.fetchData();
      notifyListeners();
    } catch (e) {
      // Handle errors
      print(e);
    }
  }
}


/// step 1 extend or with using for changeNotifier class .
/// step 2 create empty list .
/// step 3 use get metthod for read data from other classes
/// step 4 create future function for fetch data  store _data variable for api response in this function
/// step 5 use notifiylistner for change and update data .