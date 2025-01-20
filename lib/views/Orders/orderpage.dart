import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectshoppingapp/modal/cartmodal.dart';
import 'package:projectshoppingapp/modal/ordermodal.dart';
import 'package:projectshoppingapp/respository/order_repository.dart';
import 'package:projectshoppingapp/views/Productsdisplay/individual_productdisplay_mainpage.dart';
import 'package:projectshoppingapp/views/bottombarpages/homepage.dart';

import '../../Common widgets/Cart_model_widget.dart';
import '../../Common widgets/ordermodelwidget.dart';
import '../application_ui_page/applicationfirstpage.dart';

class Orderpage extends StatelessWidget {
  final OrderModal order;
  // List<Cartmodal> cartproduct;


  // String Orderid;
  // double total;
  Orderpage({required this.order});
  // Orderpage({super.key,required this.cartproduct,required this.Orderid,required this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        "Order placed succesfully!",
                        style: Theme
                            .of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(color: Colors.green, fontSize: 25),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 60,),
                Text("Orderid:${order.oid}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green),),
                SizedBox(height: 30,),
                Wrap(
                  children: List.generate(order.cartProducts!.length,(index) {
                    return ListTile(
                      leading: Image(
                        image: NetworkImage(
                            order.cartProducts![index].product.pimage.toString()),
                        fit: BoxFit.cover,
                      ),
                      title: Text(order.cartProducts![index].product.pname!,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22)),
                      trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios)),
                      subtitle:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("size:${order.cartProducts![index].product.psize}"),
                          Text("Color:"),
                          CircleAvatar(
                            backgroundColor: Colors.brown,
                            radius: 10,
                          ),
                          Text("${order.cartProducts![index].product.pprice}"
                            ,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                        ],
                      ),
                    );
                  },),
                ),
                SizedBox(height: 30,),
                Text("Payment successfull!",style:Theme.of(context).textTheme.displayMedium,),
                SizedBox(height: 30,),
                Text("Total amount ${order.total} paid",style: TextStyle(fontSize: 20,color: Colors.green,fontWeight: FontWeight.bold),)
             ,Padding(
               padding: const EdgeInsets.all(8.0),
               child: SizedBox(
                 width: double.infinity,
                 child: FilledButton(onPressed:(){
                   Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => Userloginfirstpage(),),(route) => false,);
                    }, child:Text("Start shopping again")),
               ),
             )
              ],
            ),
          ),
        )
    );
  }
}












        //not using repository as because, we just want to display data from firebase
        // body: StreamBuilder(
        //   stream: FirebaseFirestore.instance
        //       .collection("Usersdata")
        //       .doc(FirebaseAuth.instance.currentUser?.uid)
        //       .collection("Orderplaced")
        //       .snapshots(), //snapshot for stream builder instead of get in future builder
        //   builder: (context, snapshot) {
        //     if (!snapshot.hasData) {
        //       return CircularProgressIndicator();
        //     }
        //     if (snapshot.hasData) {
        //       return ListView.builder(
        //         itemCount: snapshot.data?.docs.length, 
        //         itemBuilder: (BuildContext context, int index) 
        //         {  return Column(
        //           children: [
        //             Text(snapshot.data!.docs[index].id),
        //             Row(
        //               children: [
        //                 Image(image: NetworkImage(snapshot.data!.docs[index].id.))
        //               ],
        //             )
        //           
        //           ],
        //         );
        //          
        //         },
        //           );
        //       // return Column(
        //       //   children: [
        //       //     Expanded(
        //       //       child: ListView.separated(
        //       //         itemCount: snapshot.data!.docs
        //       //             .length, //while using firebase direct here in stream , rather than function call, use data.docs.length
        //       //         itemBuilder: (context, index) {
        //       //           //json model not used, instead firebase directly called in the stream, thus we have to call frommap() from cartmodal(jsonmodal)
        //       //           var cartdata = Cartmodal.fromMap(snapshot
        //       //               .data!.docs[index]
        //       //               .data()); //conversion to product modal
        //       //           return OrderModelWidget(
        //       //             imageurl: cartdata.product.pimage.toString(),
        //       //             title: cartdata.product.pname.toString(),
        //       //             size: cartdata.product.psize
        //       //                 .toString(), //rather than giving this long code like snapshot.data!.docs[index]["psize"], store in a variable
        //       //             price: cartdata.product.pprice! + "aed".toString(),
        //       //             quantity: cartdata.quantity.toString(),
        //       //           );
        //       //         },
        //       //         separatorBuilder: (BuildContext context, int index) {
        //       //           return Divider();
        //       //         },
        //       //       ),
        //       //     ),
        //       //
        //       //     // Padding(
        //       //     // padding: const EdgeInsets.all(8.0),
        //       //     // child: SizedBox(
        //       //     // width: double.infinity,
        //       //     // child: FilledButton(
        //       //     // onPressed: () {
        //       //     // //convert to modal of snapshot.data!.doc
        //       //     // List<Cartmodal> cartelementcollection= List<Cartmodal>.from(snapshot.data!.docs.map((x) => Cartmodal.fromMap(x.data())));
        //       //     // Navigator.push(
        //       //     // context,
        //       //     // MaterialPageRoute(
        //       //     // builder: (context) => CheckOutPage(cartproduct:cartelementcollection),
        //       //     // ));
        //       //     // },
        //       //     // child: Text("Proceed to checkout")),
        //       //     // ),
        //       //     // ),
        //       //   ],
        //       // );
        //     } else {
        //       return Text("error");
        //     }
        //   },
        // ));
