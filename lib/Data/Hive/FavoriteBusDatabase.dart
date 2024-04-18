import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sbsr_grad/Data/Models/HiveBusModel.dart';
FavoriteBusDatabase injectFavoriteBusDatabase(){
  return FavoriteBusDatabase();
}
class FavoriteBusDatabase {
  initLocalDatabase() async {
    await Hive.initFlutter();
    Hive.registerAdapter(HiveBusModelAdapter());
    await Hive.openBox("BusFavorite");
  }
  Future<void> writeDataLocalDatabase(HiveBusModel hiveBusModel)async{
    Box<HiveBusModel> busFavoriteBox = Hive.box<HiveBusModel>("BusFavorite");
     await busFavoriteBox.add(hiveBusModel);
  }

  List<HiveBusModel> readDataLocalDatabase(){
    Box<HiveBusModel> busFavoriteBox = Hive.box<HiveBusModel>("BusFavorite");
    List<HiveBusModel> busList = busFavoriteBox.values.toList();
    return busList;
  }

  void updateDataLocalDatabase(HiveBusModel hiveBusModel)async{
    Box<HiveBusModel> busFavoriteBox = Hive.box<HiveBusModel>("BusFavorite");
    await busFavoriteBox.add(hiveBusModel);
  }
  // void deleteDataLocalDatabase()async{
  //   Box<HiveBusModel> busFavoriteBox = Hive.box<HiveBusModel>("BusFavorite");
  //   busFavoriteBox.delete();
  // }
  Future<List<HiveBusModel>> getAllFavoriteBus()async{
    var box = Hive.box("BusFavorite");
    var allBusList = box.values.cast<HiveBusModel>().toList();
    return allBusList;
  }
}
