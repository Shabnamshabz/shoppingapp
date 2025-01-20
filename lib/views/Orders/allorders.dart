import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectshoppingapp/modal/ordermodal.dart';

class Orderfulldisplay extends StatelessWidget {
  const Orderfulldisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('Orders').where("userid",isEqualTo:FirebaseAuth.instance.currentUser?.uid).get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var data =
                    OrderModal.fromMap(snapshot.data!.docs[index].data());
                return ExpansionTile(
                  title: Text(data.oid!),
                  subtitle: Text('Total Products ${data.cartProducts!.length}'),
                  children: List.generate(
                    data.cartProducts!.length,
                    (ind) {
                      var product = data.cartProducts![ind];
                      return ListTile(
                        title: Text(product.product.pname.toString()),
                        subtitle: Text(product.product.pprice.toString()),
                      );
                    },
                  ),
                );
              },
            );
          }
          return Text('error');
        },
      ),
    );
  }
}
