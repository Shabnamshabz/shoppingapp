import 'package:projectshoppingapp/modal/cartmodal.dart';
import 'package:projectshoppingapp/modal/productmodal.dart';

class OrderModal {
  String? oid;
  String? userid;
  double? total;
  List<Cartmodal>? cartProducts;
  OrderModal({this.oid, this.total, this.cartProducts,this.userid});
  factory OrderModal.fromMap(Map<String, dynamic> json) {
    return OrderModal(
      oid: json["id"],
      total: json["total"],
      userid: json["userid"],
      cartProducts: json["cartProducts"] == null
          ? []
          : List<Cartmodal>.from(
              json["cartProducts"]!.map((x) => Cartmodal.fromMap(x))),
    );
  }
  Map<String, dynamic> toMap() => {
        "id": oid,
        "total": total,
        "userid": userid,
        "cartProducts": cartProducts == null
            ? []
            : List<dynamic>.from(cartProducts!.map((x) => x.toMap())),
      };
}
