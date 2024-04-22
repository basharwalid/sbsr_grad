import 'package:hive/hive.dart';
import 'package:sbsr_grad/Domain/Models/Bus.dart';
part 'HiveBusModel.g.dart';

@HiveType(typeId: 0)
class HiveBusModelDTO {
  @HiveField(0)
  String busName;
  @HiveField(1)
  String from;
  @HiveField(2)
  String to;
  @HiveField(3)
  String nextStation;


  HiveBusModelDTO(
      {required this.busName,
      required this.from,
      required this.to,
      required this.nextStation});

  Bus toDomain() {
    return Bus(
        busName: busName,
        from: from,
        to: to,
        nextStation: nextStation,
        );
  }
}
