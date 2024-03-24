import 'package:firebase_database/firebase_database.dart';
import 'package:sbsr_grad/Core/Notifications/NotificationsManagere.dart';

FirebaseBusRealTimeDatabase injectFirebaseBusRealTimeDatabase(){
  return FirebaseBusRealTimeDatabase.getInstance(manager: injectNotificationsManager());
}

class FirebaseBusRealTimeDatabase {

  NotificationsManager manager;
  FirebaseBusRealTimeDatabase._({required this.manager});
  static FirebaseBusRealTimeDatabase? instance;
  static getInstance({required NotificationsManager manager}){
    return instance??= FirebaseBusRealTimeDatabase._(manager:manager);
  }

  setupFirebaseReference({required String dataReference}){

    DatabaseReference reference = FirebaseDatabase.instance.ref(dataReference);
    reference.onValue.listen((event) {
      manager.showNotifications(event.snapshot.key??"Bus", event.snapshot.value.toString());
    });

  }


}