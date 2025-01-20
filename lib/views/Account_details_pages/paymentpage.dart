import 'package:flutter/material.dart';

class Accountpaymentpage extends StatelessWidget {
  const Accountpaymentpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CREDIT CARD / DEBIT CARD DETAILS",style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 25),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 22,),
          Text("Card number",style: Theme.of(context).textTheme.displayMedium,),
            const SizedBox(height: 5,)
        ,TextField(
        decoration: InputDecoration(
          hintText: "Enter Card Number",
          suffixIcon: const Icon(Icons.credit_card),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        ),),
            const SizedBox(height: 22,),
            Text("Date of Expiry",style: Theme.of(context).textTheme.displayMedium,),
            const SizedBox(height: 5,)
            ,TextField(
              onTap: () async{
              },
              decoration: InputDecoration(
                hintText: "Enter Card Number",
                suffixIcon: const Icon(Icons.calendar_month),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),),
            const SizedBox(height: 22,),
            Text("Name on card",style: Theme.of(context).textTheme.displayMedium,),
        const SizedBox(height: 5,)
            ,TextField(
              decoration: InputDecoration(
                hintText: "Enter name on card",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),),
            const SizedBox(
              height: 22,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(width:double.infinity,child: FilledButton(onPressed: (){}, child: const Text("Save card"))),
            )
          ],
        ),
      )
    );
  }
}
