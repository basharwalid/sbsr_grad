import 'package:geolocator/geolocator.dart';
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

  late Box<HiveBusModelDTO> box;

  Future<void> initHive() async {
    Hive.registerAdapter(HiveBusModelAdapter());
    box = await Hive.openBox<HiveBusModelDTO>("BusFavorite");
  }

  Future<void> writeDataLocalDatabase(HiveBusModelDTO hiveBusModel) async {
    try {
     box = Hive.box<HiveBusModelDTO>("BusFavorite");
      await box.add(hiveBusModel);
    } catch (e) {
      print(e);
    }
  }

  List<HiveBusModelDTO> readDataLocalDatabase() {
        box = Hive.box<HiveBusModelDTO>("BusFavorite");
    List<HiveBusModelDTO> busList = box.values.toList();
    return busList;
  }

  void updateDataLocalDatabase(HiveBusModelDTO hiveBusModel) async {
       box = Hive.box<HiveBusModelDTO>("BusFavorite");
    await box.add(hiveBusModel);
  }

  Future<void> deleteDataLocalDatabase(int index , BusDto bus)async{
    box = Hive.box<HiveBusModelDTO>("BusFavorite");
    box.deleteAt(index);
  }
  Future<List<HiveBusModelDTO>> getAllFavoriteBus() async {
    box = Hive.box<HiveBusModelDTO>("BusFavorite");
    var allBusList = box.values.cast<HiveBusModelDTO>().toList();
    return allBusList;
  }
}
