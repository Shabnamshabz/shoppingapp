import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projectshoppingapp/Common%20widgets/dateformat.dart';
import 'package:projectshoppingapp/modal/cartmodal.dart';
import 'package:projectshoppingapp/modal/productmodal.dart';
import 'package:projectshoppingapp/respository/cart_firestore_repository.dart';
import 'package:projectshoppingapp/views/bottombarpages/cartpage.dart';
class ProductDisplayMainPage extends StatelessWidget {
  String _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
 final Productmodal productdata; // datatype is a class
   ProductDisplayMainPage({super.key,required this.productdata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.30,
              width: double.infinity,
              child: Image(image: NetworkImage(productdata.pimage.toString()),fit: BoxFit.fitHeight,),
            ),
            Text(productdata.pname.toString(),style:TextStyle(fontSize:22,fontWeight:FontWeight.bold),),
            Text(productdata.pcateg.toString(),style:TextStyle(fontSize:12,fontWeight:FontWeight.bold),),
            //Text(productdata.pbrand.toString(),style:TextStyle(fontSize:12,fontWeight:FontWeight.bold),),
            Divider(),
            Text(productdata.pprice.toString(),style:TextStyle(fontSize:22,fontWeight:FontWeight.bold),),
            Divider(),
            Row(
              children: [
                Center(child: Text("Size:",style:TextStyle(fontSize:22,fontWeight:FontWeight.bold),)),
                Text(productdata.psize.toString(),style:TextStyle(fontSize:22,fontWeight:FontWeight.bold),),
              ],
            ),
            Divider(),
            Text("Delivery by date:${formatDate(DateTime.now().add(Duration(days: 4)))}",style:TextStyle(fontSize:22,fontWeight:FontWeight.bold),),
        
           // Container(height:100,width:100,child: Text(productdata.pdesc.toString(),style:TextStyle(fontSize:12,fontWeight:FontWeight.bold),)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                    child: const Text("Add to cart"),
                    onPressed: () {
                      String docids=getRandomString(15);
                      CartFirestoreRepository cart=CartFirestoreRepository();
                      cart.addToCart(Cartmodal(cartId:docids, quantity:1, product:productdata));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Cartpage(),
                          ));
                    }),
              ),
            )
          ],
        
        ),
      ),
    );
  }
}
