
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hiveprovider/data/model/models.dart';
import 'package:hiveprovider/data/repository/get_currency_repository.dart';

class HomeProvider extends ChangeNotifier {
  GetCuirrencyRepository getCuirrencyRepository = GetCuirrencyRepository();
  HomeProvider() {
    getUser();
  }

  bool isLoading = false;
  String error = '';
  List<CurrencyAppModel>? list;
  Future<void> getUser() async {
    isLoading = true;
    notifyListeners();
    await getCuirrencyRepository.getCurrency().then((dynamic response) {
      if (response is Box<CurrencyAppModel>) {
        list = response.values.toList();
        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        error = response.toString();
        notifyListeners();
      }
    });
  }
}
