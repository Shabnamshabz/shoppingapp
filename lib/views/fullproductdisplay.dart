import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projectshoppingapp/views/Productsdisplay/individual_productdisplay_mainpage.dart';

import '../respository/product_repository.dart';


class Fullproductdisplay extends StatelessWidget {
  TextEditingController ppricecontroller = TextEditingController();
  Fullproductdisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
              "Start shopping!",
              style: TextStyle(
                  color: Colors.blue, fontSize: 37, fontWeight: FontWeight.bold),
            )),

      ),
      body: FutureBuilder(
        future: ProductRepository()
            .fetchproductdetails(), //FirebaseFirestore.instance.collection("Products").get()
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>ProductDisplayMainPage(productdata: snapshot.data![index]),));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image(
                          image: NetworkImage(
                              snapshot.data![index].pimage.toString()),
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ), //snapshot.data![index].pimage.toString()
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(snapshot.data![index].pname.toString()), //if model exists
                                Text(snapshot.data![index].pcateg.toString()),
                                Text(snapshot.data![index].psize.toString()),
                                Text(snapshot.data![index].pgender.toString()),
                                Text(snapshot.data![index].pprice.toString()),
                                Text(snapshot.data![index].pcolor.toString()),
                  
                                //Text(snapshot.data!.docs[index]["pname"]) used while giving directly
                  
                              ],
                            ),
                          ),
                        ), //snapshot.data!.docs[index]["pimage"]
                  
                  
                      ],
                    ),
                  ),
                );
              }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

