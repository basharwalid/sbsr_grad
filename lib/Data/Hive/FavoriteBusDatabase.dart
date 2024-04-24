import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sbsr_grad/Data/Models/BusDto.dart';
import 'package:sbsr_grad/Data/Models/HiveBusModel.dart';

FavoriteBusDatabase injectFavoriteBusDatabase() {
  return FavoriteBusDatabase.getInstance();
}

class FavoriteBusDatabase {
  FavoriteBusDatabase._();

  static FavoriteBusDatabase? _instance;

  static FavoriteBusDatabase getInstance() {
    return _instance ??= FavoriteBusDatabase._();
  }

  late Box<HiveBusModel> box;

  Future<void> initHive() async {
    Hive.registerAdapter(HiveBusModelAdapter());
    await Hive.openBox<HiveBusModel>("BusFavorite");
  }

  Future<void> writeDataLocalDatabase(HiveBusModel hiveBusModel) async {
    try {
     box = Hive.box<HiveBusModel>("BusFavorite");
      await box.add(hiveBusModel);
    } catch (e) {
      print(e);
    }
  }

  List<HiveBusModel> readDataLocalDatabase() {
        box = Hive.box<HiveBusModel>("BusFavorite");
    List<HiveBusModel> busList = box.values.toList();
    return busList;
  }

  void updateDataLocalDatabase(HiveBusModel hiveBusModel) async {
       box = Hive.box<HiveBusModel>("BusFavorite");
    await box.add(hiveBusModel);
  }

  Future<void> deleteDataLocalDatabase(int index , BusDto bus)async{
    box = Hive.box<HiveBusModel>("BusFavorite");
    box.deleteAt(index);
  }
  Future<List<HiveBusModel>> getAllFavoriteBus() async {
    box = Hive.box<HiveBusModel>("BusFavorite");
    var allBusList = box.values.cast<HiveBusModel>().toList();
    return allBusList;
  }
}
