import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:sbsr_grad/Core/Notifications/NotificationsManager.dart';
import 'package:sbsr_grad/Data/Models/StationDTO.dart';

FirebaseBusRealTimeDatabase injectFirebaseBusRealTimeDatabase() {
  return FirebaseBusRealTimeDatabase.getInstance(
      manager: injectNotificationsManager());
}

class FirebaseBusRealTimeDatabase {
  NotificationsManager manager;

  FirebaseBusRealTimeDatabase._({required this.manager});

  static FirebaseBusRealTimeDatabase? instance;

  static getInstance({required NotificationsManager manager}) {
    return instance ??= FirebaseBusRealTimeDatabase._(manager: manager);
  }

  setupFirebaseReference(
      {required String dataReference, required String goalState}) {
    DatabaseReference reference = FirebaseDatabase.instance.ref(dataReference);
    reference.onValue.listen((event) {
      var state = event.snapshot.child("Station number").value.toString();
      if (state == goalState) {
        var collection = getCollectionReference();
        collection.get().then((value) {
          String stationName = "";
          var station = value.docs
              .map((e) => StationDTO.fromFireStore(e.data().toFireStore()))
              .toList();
          for (var stations in station) {
            if (stations.stationID == state) {
              stationName = stations.stationName;
              break;
            }
          }
          manager.showNotifications(stationName,
              event.snapshot.child("State").value.toString());
        });
      }
    });
  }

  CollectionReference<StationDTO> getCollectionReference() {
    return FirebaseFirestore.instance.collection("Station").withConverter(
          fromFirestore: (snapshot, options) =>
              StationDTO.fromFireStore(snapshot.data()!),
          toFirestore: (value, options) => value.toFireStore(),
        );
  }
}
