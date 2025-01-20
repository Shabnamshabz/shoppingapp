import 'package:flutter/material.dart';
import 'package:projectshoppingapp/views/Productsdisplay/category.dart';



import '../../Common widgets/cardwidget.dart';

class Searchpage extends StatelessWidget {
  const Searchpage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title:Center(child: Text("Categories", style: Theme.of(context).textTheme.displayLarge,)),),
         body: Column(
           children: [
             TabBar(
                 padding: const EdgeInsets.all(10),
                 dividerHeight: 2,
                 dividerColor: Colors.blue,
                 indicatorColor: Colors.red,
                 labelColor: Colors.blue,
                 labelStyle:Theme.of(context).textTheme.displayMedium,

                 tabs: const [Text("Women"),Text("Men")]),
             Expanded(
               child: SizedBox(
                 height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                 child: TabBarView(
                     children: [
                   Column(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       Cardwidget(textname: 'NEW IN',imageurl: 'https://tse3.mm.bing.net/th?id=OIP.OC1wY-nlgrE56OKlf11QdwHaHJ&pid=Api&P=0&h=220',ontapfunction: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryDisplayPage(category: "Women"),));
                       },),
                       Cardwidget(textname: "Clothing",ontapfunction:(){ Navigator.push(context, MaterialPageRoute(builder: (context) =>CategoryDisplayPage(category: "Women")));} ,imageurl: "https://tse4.mm.bing.net/th?id=OIP.L8jB0J9qpiBP0b6Dsvq7hAAAAA&pid=Api&P=0&h=220"),
                       const Cardwidget(textname: "Shoes", imageurl: "https://tse1.mm.bing.net/th?id=OIP.cCxWCa_-G9zVbUaNAiU0GgHaEj&pid=Api&P=0&h=220"),
                       const Cardwidget(textname: "Accessories", imageurl: "https://tse3.mm.bing.net/th?id=OIP.jQeST07NShNCw6hncfR7hAHaE6&pid=Api&P=0&h=220")
                     ],

                   ),
                   Column(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       Cardwidget(textname:"NEW IN" , imageurl:"https://tse2.mm.bing.net/th?id=OIP.8KhiM8_AbQtGWUzEt_2hrwHaG_&pid=Api&P=0&h=220",ontapfunction: (){

                         Navigator.push(context, MaterialPageRoute(builder: (context) =>CategoryDisplayPage(category: "Mens")));  },),
                       Cardwidget(textname: "Clothing", imageurl: "https://tse1.mm.bing.net/th?id=OIP.BXPav46zzCT_LQwvXBf4ywHaJf&pid=Api&P=0&h=220",ontapfunction: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryDisplayPage(category: "Mens")));},),
                       const Cardwidget(textname: "SHOES", imageurl: "https://tse3.mm.bing.net/th?id=OIP.1RfKeDjiffAd7MnXDykgcQAAAA&pid=Api&P=0&h=220"),
                       const Cardwidget(textname: "ACCESSORIES", imageurl: "https://tse4.mm.bing.net/th?id=OIP.n_kM8i2-PyBlmmYXgVEyugHaDp&pid=Api&P=0&h=220")
                     ],
                   )
                 
                 ]),
               ),
             )

           ],
         ),
      ),
    );
  }
}
