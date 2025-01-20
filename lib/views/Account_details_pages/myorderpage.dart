import 'package:flutter/material.dart';
class Myorderpage extends StatelessWidget {
  const Myorderpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("MY DETAILS",style: Theme.of(context).textTheme.displayLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.50,
              width: double.infinity,
              child: CircleAvatar(
                child: Column(
                  children: [
                    const SizedBox(height: 62,),
                    const Image(image: NetworkImage("https://tse4.mm.bing.net/th?id=OIP.sHYZYdTupePuWIgK2SGvzwHaGL&pid=Api&P=0&h=220")),
                    const SizedBox(height: 12,),
                    Text("You Currently Have No Orders",style: Theme.of(context).textTheme.displayMedium,)
                  ],
                ),
              ),
            ),

            SizedBox(width: double.infinity,
                height: 50,
                child: FilledButton(onPressed: (){}, child: Text("Start Shopping",style: Theme.of(context).textTheme.displayMedium,)))
          ],
        ),
      ),
    );
  }
}
