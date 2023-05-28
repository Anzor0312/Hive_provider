import 'dart:io';
import 'package:hiveprovider/data/model/models.dart';
import 'package:hiveprovider/data/service/service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

class GetCuirrencyRepository {
  CurrencyAppService currencyAppService = CurrencyAppService();
  Box<CurrencyAppModel>? currencyBox;

  Future<dynamic> getCurrency() async {
    return await currencyAppService
        .getCurrency()
        .then((dynamic response) async {
      if (response is List<CurrencyAppModel>) {
        await openBox();
        print(response);
        await putToBox(response);
        return currencyBox;
      } else {
        return response.toString();
      }
    });
  }

  Future<void> openBox() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    currencyBox = await Hive.openBox<CurrencyAppModel>("currencyBox");
  }

  Future<void> putToBox(List<CurrencyAppModel> data) async {
    currencyBox!.clear();
    for (CurrencyAppModel element in data) {
      await currencyBox!.add(element);
      print(element);
    }
  }

  void registerAdapters() {
    Hive.registerAdapter(CurrencyAppModelAdapter());
  }
}
