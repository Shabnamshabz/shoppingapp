import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projectshoppingapp/modal/productmodal.dart';
class ProductRepository {
  Future<List<Productmodal>?> fetchproductdetails() async {
    try {
      List<Productmodal> productlist = [];
      var datalist =
          await FirebaseFirestore.instance.collection("Products").get();
      for (var datasets in datalist.docs) {
        productlist.add(Productmodal.fromMap(datasets.data()));
      }
      return productlist;
    } catch (e) {
      print(e);
    }
  }


  Future<List<Productmodal>?> fetchproductbycategory(String category) async {
    try {
      List<Productmodal> productlist = [];
      var datalist = await FirebaseFirestore.instance
          .collection("Products")
          .where("pcateg", isEqualTo: category)
          .get();
      for (var datasets in datalist.docs) {
        productlist.add(Productmodal.fromMap(datasets.data()));
      }
      return productlist;
    } catch (e) {
      print(e);
    }
  }
  // Future<List<Productmodal>?> fetchfavouriteproduct(String category) async {
  //   try {
  //     List<Productmodal> productlist = [];
  //     var datalist = await FirebaseFirestore.instance
  //         .collection("Products")
  //         .where("pcateg", isEqualTo: category)
  //         .get();
  //     for (var datasets in datalist.docs) {
  //       productlist.add(Productmodal.fromMap(datasets.data()));
  //     }
  //     return productlist;
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
