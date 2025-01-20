import 'package:flutter/material.dart';
class OrderModelWidget extends StatelessWidget {
  final String imageurl;
  final String title;
  final String size;
  final String price;
  final String quantity;
  const OrderModelWidget({super.key,
    required this.imageurl,required this.title,required this.size,required this.price,required this.quantity
     });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [

        Image(
          height: 100,
          width: 100,
          image: NetworkImage(
              imageurl ),
          fit: BoxFit.cover,
        ),
        //"https://tse1.mm.bing.net/th?id=OIP.cjLGdnddziH-G0hmyRnb6wHaHa&pid=Api&P=0&h=220"
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),


                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("size:$size"),
                    const SizedBox(width: 10,),
                  ],
                ),
                Text(
                  price,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),

                const SizedBox(width: 50,),



              ]
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text("TOTAL:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        //     Text("246aed",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
        //   ],
        // ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: SizedBox(width: double.infinity,
        //       child: FilledButton(onPressed: (){
        //         Navigator.push(context, MaterialPageRoute(builder: (context) =>const CheckOutPage(),));
        //       }, child:const Text("CheckOut"))),
        // )
      ],
    );
  }
}
