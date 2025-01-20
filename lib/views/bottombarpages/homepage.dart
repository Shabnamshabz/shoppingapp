import 'package:flutter/material.dart';
import 'package:projectshoppingapp/views/FIrstPages/On_boarding_firstpage.dart';
import 'package:projectshoppingapp/views/FIrstPages/splashpagelogo.dart';

import 'package:projectshoppingapp/views/Productsdisplay/category.dart';

import 'package:projectshoppingapp/views/bottombarpages/cartpage.dart';
import 'package:projectshoppingapp/views/bottombarpages/userprofilepage.dart';

import '../../Common widgets/cardwidget.dart';
import '../../Common widgets/gridimagewidget.dart';
import '../../Common widgets/iconcardwidget.dart';
import '../../respository/authentication_repository.dart';



class Homepage extends StatelessWidget {
  final List<String> brands = [
    "NIKE",
    "ADIDAS",
    "VAN",
    "NORTH FACE",
    "CALVIC KLEIN",
    "COLLUSION",
    "CHAMPION",
    "FREDBERRY",
    "FILA",
    "Tommy Hilfiger",
    "Carhattvipp",
    "Puma",
    "levis"
  ];
  final List<String> collection = [
    "Womens Fashion",
    "Mens Fashion",
    "Kids Fashion",
    "BABY"
  ];
  //List<String> Imageurl=["assets/dress.jpeg","assets/men.jpg","assets/kids.jpeg","assets/Baby.jpeg"];
  final List<String> imageurl = [
    "https://purepng.com/public/uploads/large/purepng.com-women-dressclothingwomen-dressfashion-women-dress-cloth-apparel-631522326975ia8xr.png",
    "https://purepng.com/public/uploads/large/purepng.com-men-t-shirtclothingmen-t-shirtfashion-dress-shirt-cloth-tshirt-631522326839zoswy.png",
    "https://www.pngmart.com/files/23/Kids-Wear-PNG-Transparent.png",
    "https://static.vecteezy.com/system/resources/previews/037/251/853/non_2x/cute-baby-clothes-png.png"
  ];
  final List<Gridimagewidget> grids = [
    Gridimagewidget(
        imageurl: "https://www.pngmart.com/files/22/Graphic-T-Shirt-PNG-HD.png",
        title: "the graphic t-shirts",
        subtitle: "fine print"),
    Gridimagewidget(
        imageurl:
            "https://www.pngall.com/wp-content/uploads/4/Short-Skirt-Transparent.png",
        title: "summer co-ords",
        subtitle: "just add kicks"),
    Gridimagewidget(
        imageurl:
            "https://tse4.mm.bing.net/th?id=OIP.-N72F6-BF8cl65ir_ZCyGQHaHa&pid=Api&P=0&h=220",
        title: "sandals",
        subtitle: "stay cool"),
    Gridimagewidget(
        imageurl:
            "https://pluspng.com/img-png/review-shades-it-cosmetics-holiday-2015-makeup-collection-best-selling-qvc-products-eyeshadow-palettes-lip-sets-1500.png",
        title: "face covering",
        subtitle: "washable"),
  ];
  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const DrawerHeader(child: Text("Settings"),),
            TextButton(onPressed: (){
               Navigator.push(context,MaterialPageRoute(builder: (context) => Userprofilepage(),));
            }, child:Text("User Profile"),),
            ElevatedButton(onPressed: (){
              AuthenticationRepository logout=AuthenticationRepository();
              logout.signout();
             Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>Splashpage(),), (route) => false,);
            }, child:Text("SignOut"),)

          ],
        ),
      ),
      appBar: AppBar(
        title: Text("You&Me World!",
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: Colors.blue,
                fontSize: 30,
                fontFamily: "serif",
                fontWeight: FontWeight.bold)),
        actions: [
          //IconButton(onPressed: (){}, icon: Icon(Icons.person)),

          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Cartpage(),));
          }, icon: const Icon(Icons.shopping_cart)),
        ],
      ),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Text("You&Me World!",style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.blue,fontSize: 30,fontFamily: "serif",fontWeight: FontWeight.bold)),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: const Card(
                          child: Image(
                        image: NetworkImage(
                            "https://static.vecteezy.com/system/resources/previews/002/006/774/large_2x/paper-art-shopping-online-on-smartphone-and-new-buy-sale-promotion-backgroud-for-banner-market-ecommerce-free-vector.jpg"),
                        fit: BoxFit.cover,
                      ))),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconCardWidget(
                          iconname: "Women",
                          imageurl:
                              "https://purepng.com/public/uploads/large/purepng.com-women-dressclothingwomen-dressfashion-women-dress-cloth-apparel-631522326975ia8xr.png",
                          colourname: Colors.purpleAccent,
                          onpressedfunction: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryDisplayPage(category: "Women"),));
                          },
                        ),
                        IconCardWidget(
                            iconname: "Men",
                            colourname: Colors.purpleAccent,
                            imageurl:
                                "https://1.bp.blogspot.com/-VY-I2MUVqQo/XWOso131u_I/AAAAAAAADJY/NncUPA7756EVpmIUz6n3Q43GK-fFHrD_wCLcBGAs/s1600/Mens%2BDress%2Bwhite%2BShirt%2Band%2BBlue%2Bcoat%2BPNG%2BDownload%2Bfree.png",onpressedfunction: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryDisplayPage(category: "Mens"),));
                        },),

                        IconCardWidget(
                            iconname: "Kids",
                            colourname: Colors.purpleAccent,
                            imageurl:
                                "https://www.pngmart.com/files/23/Kids-Wear-PNG-Transparent.png",
                          onpressedfunction: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryDisplayPage(category: "Kids"),));
                          },),
                        IconCardWidget(
                            iconname: "Baby",
                            colourname: Colors.purpleAccent,
                            imageurl:
                                "https://static.vecteezy.com/system/resources/previews/037/251/853/non_2x/cute-baby-clothes-png.png",
                          onpressedfunction: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryDisplayPage(category: "Baby")));
                          },)
                      ],
                    ),
                  ),
                  Cardwidget(
                      textname: "NEW TREND",
                      imageurl:
                          "https://www.pngmart.com/files/15/Fashion-Woman-PNG-Transparent.png",
                  ontapfunction: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>CategoryDisplayPage(category: "Women")));
                  },),
                  SizedBox(
                    height: 430, //space for grid
                    width: double.infinity,
                    child: GridView.builder(
                      //scrollDirection: Axis.horizontal,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1,
                        crossAxisCount: 2,
                      ),
                      itemCount: grids.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: Card(
                            child: Column(
                              children: [
                                Expanded(
                                    child: Image(
                                  image: NetworkImage(grids[index].imageurl),
                                  fit: BoxFit.cover,
                                )),
                                Text(grids[index].title),
                                Text(grids[index].subtitle),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Cardwidget(
                    ontapfunction: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryDisplayPage(category: "Mens"),));
                    },
                      textname: "STRIPES",
                      subtitlename: "The line kings",
                      imageurl:
                          "https://pngimg.com/uploads/dress_shirt/dress_shirt_PNG8094.png"),
                  Cardwidget(
                      ontapfunction: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryDisplayPage(category: "Women"),));
                      },
                      textname: "SUMMER SEA",
                      imageurl:
                          "https://pluspng.com/img-png/clothing-hd-png-model-png-hd-png-image-600.png"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recently viewed",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.close,
                            color: Colors.red,
                          ))
                    ],
                  ),
                  SingleChildScrollView(
                    child: Row(
                      children: [
                        SizedBox(height: 320, width: 200, child: Card(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const Image(image: NetworkImage("https://tse4.mm.bing.net/th?id=OIP.077N83KIUGLUO-cVWeBYDAHaJS&pid=Api&P=0&h=220"),fit: BoxFit.cover,),
                                Row(mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(onPressed: (){}, icon: const Icon(Icons.favorite,color: Colors.red,))
                                  ],
                                ),

                                const Text("pull and bear slimshirt"),
                                const Text("t-shirts in rib and white")
                              ],
                            ),
                          ),
                        )),
                        SizedBox(height: 320, width: 200, child: Card(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const Image(image: NetworkImage("https://tse4.mm.bing.net/th?id=OIP.RN6si-32wKhaluk7_19JcgHaId&pid=Api&P=0&h=220")),
                                Row(mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(onPressed: (){}, icon: const Icon(Icons.favorite))
                                  ],
                                ),
                                const SizedBox(height: 12,),
                                const Text("pull and bear slimshirt"),
                                const Text("t-shirts in rib and white")
                              ],
                            ),
                          ),
                        ))
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Saved Items",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "View all",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: Card(
                      child: ListTile(
                        leading: Image.network(
                            "https://tse3.mm.bing.net/th?id=OIP.OC1wY-nlgrE56OKlf11QdwHaHJ&pid=Api&P=0&h=220"),
                        title: const Text("Handbag Lv"),
                        subtitle: const Text("225"),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: Card(
                      child: ListTile(
                        leading: Image.network(
                            "https://www.pngmart.com/files/22/Graphic-T-Shirt-PNG-HD.png"),
                        title: const Text("T-Shirts"),
                        subtitle: const Text("123"),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Brands you may like",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ],
                  ),
                  Wrap(
                      children: List.generate(
                    brands.length,
                    (index) {
                      return Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child:GestureDetector(
                              child: SizedBox(
                                width: 100,
                                height: 30,
                                child: Card(
                                  child: Center(child: Text(brands[index])),
                                ),
                              )));
                    },
                  )),


                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Styles based on your shopping habit",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(height: 450, width: 200, child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: Column(
                              children: [
                                const Image(image: NetworkImage("https://tse4.mm.bing.net/th?id=OIP.077N83KIUGLUO-cVWeBYDAHaJS&pid=Api&P=0&h=220")),
                                Row(mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Text("just add kicks"),
                                    IconButton(onPressed: (){}, icon: const Icon(Icons.favorite,color: Colors.red,))
                                  ],
                                ),
                            
                                Row(
                                  children: [
                                    const Text("75aed"),
                                    IconButton(onPressed: (){}, icon: const Icon(Icons.thumb_down))
                                  ],
                                ),
                            
                              ],
                            ),
                          ),
                        ),
                      )),
                      SizedBox(height: 450, width: 200, child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: Column(
                              children: [
                                const SizedBox(height: 32,),
                                const Image(image: NetworkImage("https://tse4.mm.bing.net/th?id=OIP.RrNoC8rXPOUrRITDad7ehwHaHa&pid=Api&P=0&h=220")),
                                Row(mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Text("just add kicks"),
                                    IconButton(onPressed: (){}, icon: const Icon(Icons.favorite,color: Colors.red,))
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text("85aed"),
                                    IconButton(onPressed: (){}, icon: const Icon(Icons.thumb_down))
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                      )),


                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


