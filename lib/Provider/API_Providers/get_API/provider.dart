import 'package:apidata/Provider/API_Providers/get_API/model.dart';
import 'package:apidata/Provider/API_Providers/get_API/services.dart';
import 'package:flutter/material.dart';

class ProviderOperation extends ChangeNotifier {
  final service = ProviderServices();
  bool isLoading = false;
  List<Welcome> _welcome = [];
  List<Welcome> get welcome => _welcome;
  getAlldata() async {
    isLoading = true;
    notifyListeners();
    final res = await service.getAlldata();
    _welcome = res;

    isLoading = false;
    notifyListeners();
  }
}
