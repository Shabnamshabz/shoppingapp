import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projectshoppingapp/modal/ordermodal.dart';

class OrderRepository {
  String _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  Future<void> ordercreated(OrderModal ordermodal) async {
    //to get order details to admin(userid can"t access for admin,thus change code by creating new collection orders)
    String docids = getRandomString(15);
    await FirebaseFirestore.instance
        .collection("Orders")
        .doc(docids)
        .set(OrderModal(
                //another method,rather than passing from UI
                oid: docids,
                userid: FirebaseAuth.instance.currentUser?.uid,
                total: ordermodal.total,
                cartProducts: ordermodal.cartProducts)
            .toMap()); //userid in ordermodal

    //normal code to create order, without admin access was as follows:-
    // await FirebaseFirestore.instance
    //     .collection("Usersdata")
    //     .doc(Firebaseauth.instance.currentuser.uid)
    //     .collection("Orderplaced")
    //     .doc(ordermodal.oid)
    //     .set(ordermodal.toMap());
  }

  Future<List<OrderModal>> fetchorderplaced() async {
    List<OrderModal> orders = [];
    var orderlist = await FirebaseFirestore.instance
        .collection("Orders")
        .where("userid", isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .get();
    for (var orderdata in orderlist.docs) {
      orders.add(OrderModal.fromMap(orderdata.data()));
    }
    return orders;
    //normal code to fetch order, without admin access was as follows:-
    // var orderlist = await FirebaseFirestore.instance
    //     .collection("Usersdata")
    //     .doc(FirebaseAuth.instance.currentUser?.uid)
    //     .collection("Orderplaced")
    //     .get();
  }
}
