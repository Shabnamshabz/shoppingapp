import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projectshoppingapp/modal/productmodal.dart';
import 'package:projectshoppingapp/modal/usermodal.dart';

class UserFirestoreRepository
{
  Future<void> saveuserprofile(Usermodal usermodal)
  async{
  try {
    await FirebaseFirestore.instance.collection("Usersdata")
        .doc(usermodal.uid)
        .set(usermodal.toMap());
  }
  catch(e)
    {
      print(e);
    }
  }
  Future<void> addusersfavouriteproduct(Productmodal product)
  async{
    try {
      await FirebaseFirestore.instance.collection("Usersdata").
          doc(FirebaseAuth.instance.currentUser?.uid).collection("Favourite products").doc(product.pid)
          .set(product.toMap());
    }
    catch(e)
    {
      print(e);
    }
  }
  Future<Usermodal> fetchuserprofile()
  async{
    var user=await FirebaseFirestore.instance.collection("Usersdata").doc(FirebaseAuth.instance.currentUser?.uid).get();
    return Usermodal.fromMap(user.data()!);
  }
  Future<void> updateuserprofile(String email)
  async{
    FirebaseFirestore.instance.collection("Usersdata").
    doc(FirebaseAuth.instance.currentUser?.uid).update({"email":email});

  }
  Future<void> deleteuserprofile(String uid)
  async{
    FirebaseFirestore.instance.collection("Usersdata").
    doc(FirebaseAuth.instance.currentUser?.uid).delete();
  }
}