import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../modal/cartmodal.dart';

class cartrepo {
  Future<void> addtocart(Cartmodal cartmodal) async {
    bool result = await checkcart(cartmodal.product.pname!);
    if (result == false) {
      await FirebaseFirestore.instance
          .collection("Usersdata")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .collection("Cart")
          .doc(cartmodal.cartId)
          .set(cartmodal.toMap());
    } else
    {
      await FirebaseFirestore.instance
          .collection("Usersdata")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .collection("Cart").where("product.pname",isEqualTo: cartmodal.product.pname!).get().then((value) => updatecart(value.docs.first.id,1),);

    }
  }

  Future<bool> checkcart(String productname) async {
    return await FirebaseFirestore.instance
        .collection("Usersdata")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("Cart")
        .where("product.pname", isEqualTo: productname)
        .get()
        .then(
          (value) => value.size > 0 ? true : false,
        );
  }

  Future<void> updatecart(String id, int quantity) async {
    await FirebaseFirestore.instance
        .collection("Usersdata")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("Cart")
        .doc(id)
        .update({"quantity": FieldValue.increment(quantity)});
  }

  Future<void> deletecart(String id) async {
    await FirebaseFirestore.instance
        .collection("Usersdata")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("Cart")
        .doc(id)
        .delete();
  }
}
