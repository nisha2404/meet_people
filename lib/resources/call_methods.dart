import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meet_people/models/call.dart';

class CallMethods {
  final CollectionReference callCollection =
      FirebaseFirestore.instance.collection("call");

  Future<bool> makeCall({Call? call}) async {
    try {
      call!.hasDialed = true;
      Map<String, dynamic> hasDialedMap = call.toMap(call);

      call.hasDialed = false;
      Map<String, dynamic> hasNotDialedMap = call.toMap(call);

      await callCollection.doc(call.callerId).set(hasDialedMap);
      await callCollection.doc(call.receiverId).set(hasNotDialedMap);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> endCall({Call? call}) async {
    try {
      await callCollection.doc(call!.callerId).delete();
      await callCollection.doc(call.receiverId).delete();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
