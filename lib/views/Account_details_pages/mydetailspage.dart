import 'package:flutter/material.dart';
class Mydetailspage extends StatelessWidget {
  const Mydetailspage({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            Text("First name",style: Theme.of(context).textTheme.displayMedium,),
            const SizedBox(height: 5,)
            ,TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),),
            const SizedBox(height: 22,),
            Text("Last name",style: Theme.of(context).textTheme.displayMedium,),
            const SizedBox(height: 5,)
            ,TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),),
            const SizedBox(height: 22,),
            Text("E-mail Address",style: Theme.of(context).textTheme.displayMedium,),
            const SizedBox(height: 5,)
            ,TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),),
            const SizedBox(height: 22,),
            Text("Date Of Birth",style: Theme.of(context).textTheme.displayMedium,),
            const SizedBox(height: 5,)
            ,TextField(
              decoration: InputDecoration(
                suffixIcon: IconButton(onPressed: (){},icon: const Icon(Icons.calendar_month),),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),),
            const SizedBox(height: 22,),
            Text("Gender",style: Theme.of(context).textTheme.displayMedium,),
            const SizedBox(height: 5,)
            ,TextField(
              decoration: InputDecoration(
                suffixIcon: IconButton(onPressed: (){
                },icon: const Icon(Icons.arrow_drop_down_sharp),),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),),
            const SizedBox(height: 22,),
            SizedBox(width: double.infinity,
                height: 50,
                child: FilledButton(onPressed: (){}, child: Text("Save Changes",style: Theme.of(context).textTheme.displayMedium,)))
          ],
        ),
      ),
    );
  }
}