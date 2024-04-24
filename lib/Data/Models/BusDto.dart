import 'package:sbsr_grad/Domain/Models/Bus.dart';

class BusDto {
  String uid;
  String busName;
  String from;
  String to;
  String nextStation;
  // bool isFavorite;

  BusDto({
    required this.uid,
    required this.busName,
    required this.from,
    required this.nextStation,
    required this.to});

  BusDto.fromFireStore(Map<String, dynamic> json)
      : this(
      uid: json["busID"],
      busName: json["busName"],
      from: json["from"],
      to: json["to"],
      nextStation: json["nextStation"],
      // isFavorite: json["isFavorite"]
      );

  Map<String, dynamic> toFireStore() {
    return {
      "busName": busName,
      "from": from,
      "to": to,
      "nextStation": nextStation,
      "busID" : uid
    };
  }

  Bus toDomain() {
    return Bus(busName: busName,
        from: from,
        nextStation: nextStation,
        to: to,
        uid: uid
    );
  }
}
