import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projectshoppingapp/modal/cartmodal.dart';
import 'package:projectshoppingapp/modal/productmodal.dart';

class CartFirestoreRepository {
  //fetchdetailsfromcart must be done in ui page using streambuilder

  Future<void> addToCart(Cartmodal cartmodal) async {
    try {
      bool result = await checkCart(cartmodal.product.pname!);
      print(result);
      //if you want to store cart collection under users collection,use this code
      if (result == false) //if no same product in cart
      {
        await FirebaseFirestore.instance
            .collection("Usersdata")
            .doc(FirebaseAuth
                .instance.currentUser?.uid) //firebase login user id taken
            .collection("Cart")
            .doc(cartmodal.cartId)
            .set(cartmodal.toMap());
      } else {
        await FirebaseFirestore.instance
            .collection("Usersdata")
            .doc(FirebaseAuth
                .instance.currentUser?.uid) //firebase login user id taken
            .collection("Cart")
            .where("product.pname", isEqualTo: cartmodal.product.pname)
            .get()
            .then((value) => updatecart(value.docs.first.id,1) ); //doubt

      }
    } catch (e) {
      print(e);
    }
  }

  ///condition for check item in the cart or not
  Future<bool> checkCart(String productName) async {
    return await FirebaseFirestore.instance
        .collection("Usersdata")
        .doc(FirebaseAuth
            .instance.currentUser?.uid) //firebase login user id taken
        .collection("Cart")
        .where("product.pname", isEqualTo: productName)
        .get()
        .then((value) => value.size > 0
            ? true
            : false); // whether product is there in cart ,then return true
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
