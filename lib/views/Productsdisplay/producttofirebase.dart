
//this code can"t be added to ui, as because user cannot add product.
//really,we want to enter product detail manually, in the admin app
//as because i had already downloaded and kept some details in a list for my ui, i can use that data
// thus this data can be added to firebase by writing a program like this
//this is just a program to add product data to firebase


import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../modal/productmodal.dart';
class Producttofirebase extends StatelessWidget {
  String _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  List<Productmodal> products = [
    Productmodal(
      pimage:
      "https://parspng.com/wp-content/uploads/2023/08/clothespng.parspng.com-14.png",
      pcolor: "pink",
      pname: "Babyhug baby Frocks",
      pbrand: "Babyhug",
      psize: "2-3years",
      pprice: "79",
      pcateg: "Baby",
      pgender: "girl",
    ),
    Productmodal(
      pimage:
      "https://www.pngmart.com/files/7/Baby-Clothes-PNG-Photo.png",
      pcolor: "blue",
      pname: "Babyhug baby jumpsuit",
      pbrand: "Babyhug",
      psize: "1-2years",
      pprice: "89",
      pcateg: "Baby",
      pgender: "girl",
    ),
    Productmodal(
      pimage:
      "https://freepngimg.com/thumb/jeans/54056-5-baby-clothes-download-hq-png-thumb.png",
      pcolor: "white",
      pname: "pinekids baby jumpsuit",
      pbrand: "Babyhug",
      psize: "9-12months",
      pprice: "59",
      pcateg: "Baby",
      pgender: "boy",
    ),
    Productmodal(
        pimage:
        "https://www.pngmart.com/files/7/Baby-Clothes-PNG-Free-Download.png",
        pcolor: "pink",
        pname: "Babyhug baby casual Frocks",
        pbrand: "Babyhug",
        psize: "9-12",
        pprice: "79",
        pcateg: "Baby",
        pgender: "girl"
    ),
    Productmodal(
      pimage:
      "https://www.pngmart.com/files/17/Little-Girl-Dress-PNG-Photos.png",
      pcolor: "pink",
      pname: "Babyhug Kids Frocks",
      pbrand: "Babyhug",
      psize: "7years",
      pprice: "79",
      pcateg: "Kids",
      pgender: "girl",
    ),
    Productmodal(
      pimage:
      "https://tse4.mm.bing.net/th?id=OIP.UpUQSZ6Du07V2K8QPRk2kQHaLW&pid=Api&P=0&h=220",
      pcolor: "black",
      pname: "Comfort Suits for boys",
      pbrand: "Trendion",
      psize: "9years",
      pprice: "89",
      pcateg: "Kids",
      pgender: "boy",
    ),
    Productmodal(
      pimage:
      "https://tse1.mm.bing.net/th?id=OIP.1vxmu0HZRu1P_dKHf9rxkQHaHa&pid=Api&P=0&h=220",
      pcolor: "pink",
      pname: "Pinekids kids frocks",
      pbrand: "Babyhug",
      psize: "9-12months",
      pprice: "69",
      pcateg: "Kids",
      pgender: "girl",
    ),
    Productmodal(
        pimage:
        "https://tse4.mm.bing.net/th?id=OIP.zkGbgpoxsf-NFPIGLy4I7gHaLH&pid=Api&P=0&h=220",
        pcolor: "Red and blue",
        pname: "Casual wears boys",
        pbrand: "gatar",
        psize: "8 years",
        pprice: "49",
        pcateg: "Kids",
        pgender: "Boy"
    ),
    Productmodal(
      pimage:
      "https://www.pngmart.com/files/1/Mens-Fashion-PNG-Image.png",
      pcolor: "pink",
      pname: "Casual wear men shirts",
      pbrand: "louis philip",
      psize: "42",
      pprice: "129",
      pcateg: "Mens",
    ),
    Productmodal(
      pimage:
      "https://tse3.mm.bing.net/th?id=OIP.STwsSzYk97DN5FRIjxUcLAHaLx&pid=Api&H=254&W=160",
      pcolor: "white stripes",
      pname: "White stripes men shirts",
      pbrand: "louis philip",
      psize: "42",
      pprice: "99",
      pcateg: "Mens",
    ),

    Productmodal(
      pimage:
      "https://guysworld.in/wp-content/uploads/2019/03/71ygO38MHFL._UL1500_.jpg",
      pcolor: "black",
      pname: "PUMA casual comfort wears",
      pbrand: "puma",
      psize: "L",
      pprice: "89",
      pcateg: "Mens",
    ),
    Productmodal(
      pimage:
      "https://tse2.mm.bing.net/th?id=OIP.uwFLhAj5jzT3MrCVvU0OJgHaJ4&pid=Api&P=0&h=220",
      pcolor: "Grey",
      pname: "Mens casual comfort wears",
      pbrand: "daser",
      psize: "XL",
      pprice: "49",
      pcateg: "Mens",
    ),
    Productmodal(
      pimage:
      "https://tse2.mm.bing.net/th?id=OIP.hncoJa-LlOvbByATzb8X6gHaLH&pid=Api&P=0&h=220",
      pcolor: "pink",
      pname: "Women co_ords set",
      pbrand: "stylish",
      psize: "XL",
      pprice: "129",
      pcateg: "Women",
    ),
    Productmodal(
      pimage:
      "https://kapdavilla.com/images/product/2023/06/m-and-m-2804-style-pure-cotton-ethnic-style-cord-set-size-designs-collection-2023-06-13_15_12_40.jpg",
      pcolor: "pink",
      pname: "Cotton women co_ords set",
      pbrand: "stylish",
      psize: "XL",
      pprice: "99",
      pcateg: "Women",
    ),
    Productmodal(
      pimage:
      "https://pngimg.com/uploads/dress/dress_PNG3.png",
      pcolor: "Black",
      pname: "Womens Casual Top",
      pbrand: "stylish",
      psize: "XL",
      pprice: "29",
      pcateg: "Women",
    ),
    Productmodal(
      pimage:
      "https://tse4.mm.bing.net/th?id=OIP.E13Mlk8fkIbItYuz6qRoSwHaHj&pid=Api&P=0&h=220",
      pcolor: "Silver",
      pname: "Womens Party Wears",
      pbrand: "stylish",
      psize: "XL",
      pprice: "149",
      pcateg: "Women",
    ),

  ];
  Producttofirebase({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FilledButton(onPressed:() async{
        for(int i=0;i<products.length;i++)
         { String docids=getRandomString(15);

            await FirebaseFirestore.instance.collection("Products").doc(docids).set(Productmodal(pid:docids,
                pname: products[i].pname,
              pgender: products[i].pgender,
              pcateg: products[i].pcateg,
              psize: products[i].psize,
              pcolor: products[i].pcolor,
              pimage: products[i].pimage,
              pbrand: products[i].pbrand,
              pcount: products[i].pcount,
              pdesc: products[i].pdesc,
              pprice: products[i].pprice,
            ).toMap());
          }

      }, child:Center(child: const Text("Product add"))),
    );
  }
}
