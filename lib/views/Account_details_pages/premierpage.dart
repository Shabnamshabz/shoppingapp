import 'package:flutter/material.dart';

class Accountpremierpage extends StatelessWidget {
  const Accountpremierpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("ADD GIFT CARD",style: TextStyle(fontSize: 35,color: Colors.blue,fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 22,),
            Text("Enter the long number and scratch off the panel on your card to reveal your pin as shown below",style: Theme.of(context).textTheme.displayMedium,)
          ,const SizedBox(height: 22,),
            const SizedBox(
              height: 210,
              width: 250,
              child: Card(
                child: SizedBox(
                  child: Column(
                    children: [
                      Text("Back of Gift Card"),
                      SizedBox(height: 5,),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("12324343544656"),
                          Text("6789"),
                        ],
                      ),
                      Image(image: NetworkImage("https://tse1.mm.bing.net/th?id=OIP.E4Cznox5IvyHUJsNwkROqwHaEq&pid=Api&P=0&h=220"),fit: BoxFit.fitHeight,)
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12,),
            Text("16-DIGIT-CODE",style: Theme.of(context).textTheme.displayMedium,)
            ,TextField(
              decoration: InputDecoration(
                hintText: "Enter 16 digit-code",
                labelText: "16 digit code",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
              ),
            ),
            const SizedBox(height: 5,),
            Text("4-DIGIT-PIN",style: Theme.of(context).textTheme.displayMedium,)
            ,TextField(
              decoration: InputDecoration(
                  hintText: "Enter 16 digit-code",
                  labelText: "16 digit code",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),

            ),
            const SizedBox(
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(width: double.infinity,child: FilledButton(onPressed: (){}, child: const Text("Add Gift Cards"))),
            )
          ],
        ),
      ),
    );
  }
}
