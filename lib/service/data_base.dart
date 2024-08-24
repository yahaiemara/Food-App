import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addFoodItme(Map<String, dynamic> uerInfomap, String name) async {
    return await FirebaseFirestore.instance.collection(name).add(uerInfomap);
  }

  Future<Stream<QuerySnapshot>> getFoodItem(String name) async {
    return await FirebaseFirestore.instance.collection(name).snapshots();
  }


}
