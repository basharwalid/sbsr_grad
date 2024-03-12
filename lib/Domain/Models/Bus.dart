import 'package:sbsr_grad/Data/Models/BusDto.dart';

class Bus {
  String busName;
  String from;
  String to;
  String nextStation;
  // bool isFavorite;

  Bus(
      {required this.busName,
      required this.from,
      // required this.isFavorite,
      required this.nextStation,
      required this.to});

  BusDto toDataSource() {
    return BusDto(
        busName: busName,
        from: from,
        // isFavorite: isFavorite,
        nextStation: nextStation,
        to: to);
  }
}
