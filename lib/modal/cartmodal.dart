import 'package:projectshoppingapp/modal/productmodal.dart';

class Cartmodal
{
  String cartId;
  int quantity;
  Productmodal product;
  Cartmodal({required this.cartId,required this.quantity,required this.product});

  //paste in quicktype as key-value pair, to get proper code or else while using generate method, for this set of code as classname name as datatype,edit the tomap() and frommap() of datatype productmodal

  Map<String, dynamic> toMap() {
    return {
      //green color-server name,pink-dart name, most probably it will be different name in server(like underscore)
      'cart_id': this.cartId,//value
      'quantity': this.quantity,//value
      'product': this.product.toMap(), //product is not a value,its an instance; thus edited, product is type of product modal,thus convert tomap()
    };
  }
//mapping of server to dart; green color to the variable here; cart_id:servername(json type,map),cartId-dart
  factory Cartmodal.fromMap(Map<String, dynamic> map) {
    return Cartmodal(
      cartId: map['cart_id'] as String,
      quantity: map['quantity'] as int,
      product:Productmodal.fromMap(map['product']),//edited,convereted to instance
    );
  }
}