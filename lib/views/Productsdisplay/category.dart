import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projectshoppingapp/views/Productsdisplay/individual_productdisplay_mainpage.dart';

import '../../modal/productmodal.dart';
import '../../respository/User_Firestore_repository_cloudfirestore.dart';

class CategoryDisplayPage extends StatefulWidget {
  final String category;
  const CategoryDisplayPage({super.key, required this.category});

  @override
  State<CategoryDisplayPage> createState() => _CategoryDisplayPageState();
}

class _CategoryDisplayPageState extends State<CategoryDisplayPage> {
  @override
  Widget build(BuildContext context) {
    bool selected = false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: Text("${widget.category} Wear",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 45,
                color: Colors.black)),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("Products")
            .where("pcateg", isEqualTo: widget.category)
            .get(),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting)
            {
              return CircularProgressIndicator();
            }
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && snapshot.data!.size < 0) {
            return Text("Document does not exist");
          }

          if (!snapshot.hasData)
          {
            CircularProgressIndicator();
          }
          if (snapshot.hasData) {
            final data = snapshot.data!.docs
                .map(
                  (e) => Productmodal.fromMap(e.data()),
                )
                .toList();
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
              ),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDisplayMainPage(productdata: data[index]),
                        )); //snapshot.data![index] means the first index is of datatype productmodal,that can be passed instead of sending each data in productmodal individually
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(
                          image: NetworkImage(data[index].pimage!),
                          width: 400,
                          height: 170,
                          fit: BoxFit.fitHeight,
                        ),
                        Center(
                            child: Text(data[index].pname!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16))),
                        // Text("size:${womenproducts[index].psize}"),
                        // Text("Color:${womenproducts[index].pcolor}"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                                child: Text(
                              "${data[index].pprice!}aed",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    //bool selected = true; //snapshot
                                  });
                                  UserFirestoreRepository favourite =
                                      UserFirestoreRepository();
                                  favourite
                                      .addusersfavouriteproduct(data[index]);
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color: selected == true
                                      ? Colors.red
                                      : Colors.blue,
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Text("Error Occurred");
        },
      ),
    );
  }
}
