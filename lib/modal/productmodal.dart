import 'dart:core';

class Productmodal
{
  String? pid;
   String? pname;
   String? pcateg;
   String? pimage;
   String? pcolor;
   String? pcount;
  String? psize;
  String? pprice;
   String? pdesc;
   String? pbrand;
   String? pgender;
   bool? pexist;
   Productmodal({
     this.pid,
     this.pname,
     this.pcateg,
     this.pimage,
     this.pcolor,
     this.pcount,
     this.psize,
     this.pprice,
     this.pdesc,
     this.pbrand,
     this.pgender,
     this.pexist=false, //assign value in constructor to change as needed
   });

  Map<String, dynamic> toMap() {
    return {
      'pid': pid,
      'pname': pname,
      'pcateg': pcateg,
      'pimage': pimage,
      'pcolor': pcolor,
      'pcount': pcount,
      'psize': psize,
      'pprice': pprice,
      'pdesc': pdesc,
      'pbrand': pbrand,
      'pgender': pgender,
      'pexist': pexist,
    };
  }

  factory Productmodal.fromMap(Map<String, dynamic> map) {
    return Productmodal(
      pid: map['pid'] ,
      pname: map['pname'] ,
      pcateg: map['pcateg'],
      pimage: map['pimage'] ,
      pcolor: map['pcolor'] ,
      pcount: map['pcount'] ,
      psize: map['psize'] ,
      pprice: map['pprice'] ,
      pdesc: map['pdesc'] ,
      pgender: map['pgender'] ,
      pexist: map['pexist'] ,
    );
  }
}