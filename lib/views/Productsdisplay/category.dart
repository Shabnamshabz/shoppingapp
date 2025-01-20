import 'package:flutter/material.dart';
import 'package:projectshoppingapp/respository/product_repository.dart';
import 'package:projectshoppingapp/views/Productsdisplay/individual_productdisplay_mainpage.dart';

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
    bool selected=false;
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
        future: ProductRepository().fetchproductbycategory(widget.category),
        builder: (context, snapshot) {
          if (!snapshot.hasData) //inversion operator
          {
            CircularProgressIndicator();
          }
          if (snapshot.hasData) {
            return Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) =>ProductDisplayMainPage(productdata:snapshot.data![index]),)); //snapshot.data![index] means the first index is of datatype productmodal,that can be passed instead of sending each data in productmodal individually
                    },
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image: NetworkImage(snapshot.data![index].pimage!),
                            width: 400,
                            height: 170,
                            fit: BoxFit.fitHeight,
                          ),
                          Center(
                              child: Text(snapshot.data![index].pname!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 16))),
                          // Text("size:${womenproducts[index].psize}"),
                          // Text("Color:${womenproducts[index].pcolor}"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                  child: Text(
                                "${snapshot.data![index].pprice!}aed",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              )),

                              IconButton(onPressed:(){
                                setState(() {
                                  bool selected=true; //snapshot
                                });
                                UserFirestoreRepository favourite=UserFirestoreRepository();
                                favourite.addusersfavouriteproduct(snapshot.data![index]);

                              },
                                  icon:Icon(Icons.favorite,color:selected==true?Colors.red:Colors.blue,))
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
          return Text("Error Occurred");
        },
      ),
    );
  }
}
