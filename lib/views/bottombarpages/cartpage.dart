import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectshoppingapp/Common%20widgets/Cart_model_widget.dart';
import 'package:projectshoppingapp/modal/cartmodal.dart';
import 'package:projectshoppingapp/respository/cart_firestore_repository.dart';
import 'package:projectshoppingapp/views/cartpages/cartcheckourpages.dart';

import '../../respository/product_repository.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Cart",
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("Usersdata")
              .doc(FirebaseAuth.instance.currentUser?.uid)
              .collection("Cart")
              .snapshots(), //snapshot for stream builder instead of get in future builder
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            if (snapshot.hasData) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                        itemCount: snapshot.data!.docs
                            .length, //while using firebase direct here in stream , rather than function call, use data.docs.length
                        itemBuilder: (context, index) {
                          //json model not used, instead firebase directly called in the stream, thus we have to call frommap() from cartmodal(jsonmodal)
                          var cartdata = Cartmodal.fromMap(
                              snapshot.data!.docs[index].data()); //conversion to product modal
                          return CartModelWidget(
                            imageurl: cartdata.product.pimage.toString(),
                            title: cartdata.product.pname.toString(),
                            size: cartdata.product.psize
                                .toString(), //rather than giving this long code like snapshot.data!.docs[index]["psize"], store in a variable
                            color: cartdata.product.pcolor.toString(),
                            price: cartdata.product.pprice!+"aed".toString(),
                            quantity: cartdata.quantity.toString(),
                            addfunction: () {
                              CartFirestoreRepository cart =
                                  CartFirestoreRepository();
                              cart.updatecart(
                                  cartdata.cartId,1);
                            },
                            removefunction: () {
                              CartFirestoreRepository cart =
                                  CartFirestoreRepository();
                              cart.updatecart(
                                  cartdata.cartId,- 1);
                            },
                            deletefunction: () {
                              CartFirestoreRepository cart =
                                  CartFirestoreRepository();
                              cart.deletecart(cartdata.cartId);
                            },
                          );
                        }, separatorBuilder: (BuildContext context, int index) { return Divider(); },),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                          onPressed: () {
                            //convert to modal of snapshot.data!.doc
                            List<Cartmodal> cartelementcollection= List<Cartmodal>.from(snapshot.data!.docs.map((x) => Cartmodal.fromMap(x.data())));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CheckOutPage(cartproduct:cartelementcollection),
                                ));
                          },
                          child: Text("Proceed to checkout")),
                    ),
                  ),
                ],
              );
            } else
            {
              return Text("error");
            }


          },

        ));
  }
}
class modal
{
  
}