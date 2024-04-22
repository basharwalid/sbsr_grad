import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:sbsr_grad/Data/Models/BusDto.dart';
import 'package:sbsr_grad/Domain/Models/Bus.dart';

FirebaseBusDatabase injectFirebaseBusDatabase() {
  return FirebaseBusDatabase.getInstance();
}

class FirebaseBusDatabase {
  FirebaseBusDatabase._();

  static FirebaseBusDatabase? _instance;

  static FirebaseBusDatabase getInstance() {
    return _instance ??= FirebaseBusDatabase._();
  }

  CollectionReference<BusDto> getCollectionReference() {
    return FirebaseFirestore.instance.collection("Bus").withConverter(
          fromFirestore: (snapshot, options) =>
              BusDto.fromFireStore(snapshot.data()!),
          toFirestore: (value, options) => value.toFireStore(),
        );
  }

  Future<List<BusDto>> getAllBus() async {
    var response = await getCollectionReference()
        .get()
        .then((value) => value.docs.map((e) => e.data()).toList());
    return response;
  }

  Future<List<BusDto>> searchForBus({required String query}) async {
    var response = await getCollectionReference()
        .where('from', isGreaterThanOrEqualTo: query)
        .get()
        .then((value) => value.docs.map((e) => e.data()).toList());
    return response;
  }
}
